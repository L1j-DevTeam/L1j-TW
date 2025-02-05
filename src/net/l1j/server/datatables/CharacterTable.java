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
package net.l1j.server.datatables;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

import net.l1j.L1DatabaseFactory;
import net.l1j.server.model.instance.L1PcInstance;
import net.l1j.server.model.map.L1Map;
import net.l1j.server.model.map.L1WorldMap;
import net.l1j.server.storage.CharacterStorage;
import net.l1j.server.storage.mysql.MySqlCharacterStorage;
import net.l1j.server.templates.L1CharName;
import net.l1j.util.SQLUtil;

public class CharacterTable {
	private final static Logger _log = Logger.getLogger(CharacterTable.class.getName());

	private CharacterStorage _charStorage;

	private static CharacterTable _instance;

	private final Map<String, L1CharName> _charNameList = new ConcurrentHashMap<String, L1CharName>();

	private CharacterTable() {
		_charStorage = new MySqlCharacterStorage();
	}

	public static CharacterTable getInstance() {
		if (_instance == null) {
			_instance = new CharacterTable();
		}
		return _instance;
	}

	public void storeNewCharacter(L1PcInstance pc) throws Exception {
		synchronized (pc) {
			_charStorage.createCharacter(pc);
			String name = pc.getName();
			if (!_charNameList.containsKey(name)) {
				L1CharName cn = new L1CharName();
				cn.setName(name);
				cn.setId(pc.getId());
				_charNameList.put(name, cn);
			}
			_log.finest("storeNewCharacter");
		}
	}

	public void storeCharacter(L1PcInstance pc) throws Exception {
		synchronized (pc) {
			_charStorage.storeCharacter(pc);
			_log.finest("storeCharacter: " + pc.getName());
		}
	}

	public void deleteCharacter(String accountName, String charName) throws Exception {
		// 多分、同期は必要ない
		_charStorage.deleteCharacter(accountName, charName);
		if (_charNameList.containsKey(charName)) {
			_charNameList.remove(charName);
		}
		_log.finest("deleteCharacter");
	}

	public L1PcInstance restoreCharacter(String charName) throws Exception {
		L1PcInstance pc = _charStorage.loadCharacter(charName);
		return pc;
	}

	public L1PcInstance loadCharacter(String charName) throws Exception {
		L1PcInstance pc = null;
		try {
			pc = restoreCharacter(charName);

			// マップの範圍外ならSKTに移動させる
			L1Map map = L1WorldMap.getInstance().getMap(pc.getMapId());

			if (!map.isInMap(pc.getX(), pc.getY())) {
				pc.setLocation(33087, 33396, 4);
			}

			/*
			 * if(l1pcinstance.getClanid() != 0) { L1Clan clan = new L1Clan();
			 * ClanTable clantable = new ClanTable(); clan =
			 * clantable.getClan(l1pcinstance.getClanname());
			 * l1pcinstance.setClanname(clan.GetClanName()); }
			 */
			_log.finest("loadCharacter: " + pc.getName());
		} catch (Exception e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		}
		return pc;

	}

	public static void clearOnlineStatus() {
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("UPDATE characters SET OnlineStatus=0");
			pstm.execute();
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(pstm, con);
		}
	}

	public static void updateOnlineStatus(L1PcInstance pc) {
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("UPDATE characters SET OnlineStatus=? WHERE objid=?");
			pstm.setInt(1, pc.getOnlineStatus());
			pstm.setInt(2, pc.getId());
			pstm.execute();
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(pstm, con);
		}
	}

	public static void updatePartnerId(int targetId) {
		updatePartnerId(targetId, 0);
	}

	public static void updatePartnerId(int targetId, int partnerId) {
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("UPDATE characters SET PartnerID=? WHERE objid=?");
			pstm.setInt(1, partnerId);
			pstm.setInt(2, targetId);
			pstm.execute();
		} catch (Exception e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(pstm, con);
		}
	}

	public static void saveCharStatus(L1PcInstance pc) {
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("UPDATE characters SET OriginalStr= ?, OriginalCon= ?, OriginalDex= ?, OriginalCha= ?, OriginalInt= ?, OriginalWis= ? WHERE objid=?");
			pstm.setInt(1, pc.getBaseStr());
			pstm.setInt(2, pc.getBaseCon());
			pstm.setInt(3, pc.getBaseDex());
			pstm.setInt(4, pc.getBaseCha());
			pstm.setInt(5, pc.getBaseInt());
			pstm.setInt(6, pc.getBaseWis());
			pstm.setInt(7, pc.getId());
			pstm.execute();
		} catch (Exception e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(pstm, con);
		}
	}

	public void restoreInventory(L1PcInstance pc) {
		pc.getInventory().loadItems();
		pc.getDwarfInventory().loadItems();
		pc.getDwarfForElfInventory().loadItems();
	}

	public static boolean doesCharNameExist(String name) {
		boolean result = true;
		java.sql.Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("SELECT account_name FROM characters WHERE char_name=?");
			pstm.setString(1, name);
			rs = pstm.executeQuery();
			result = rs.next();
		} catch (SQLException e) {
			_log.warning("could not check existing charname:" + e.getMessage());
		} finally {
			SQLUtil.close(rs, pstm, con);
		}
		return result;
	}

	public void loadAllCharName() {
		L1CharName cn = null;
		String name = null;
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("SELECT * FROM characters");
			rs = pstm.executeQuery();
			while (rs.next()) {
				cn = new L1CharName();
				name = rs.getString("char_name");
				cn.setName(name);
				cn.setId(rs.getInt("objid"));
				_charNameList.put(name, cn);
			}
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(rs, pstm, con);
		}
	}

	public L1CharName[] getCharNameList() {
		return _charNameList.values().toArray(new L1CharName[_charNameList.size()]);
	}
}
