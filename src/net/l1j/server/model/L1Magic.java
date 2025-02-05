/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 *
 * http://www.gnu.org/copyleft/gpl.html
 */
package net.l1j.server.model;

import net.l1j.Config;
import net.l1j.server.ActionCodes;
import net.l1j.server.WarTimeController;
import net.l1j.server.datatables.SkillsTable;
import net.l1j.server.model.id.SystemMessageId;
import net.l1j.server.model.instance.L1DollInstance;
import net.l1j.server.model.instance.L1ItemInstance;
import net.l1j.server.model.instance.L1NpcInstance;
import net.l1j.server.model.instance.L1PcInstance;
import net.l1j.server.model.instance.L1PetInstance;
import net.l1j.server.model.instance.L1SummonInstance;
import net.l1j.server.serverpackets.S_DoActionGFX;
import net.l1j.server.serverpackets.S_ServerMessage;
import net.l1j.server.serverpackets.S_SkillSound;
import net.l1j.server.templates.L1Skills;
import net.l1j.server.types.Base;
import net.l1j.util.RandomArrayList;

import static net.l1j.server.model.skill.SkillId.*;

public class L1Magic {
	/**
	private int _calcType;
	private final int PC_PC = 1;
	private final int PC_NPC = 2;
	private final int NPC_PC = 3;
	private final int NPC_NPC = 4;*/
	private int _calcType;
	private final static int PC_PC = Base.TARGET_TYPE[1];
	private final static int PC_NPC = Base.TARGET_TYPE[2];
	private final static int NPC_PC = Base.TARGET_TYPE[3];
	private final static int NPC_NPC = Base.TARGET_TYPE[4];

	private L1PcInstance _pc = null;

	private L1PcInstance _targetPc = null;

	private L1NpcInstance _npc = null;

	private L1NpcInstance _targetNpc = null;

	private int _leverage = 10; // 1/10倍で表現する。

	public void setLeverage(int i) {
		_leverage = i;
	}

	private int getLeverage() {
		return _leverage;
	}

	public L1Magic(L1Character attacker, L1Character target) {
		if (attacker instanceof L1PcInstance) {
			if (target instanceof L1PcInstance) {
				_calcType = PC_PC;
				_pc = (L1PcInstance) attacker;
				_targetPc = (L1PcInstance) target;
			} else {
				_calcType = PC_NPC;
				_pc = (L1PcInstance) attacker;
				_targetNpc = (L1NpcInstance) target;
			}
		} else {
			if (target instanceof L1PcInstance) {
				_calcType = NPC_PC;
				_npc = (L1NpcInstance) attacker;
				_targetPc = (L1PcInstance) target;
			} else {
				_calcType = NPC_NPC;
				_npc = (L1NpcInstance) attacker;
				_targetNpc = (L1NpcInstance) target;
			}
		}
	}

	/* ■■■■■■■■■■■■■■■ 魔法共通關數 ■■■■■■■■■■■■■■ */
	private int getSpellPower() {
		int spellPower = 0;
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			spellPower = _pc.getSp();
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			spellPower = _npc.getSp();
		}
		return spellPower;
	}

	private int getMagicLevel() {
		int magicLevel = 0;
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			magicLevel = _pc.getMagicLevel();
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			magicLevel = _npc.getMagicLevel();
		}
		return magicLevel;
	}

	private int getMagicBonus() {
		int magicBonus = 0;
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			magicBonus = _pc.getMagicBonus();
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			magicBonus = _npc.getMagicBonus();
		}
		return magicBonus;
	}

	private int getLawful() {
		int lawful = 0;
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			lawful = _pc.getLawful();
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			lawful = _npc.getLawful();
		}
		return lawful;
	}

	private int getTargetMr() {
		int mr = 0;
		if (_calcType == PC_PC || _calcType == NPC_PC) {
			mr = _targetPc.getMr();
		} else {
			mr = _targetNpc.getMr();
		}
		return mr;
	}

	/* ■■■■■■■■■■■■■■ 成功判定 ■■■■■■■■■■■■■ */
	// ●●●● 確率系魔法の成功判定 ●●●●
	// 計算方法
	// 攻擊側ポイント：LV + ((MagicBonus * 3) * 魔法固有係數)
	// 防御側ポイント：((LV / 2) + (MR * 3)) / 2
	// 攻擊成功率：攻擊側ポイント - 防御側ポイント
	public boolean calcProbabilityMagic(int skillId) {
		int probability = 0;
		boolean isSuccess = false;

		// 攻擊者がGM權限の場合100%成功
		if (_pc != null && _pc.isGm()) {
			return true;
		}

		if (_calcType == PC_NPC && _targetNpc != null) {
			int npcId = _targetNpc.getNpcTemplate().get_npcId();
			if (npcId >= 45912 && npcId <= 45915 // 恨みに滿ちたソルジャー＆ソルジャーゴースト
					&& !_pc.hasSkillEffect(STATUS_HOLY_WATER)) {
				return false;
			}
			if (npcId == 45916 // 恨みに滿ちたハメル將軍
					&& !_pc.hasSkillEffect(STATUS_HOLY_MITHRIL_POWDER)) {
				return false;
			}
			if (npcId == 45941 // 咒われた巫女サエル
					&& !_pc.hasSkillEffect(STATUS_HOLY_WATER_OF_EVA)) {
				return false;
			}
			if (npcId == 45752 // バルログ(變身前)
					&& !_pc.hasSkillEffect(STATUS_CURSE_BARLOG)) {
				return false;
			}
			if (npcId == 45753 // バルログ(變身後)
					&& !_pc.hasSkillEffect(STATUS_CURSE_BARLOG)) {
				return false;
			}
			if (npcId == 45675 // ヤヒ(變身前)
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				return false;
			}
			if (npcId == 81082 // ヤヒ(變身後)
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				return false;
			}
			if (npcId == 45625 // 混沌
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				return false;
			}
			if (npcId == 45674 // 死
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				return false;
			}
			if (npcId == 45685 // 墮落
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				return false;
			}
			if (npcId >= 46068 && npcId <= 46091 // 欲望の洞窟側mob
					&& _pc.getTempCharGfx() == 6035) {
				return false;
			}
			if (npcId >= 46092 && npcId <= 46106 // 影の神殿側mob
					&& _pc.getTempCharGfx() == 6034) {
				return false;
			}
		}

		if (!checkZone(skillId)) {
			return false;
		}
		if (skillId == SKILL_CANCEL_MAGIC) {
			if (_calcType == PC_PC && _pc != null && _targetPc != null) {
				// 自分自身の場合は100%成功
				if (_pc.getId() == _targetPc.getId()) {
					return true;
				}
				// 同じクランの場合は100%成功
				if (_pc.getClanid() > 0 && (_pc.getClanid() == _targetPc.getClanid())) {
					return true;
				}
				// 同じパーティの場合は100%成功
				if (_pc.isInParty()) {
					if (_pc.getParty().isMember(_targetPc)) {
						return true;
					}
				}
				// それ以外の場合、セーフティゾーン內では無效
				if (_pc.getZoneType() == 1 || _targetPc.getZoneType() == 1) {
					return false;
				}
			}
			// 對象がNPC、使用者がNPCの場合は100%成功
			if (_calcType == PC_NPC || _calcType == NPC_PC || _calcType == NPC_NPC) {
				return true;
			}
		}

		// アースバインド中はWB、キャンセレーション以外無效
		if (_calcType == PC_PC || _calcType == NPC_PC) {
			if (_targetPc.hasSkillEffect(SKILL_EARTH_BIND)) {
				if (skillId != SKILL_WEAPON_BREAK && skillId != SKILL_CANCEL_MAGIC) {
					return false;
				}
			}
		} else {
			if (_targetNpc.hasSkillEffect(SKILL_EARTH_BIND)) {
				if (skillId != SKILL_WEAPON_BREAK && skillId != SKILL_CANCEL_MAGIC) {
					return false;
				}
			}
		}

		probability = calcProbability(skillId);

		int rnd = RandomArrayList.getInc(100, 1);
		if (probability > 90) {
			probability = 90; // 最高成功率を90%とする。
		}

		if (probability >= rnd) {
			isSuccess = true;
		} else {
			isSuccess = false;
		}

		// 確率系魔法メッセージ
		if (!Config.ALT_ATKMSG) {
			return isSuccess;
		}
		if (Config.ALT_ATKMSG) {
			if ((_calcType == PC_PC || _calcType == PC_NPC) && !_pc.isGm()) {
				return isSuccess;
			}
			if ((_calcType == PC_PC || _calcType == NPC_PC) && !_targetPc.isGm()) {
				return isSuccess;
			}
		}

		String msg0 = "";
		String msg1 = "受到";
		String msg2 = "";
		String msg3 = "";
		String msg4 = "";

		if (_calcType == PC_PC || _calcType == PC_NPC) { // アタッカーがＰＣの場合
			msg0 = _pc.getName();
		} else if (_calcType == NPC_PC) { // アタッカーがＮＰＣの場合
			msg0 = _npc.getName();
		}

		msg2 = "probability:" + probability + "%";
		if (_calcType == NPC_PC || _calcType == PC_PC) { // ターゲットがＰＣの場合
			msg4 = _targetPc.getName();
		} else if (_calcType == PC_NPC) { // ターゲットがＮＰＣの場合
			msg4 = _targetNpc.getName();
		}
		if (isSuccess == true) {
			msg3 = "成功";
		} else {
			msg3 = "失敗";
		}

		if (_calcType == PC_PC || _calcType == PC_NPC) { // アタッカーがＰＣの場合
			_pc.sendPackets(new S_ServerMessage(SystemMessageId.$166, msg0, msg1, msg2, msg3, msg4));
		}
		if (_calcType == NPC_PC || _calcType == PC_PC) { // ターゲットがＰＣの場合
			_targetPc.sendPackets(new S_ServerMessage(SystemMessageId.$166, msg0, msg1, msg2, msg3, msg4));
		}

		return isSuccess;
	}

	private boolean checkZone(int skillId) {
		if (_pc != null && _targetPc != null) {
			if (_pc.getZoneType() == 1 || _targetPc.getZoneType() == 1) { // セーフティーゾーン
				if (skillId == SKILL_WEAPON_BREAK || skillId == SKILL_SLOW
						|| skillId == SKILL_CURSE_PARALYZE || skillId == SKILL_MANA_DRAIN
						|| skillId == SKILL_DARKNESS || skillId == SKILL_WEAKNESS
						|| skillId == SKILL_DISEASE || skillId == SKILL_DECAY_POTION
						|| skillId == SKILL_MASS_SLOW || skillId == SKILL_ENTANGLE
						|| skillId == SKILL_ERASE_MAGIC || skillId == SKILL_EARTH_BIND
						|| skillId == SKILL_AREA_OF_SILENCE || skillId == SKILL_WIND_SHACKLE
						|| skillId == SKILL_STRIKER_GALE || skillId == SKILL_STUN_SHOCK
						|| skillId == SKILL_FOG_OF_SLEEPING || skillId == SKILL_ICE_LANCE
						|| skillId == SKILL_FREEZING_BLIZZARD
						|| skillId == SKILL_FREEZING_BREATH
						|| skillId == SKILL_POLLUTE_WATER
						|| skillId == SKILL_ELEMENTAL_FALL_DOWN
						|| skillId == SKILL_RETURN_TO_NATURE) {
					return false;
				}
			}
		}
		return true;
	}

	private int calcProbability(int skillId) {
		L1Skills l1skills = SkillsTable.getInstance().getTemplate(skillId);
		int attackLevel = 0;
		int defenseLevel = 0;
		int mr = 0;
		int probability = 0;

		if (_calcType == PC_PC || _calcType == PC_NPC) {
			attackLevel = _pc.getLevel();
		} else {
			attackLevel = _npc.getLevel();
		}

		if (_calcType == PC_PC || _calcType == NPC_PC) {
			defenseLevel = _targetPc.getLevel();
		} else {
			defenseLevel = _targetNpc.getLevel();
			if (skillId == SKILL_RETURN_TO_NATURE) {
				if (_targetNpc instanceof L1SummonInstance) {
					L1SummonInstance summon = (L1SummonInstance) _targetNpc;
					defenseLevel = summon.getMaster().getLevel();
				}
			}
		}

		if (skillId == SKILL_ELEMENTAL_FALL_DOWN || skillId == SKILL_RETURN_TO_NATURE
				|| skillId == SKILL_ENTANGLE || skillId == SKILL_ERASE_MAGIC
				|| skillId == SKILL_AREA_OF_SILENCE || skillId == SKILL_WIND_SHACKLE
				|| skillId == SKILL_STRIKER_GALE || skillId == SKILL_POLLUTE_WATER
				|| skillId == SKILL_EARTH_BIND) {
			// 成功確率は 魔法固有係數 × LV差 + 基本確率
			probability = (int) (((l1skills.getProbabilityDice()) / 10D) * (attackLevel - defenseLevel)) + l1skills.getProbabilityValue();
			// オリジナルINTによる魔法命中
			if (_calcType == PC_PC || _calcType == PC_NPC) {
				probability += 2 * _pc.getOriginalMagicHit();
			}
		} else if (skillId == SKILL_STUN_SHOCK) {
			// 成功確率は 基本確率 + LV差1毎に+-2%
			probability = l1skills.getProbabilityValue() + (attackLevel - defenseLevel) * 2;

			// オリジナルINTによる魔法命中
			if (_calcType == PC_PC || _calcType == PC_NPC) {
				probability += 2 * _pc.getOriginalMagicHit();
			}
		} else if (skillId == SKILL_COUNTER_BARRIER) {
			// 成功確率は 基本確率 + LV差1毎に+-1%
			probability = l1skills.getProbabilityValue() + attackLevel - defenseLevel;

			// オリジナルINTによる魔法命中
			if (_calcType == PC_PC || _calcType == PC_NPC) {
				probability += 2 * _pc.getOriginalMagicHit();
			}
		} else if (skillId == SKILL_GUARD_BRAKE || skillId == SKILL_RESIST_FEAR || skillId == SKILL_HORROR_OF_DEATH) {
			int dice = l1skills.getProbabilityDice();
			int value = l1skills.getProbabilityValue();
			int diceCount = 0;
			diceCount = getMagicBonus() + getMagicLevel();

			if (diceCount < 1) {
				diceCount = 1;
			}

			for (int i = 0; i < diceCount; i++) {
				probability += RandomArrayList.getInc(dice, value);//原寫法 (random.nextInt(dice) + 1 + value)
			}

			probability = probability * getLeverage() / 10;

			//オリジナルINTによる魔法命中
			if (_calcType == PC_PC || _calcType == PC_NPC) {
				probability += 2 * _pc.getOriginalMagicHit();
			}

			if (probability >= getTargetMr()) {
				probability = 100;
			} else {
				probability = 0;
			}
		} else {
			int dice = l1skills.getProbabilityDice();
			int diceCount = 0;
			if (_calcType == PC_PC || _calcType == PC_NPC) {
				if (_pc.isWizard()) {
					diceCount = getMagicBonus() + getMagicLevel() + 1;
				} else if (_pc.isElf()) {
					diceCount = getMagicBonus() + getMagicLevel() - 1;
				} else {
					diceCount = getMagicBonus() + getMagicLevel() - 1;
				}
			} else {
				diceCount = getMagicBonus() + getMagicLevel();
			}
			if (diceCount < 1) {
				diceCount = 1;
			}

			for (int i = 0; i < diceCount; i++) {
				probability += RandomArrayList.getInc(dice, 1);
			}
			probability = probability * getLeverage() / 10;

			probability -= getTargetMr();

			if (skillId == SKILL_TAME_MONSTER) {
				double probabilityRevision = 1;
				if ((_targetNpc.getMaxHp() * 1 / 4) > _targetNpc.getCurrentHp()) {
					probabilityRevision = 1.3;
				} else if ((_targetNpc.getMaxHp() * 2 / 4) > _targetNpc.getCurrentHp()) {
					probabilityRevision = 1.2;
				} else if ((_targetNpc.getMaxHp() * 3 / 4) > _targetNpc.getCurrentHp()) {
					probabilityRevision = 1.1;
				}
				probability *= probabilityRevision;
			}
		}

		// 狀態異常に對する耐性
		if (skillId == SKILL_EARTH_BIND) {
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				probability -= _targetPc.getRegistSustain();
			}
		} else if (skillId == SKILL_STUN_SHOCK) {
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				probability -= 2 * _targetPc.getRegistStun();
			}
		} else if (skillId == SKILL_CURSE_PARALYZE) {
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				probability -= _targetPc.getRegistStone();
			}
		} else if (skillId == SKILL_FOG_OF_SLEEPING) {
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				probability -= _targetPc.getRegistSleep();
			}
		} else if (skillId == SKILL_ICE_LANCE || skillId == SKILL_FREEZING_BLIZZARD || skillId == SKILL_FREEZING_BREATH) {
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				probability -= _targetPc.getRegistFreeze();
			}
		} else if (skillId == SKILL_CURSE_BLIND || skillId == SKILL_DARKNESS || skillId == SKILL_DARK_BLIND) {
			if (_calcType == PC_PC || _calcType == NPC_PC) {
				probability -= _targetPc.getRegistBlind();
			}
		}

		return probability;
	}

	/* ■■■■■■■■■■■■■■ 魔法ダメージ算出 ■■■■■■■■■■■■■■ */

	public int calcMagicDamage(int skillId) {
		int damage = 0;
		if (_calcType == PC_PC || _calcType == NPC_PC) {
			damage = calcPcMagicDamage(skillId);
		} else if (_calcType == PC_NPC || _calcType == NPC_NPC) {
			damage = calcNpcMagicDamage(skillId);
		}

		damage = calcMrDefense(damage);

		return damage;
	}

	// ●●●● プレイヤー へのファイアーウォールの魔法ダメージ算出 ●●●●
	public int calcPcFireWallDamage() {
		int dmg = 0;
		// 符合攻擊無效，則直接傳回
		if(_targetPc.hasInvincibleEffect())
			return dmg;

		double attrDeffence = calcAttrResistance(L1Skills.ATTR_FIRE);
		L1Skills l1skills = SkillsTable.getInstance().getTemplate(SKILL_FIRE_WALL);
		dmg = (int) ((1.0 - attrDeffence) * l1skills.getDamageValue());

		if (dmg < 0) {
			dmg = 0;
		}

		return dmg;
	}

	// ●●●● ＮＰＣ へのファイアーウォールの魔法ダメージ算出 ●●●●
	public int calcNpcFireWallDamage() {
		int dmg = 0;
		// 符合攻擊無效，則直接傳回
		if(_targetNpc.hasInvincibleEffect())
			return dmg;

		double attrDeffence = calcAttrResistance(L1Skills.ATTR_FIRE);
		L1Skills l1skills = SkillsTable.getInstance().getTemplate(SKILL_FIRE_WALL);
		dmg = (int) ((1.0 - attrDeffence) * l1skills.getDamageValue());

		if (dmg < 0) {
			dmg = 0;
		}

		return dmg;
	}

	// ●●●● プレイヤー‧ＮＰＣ から プレイヤー への魔法ダメージ算出 ●●●●
	private int calcPcMagicDamage(int skillId) {
		int dmg = 0;
		if (skillId == SKILL_FINAL_BURN) {
			if (_calcType == PC_PC || _calcType == PC_NPC) {
				dmg = _pc.getCurrentMp();
			} else {
				dmg = _npc.getCurrentMp();
			}
		} else {
			dmg = calcMagicDiceDamage(skillId);
			dmg = (dmg * getLeverage()) / 10;
		}
		// 符合攻擊無效，則直接傳回
		if(_targetPc.hasInvincibleEffect())
			return dmg = 0;

		dmg -= _targetPc.getDamageReductionByArmor(); // 防具によるダメージ輕減

		Object[] targetDollList = _targetPc.getDollList().values().toArray(); // マジックドールによるダメージ輕減
		for (Object dollObject : targetDollList) {
			L1DollInstance doll = (L1DollInstance) dollObject;
			dmg -= doll.getDamageReductionByDoll();
		}

		if (_targetPc.hasSkillEffect(COOKING_1_0_S) // 料理によるダメージ輕減
				|| _targetPc.hasSkillEffect(COOKING_1_1_S)
				|| _targetPc.hasSkillEffect(COOKING_1_2_S)
				|| _targetPc.hasSkillEffect(COOKING_1_3_S)
				|| _targetPc.hasSkillEffect(COOKING_1_4_S)
				|| _targetPc.hasSkillEffect(COOKING_1_5_S)
				|| _targetPc.hasSkillEffect(COOKING_1_6_S)
				|| _targetPc.hasSkillEffect(COOKING_2_0_S)
				|| _targetPc.hasSkillEffect(COOKING_2_1_S)
				|| _targetPc.hasSkillEffect(COOKING_2_2_S)
				|| _targetPc.hasSkillEffect(COOKING_2_3_S)
				|| _targetPc.hasSkillEffect(COOKING_2_4_S)
				|| _targetPc.hasSkillEffect(COOKING_2_5_S)
				|| _targetPc.hasSkillEffect(COOKING_2_6_S)
				|| _targetPc.hasSkillEffect(COOKING_3_0_S)
				|| _targetPc.hasSkillEffect(COOKING_3_1_S)
				|| _targetPc.hasSkillEffect(COOKING_3_2_S)
				|| _targetPc.hasSkillEffect(COOKING_3_3_S)
				|| _targetPc.hasSkillEffect(COOKING_3_4_S)
				|| _targetPc.hasSkillEffect(COOKING_3_5_S)
				|| _targetPc.hasSkillEffect(COOKING_3_6_S)) {
			dmg -= 5;
		}
		if (_targetPc.hasSkillEffect(COOKING_1_7_S) // デザートによるダメージ輕減
				|| _targetPc.hasSkillEffect(COOKING_2_7_S) || _targetPc.hasSkillEffect(COOKING_3_7_S)) {
			dmg -= 5;
		}

		if (_targetPc.hasSkillEffect(SKILL_REDUCTION_ARMOR)) {
			int targetPcLvl = _targetPc.getLevel();
			if (targetPcLvl < 50) {
				targetPcLvl = 50;
			}
			dmg -= (targetPcLvl - 50) / 5 + 1;
		}
		if (_targetPc.hasSkillEffect(SKILL_DRAGON_SKIN)) {
			dmg -= 2;
		}

		if (_targetPc.hasSkillEffect(SKILL_PATIENCE)) {
			dmg -= 2;
		}

		if (_calcType == NPC_PC) { // ペット、サモンからプレイヤーに攻擊
			boolean isNowWar = false;
			int castleId = L1CastleLocation.getCastleIdByArea(_targetPc);
			if (castleId > 0) {
				isNowWar = WarTimeController.getInstance().isNowWar(castleId);
			}
			if (!isNowWar) {
				if (_npc instanceof L1PetInstance) {
					dmg /= 8;
				}
				if (_npc instanceof L1SummonInstance) {
					L1SummonInstance summon = (L1SummonInstance) _npc;
					if (summon.isExsistMaster()) {
						dmg /= 8;
					}
				}
			}
		}

		if (_targetPc.hasSkillEffect(SKILL_IMMUNE_TO_HARM)) {
			dmg /= 2;
		}

		if (_targetPc.hasSkillEffect(SKILL_COUNTER_MIRROR)) {
			if (_calcType == PC_PC) {
				if (_targetPc.getWis() >= RandomArrayList.getInc(100, 1)) {
					_pc.sendPackets(new S_DoActionGFX(_pc.getId(), ActionCodes.ACTION_Damage));
					_pc.broadcastPacket(new S_DoActionGFX(_pc.getId(), ActionCodes.ACTION_Damage));
					_targetPc.sendPackets(new S_SkillSound(_targetPc.getId(), 4395));
					_targetPc.broadcastPacket(new S_SkillSound(_targetPc.getId(), 4395));
					_pc.receiveDamage(_targetPc, dmg, false);
					dmg = 0;
					_targetPc.killSkillEffectTimer(SKILL_COUNTER_MIRROR);
				}
			} else if (_calcType == NPC_PC) {
				int npcId = _npc.getNpcTemplate().get_npcId();
				if (npcId == 45681 || npcId == 45682 || npcId == 45683 || npcId == 45684) {
				} else if (!_npc.getNpcTemplate().get_IsErase()) {
				} else {
					if (_targetPc.getWis() >= RandomArrayList.getInc(100, 1)) {
						_npc.broadcastPacket(new S_DoActionGFX(_npc.getId(), ActionCodes.ACTION_Damage));
						_targetPc.sendPackets(new S_SkillSound(_targetPc.getId(), 4395));
						_targetPc.broadcastPacket(new S_SkillSound(_targetPc.getId(), 4395));
						_npc.receiveDamage(_targetPc, dmg);
						dmg = 0;
						_targetPc.killSkillEffectTimer(SKILL_COUNTER_MIRROR);
					}
				}
			}
		}

		if (dmg < 0) {
			dmg = 0;
		}

		return dmg;
	}

	// ●●●● プレイヤー‧ＮＰＣ から ＮＰＣ へのダメージ算出 ●●●●
	private int calcNpcMagicDamage(int skillId) {
		int dmg = 0;
		if (skillId == SKILL_FINAL_BURN) {
			if (_calcType == PC_PC || _calcType == PC_NPC) {
				dmg = _pc.getCurrentMp();
			} else {
				dmg = _npc.getCurrentMp();
			}
		} else {
			dmg = calcMagicDiceDamage(skillId);
			dmg = (dmg * getLeverage()) / 10;
		}
		// 符合攻擊無效，則直接傳回
		if(_targetNpc.hasInvincibleEffect())
			return dmg = 0;

		if (_calcType == PC_NPC) { // プレイヤーからペット、サモンに攻擊
			boolean isNowWar = false;
			int castleId = L1CastleLocation.getCastleIdByArea(_targetNpc);
			if (castleId > 0) {
				isNowWar = WarTimeController.getInstance().isNowWar(castleId);
			}
			if (!isNowWar) {
				if (_targetNpc instanceof L1PetInstance) {
					dmg /= 8;
				}
				if (_targetNpc instanceof L1SummonInstance) {
					L1SummonInstance summon = (L1SummonInstance) _targetNpc;
					if (summon.isExsistMaster()) {
						dmg /= 8;
					}
				}
			}
		}

		// TODO 吉爾塔斯反擊屏障判斷
		if (_targetNpc.getHiddenStatus() == L1NpcInstance.HIDDEN_STATUS_COUNTER_BARRIER) {
			// _pc.setHeading(_pc.targetDirection(_targetX, _targetY)); // 向きのセット
			// _pc.sendPackets(new S_AttackMissPacket(_pc, _targetNpc));
			// _pc.broadcastPacket(new S_AttackMissPacket(_pc, _targetNpc));
			// _pc.sendPackets(new S_DoActionGFX(_pc.getId(),
			// ActionCodes.ACTION_Damage));
			// _pc.broadcastPacket(new S_DoActionGFX(_pc.getId(),
			// ActionCodes.ACTION_Damage));
			_pc.receiveDamage(_targetNpc, (int) (dmg * 2), true);
			dmg = 0;
		}
		// add end

		if (_calcType == PC_NPC && _targetNpc != null) {
			int npcId = _targetNpc.getNpcTemplate().get_npcId();
			if (npcId >= 45912 && npcId <= 45915 // 恨みに滿ちたソルジャー＆ソルジャーゴースト
					&& !_pc.hasSkillEffect(STATUS_HOLY_WATER)) {
				dmg = 0;
			}
			if (npcId == 45916 // 恨みに滿ちたハメル將軍
					&& !_pc.hasSkillEffect(STATUS_HOLY_MITHRIL_POWDER)) {
				dmg = 0;
			}
			if (npcId == 45941 // 咒われた巫女サエル
					&& !_pc.hasSkillEffect(STATUS_HOLY_WATER_OF_EVA)) {
				dmg = 0;
			}
			if (npcId == 45752 // バルログ(變身前)
					&& !_pc.hasSkillEffect(STATUS_CURSE_BARLOG)) {
				dmg = 0;
			}
			if (npcId == 45753 // バルログ(變身後)
					&& !_pc.hasSkillEffect(STATUS_CURSE_BARLOG)) {
				dmg = 0;
			}
			if (npcId == 45675 // ヤヒ(變身前)
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				dmg = 0;
			}
			if (npcId == 81082 // ヤヒ(變身後)
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				dmg = 0;
			}
			if (npcId == 45625 // 混沌
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				dmg = 0;
			}
			if (npcId == 45674 // 死
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				dmg = 0;
			}
			if (npcId == 45685 // 墮落
					&& !_pc.hasSkillEffect(STATUS_CURSE_YAHEE)) {
				dmg = 0;
			}
			if (npcId >= 46068 && npcId <= 46091 // 欲望の洞窟側mob
					&& _pc.getTempCharGfx() == 6035) {
				dmg = 0;
			}
			if (npcId >= 46092 && npcId <= 46106 // 影の神殿側mob
					&& _pc.getTempCharGfx() == 6034) {
				dmg = 0;
			}
		}

		return dmg;
	}

	// ●●●● damage_dice、damage_dice_count、damage_value、SPから魔法ダメージを算出 ●●●●
	private int calcMagicDiceDamage(int skillId) {
		L1Skills l1skills = SkillsTable.getInstance().getTemplate(skillId);
		int dice = l1skills.getDamageDice();
		int diceCount = l1skills.getDamageDiceCount();
		int value = l1skills.getDamageValue();
		int magicDamage = 0;
		int charaIntelligence = 0;

		for (int i = 0; i < diceCount; i++) {
			magicDamage += RandomArrayList.getInc(dice, 1);
		}
		magicDamage += value;

		if (_calcType == PC_PC || _calcType == PC_NPC) {
			int weaponAddDmg = 0; // 武器による追加ダメージ
			L1ItemInstance weapon = _pc.getWeapon();
			if (weapon != null) {
				weaponAddDmg = weapon.getItem().getMagicDmgModifier();
			}
			magicDamage += weaponAddDmg;
		}

		if (_calcType == PC_PC || _calcType == PC_NPC) {
			int spByItem = _pc.getSp() - _pc.getTrueSp(); // アイテムによるSP變動
			charaIntelligence = _pc.getInt() + spByItem - 12;
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			int spByItem = _npc.getSp() - _npc.getTrueSp(); // アイテムによるSP變動
			charaIntelligence = _npc.getInt() + spByItem - 12;
		}
		if (charaIntelligence < 1) {
			charaIntelligence = 1;
		}

		double attrDeffence = calcAttrResistance(l1skills.getAttr());

		double coefficient = (1.0 - attrDeffence + charaIntelligence * 3.0 / 32.0);
		if (coefficient < 0) {
			coefficient = 0;
		}

		magicDamage *= coefficient;

		double criticalCoefficient = 1.5; // 魔法クリティカル
		int rnd = RandomArrayList.getInc(100, 1);
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			if (l1skills.getSkillLevel() <= 6) {
				if (rnd <= (10 + _pc.getOriginalMagicCritical())) {
					magicDamage *= criticalCoefficient;
				}
			}
		}

		if (_calcType == PC_PC || _calcType == PC_NPC) { // オリジナルINTによる魔法ダメージ
			magicDamage += _pc.getOriginalMagicDamage();
		}
		if (_calcType == PC_PC || _calcType == PC_NPC) { // アバターによる追加ダメージ
			if (_pc.hasSkillEffect(SKILL_ILLUSION_AVATAR)) {
				magicDamage += 10;
			}
		}

		return magicDamage;
	}

	// ●●●● ヒール回復量（對アンデッドにはダメージ）を算出 ●●●●
	public int calcHealing(int skillId) {
		L1Skills l1skills = SkillsTable.getInstance().getTemplate(skillId);
		int dice = l1skills.getDamageDice();
		int value = l1skills.getDamageValue();
		int magicDamage = 0;

		int magicBonus = getMagicBonus();
		if (magicBonus > 10) {
			magicBonus = 10;
		}

		int diceCount = value + magicBonus;
		for (int i = 0; i < diceCount; i++) {
			magicDamage += RandomArrayList.getInc(dice, 1);
		}

		double alignmentRevision = 1.0;
		if (getLawful() > 0) {
			alignmentRevision += (getLawful() / 32768.0);
		}

		magicDamage *= alignmentRevision;

		magicDamage = (magicDamage * getLeverage()) / 10;

		return magicDamage;
	}

	// ●●●● ＭＲによるダメージ輕減 ●●●●
	private int calcMrDefense(int dmg) {
		int mr = getTargetMr();

		double mrFloor = 0;
		if (_calcType == PC_PC || _calcType == PC_NPC) {
			if (mr <= 100) {
				mrFloor = Math.floor((mr - _pc.getOriginalMagicHit()) / 2);
			} else if (mr >= 100) {
				mrFloor = Math.floor((mr - _pc.getOriginalMagicHit()) / 10);
			}
			double mrCoefficient = 0;
			if (mr <= 100) {
				mrCoefficient = 1 - 0.01 * mrFloor;
			} else if (mr >= 100) {
				mrCoefficient = 0.6 - 0.01 * mrFloor;
			}
			dmg *= mrCoefficient;
		} else if (_calcType == NPC_PC || _calcType == NPC_NPC) {
			int rnd = RandomArrayList.getInc(100, 1); //原寫法 int rnd = random.nextInt(100) + 1;
			if (mr >= rnd) {
				dmg /= 2;
			}
		}

		return dmg;
	}

	// ●●●● 屬性によるダメージ輕減 ●●●●
	// attr:0.無屬性魔法,1.地魔法,2.火魔法,4.水魔法,8.風魔法(,16.光魔法)
	private double calcAttrResistance(int attr) {
		int resist = 0;
		if (_calcType == PC_PC || _calcType == NPC_PC) {
			if (attr == L1Skills.ATTR_EARTH) {
				resist = _targetPc.getEarth();
			} else if (attr == L1Skills.ATTR_FIRE) {
				resist = _targetPc.getFire();
			} else if (attr == L1Skills.ATTR_WATER) {
				resist = _targetPc.getWater();
			} else if (attr == L1Skills.ATTR_WIND) {
				resist = _targetPc.getWind();
			}
		} else if (_calcType == PC_NPC || _calcType == NPC_NPC) {
		}

		int resistFloor = (int) (0.32 * Math.abs(resist));
		if (resist >= 0) {
			resistFloor *= 1;
		} else {
			resistFloor *= -1;
		}

		double attrDeffence = resistFloor / 32.0;

		return attrDeffence;
	}

	/* ■■■■■■■■■■■■■■■ 計算結果反映 ■■■■■■■■■■■■■■■ */

	public void commit(int damage, int drainMana) {
		if (_calcType == PC_PC || _calcType == NPC_PC) {
			commitPc(damage, drainMana);
		} else if (_calcType == PC_NPC || _calcType == NPC_NPC) {
			commitNpc(damage, drainMana);
		}

		// ダメージ值及び命中率確認用メッセージ
		if (!Config.ALT_ATKMSG) {
			return;
		}
		if (Config.ALT_ATKMSG) {
			if ((_calcType == PC_PC || _calcType == PC_NPC) && !_pc.isGm()) {
				return;
			}
			if ((_calcType == PC_PC || _calcType == NPC_PC) && !_targetPc.isGm()) {
				return;
			}
		}

		String msg0 = "";
		String msg1 = "受到";
		String msg2 = "";
		String msg3 = "";
		String msg4 = "";

		if (_calcType == PC_PC || _calcType == PC_NPC) {// アタッカーがＰＣの場合
			msg0 = _pc.getName();
		} else if (_calcType == NPC_PC) { // アタッカーがＮＰＣの場合
			msg0 = _npc.getName();
		}

		if (_calcType == NPC_PC || _calcType == PC_PC) { // ターゲットがＰＣの場合
			msg4 = _targetPc.getName();
			msg2 = "THP" + _targetPc.getCurrentHp();
		} else if (_calcType == PC_NPC) { // ターゲットがＮＰＣの場合
			msg4 = _targetNpc.getName();
			msg2 = "THp" + _targetNpc.getCurrentHp();
		}

		msg3 = damage + "傷害值";

		if (_calcType == PC_PC || _calcType == PC_NPC) { // アタッカーがＰＣの場合
			_pc.sendPackets(new S_ServerMessage(SystemMessageId.$166, msg0, msg1, msg2, msg3, msg4));
		}
		if (_calcType == NPC_PC || _calcType == PC_PC) { // ターゲットがＰＣの場合
			_targetPc.sendPackets(new S_ServerMessage(SystemMessageId.$166, msg0, msg1, msg2, msg3, msg4));
		}
	}

	// ●●●● プレイヤーに計算結果を反映 ●●●●
	private void commitPc(int damage, int drainMana) {
		if (_calcType == PC_PC) {
			if (drainMana > 0 && _targetPc.getCurrentMp() > 0) {
				if (drainMana > _targetPc.getCurrentMp()) {
					drainMana = _targetPc.getCurrentMp();
				}
				int newMp = _pc.getCurrentMp() + drainMana;
				_pc.setCurrentMp(newMp);
			}
			_targetPc.receiveManaDamage(_pc, drainMana);
			_targetPc.receiveDamage(_pc, damage, true);
		} else if (_calcType == NPC_PC) {
			_targetPc.receiveDamage(_npc, damage, true);
		}
	}

	// ●●●● ＮＰＣに計算結果を反映 ●●●●
	private void commitNpc(int damage, int drainMana) {
		if (_calcType == PC_NPC) {
			if (drainMana > 0) {
				int drainValue = _targetNpc.drainMana(drainMana);
				int newMp = _pc.getCurrentMp() + drainValue;
				_pc.setCurrentMp(newMp);
			}
			_targetNpc.ReceiveManaDamage(_pc, drainMana);
			_targetNpc.receiveDamage(_pc, damage);
		} else if (_calcType == NPC_NPC) {
			_targetNpc.receiveDamage(_npc, damage);
		}
	}
}
