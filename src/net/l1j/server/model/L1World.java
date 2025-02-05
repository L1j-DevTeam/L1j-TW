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

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.logging.Logger;

import javolution.util.FastTable;

import net.l1j.Config;
import net.l1j.server.WorldMap;
import net.l1j.server.model.instance.L1MerchantInstance;
import net.l1j.server.model.instance.L1MonsterInstance;
import net.l1j.server.model.instance.L1NpcInstance;
import net.l1j.server.model.instance.L1PcInstance;
import net.l1j.server.model.instance.L1PetInstance;
import net.l1j.server.model.instance.L1SummonInstance;
import net.l1j.server.model.map.L1Map;
import net.l1j.server.serverpackets.S_SystemMessage;
import net.l1j.server.serverpackets.ServerBasePacket;
import net.l1j.server.types.Point;

public class L1World {
	private static Logger _log = Logger.getLogger(L1World.class.getName());

	private final ConcurrentHashMap<String, L1PcInstance> _allPlayers;
	private final ConcurrentHashMap<Integer, L1MerchantInstance> _allMerchants;
	private final ConcurrentHashMap<Integer, L1MonsterInstance> _allMonsters;
	private final ConcurrentHashMap<Integer, L1PetInstance> _allPets;
	private final ConcurrentHashMap<Integer, L1SummonInstance> _allSummons;
	private final ConcurrentHashMap<Integer, L1Object> _allObjects;
	private final ConcurrentHashMap<String, L1Clan> _allClans;
	private final CopyOnWriteArrayList<L1War> _allWars;

	private int _weather = 4;

	private boolean _worldChatEnabled = true;

	private boolean _processingContributionTotal = false;

	private static L1World _instance;

	private L1World() {
		_allPlayers = new ConcurrentHashMap<String, L1PcInstance>(); // 全てのプレイヤー
		_allMerchants = new ConcurrentHashMap<Integer, L1MerchantInstance>(); // 全てのNPC
		_allMonsters = new ConcurrentHashMap<Integer, L1MonsterInstance>(); // 全てのNPC
		_allPets = new ConcurrentHashMap<Integer, L1PetInstance>(); // 全てのペット
		_allSummons = new ConcurrentHashMap<Integer, L1SummonInstance>(); // 全てのサモンモンスター
		_allObjects = new ConcurrentHashMap<Integer, L1Object>(); // 全てのオブジェクト(L1ItemInstance入り、L1Inventoryはなし)
		_allClans = new ConcurrentHashMap<String, L1Clan>(); // 全てのクラン(Online/Offlineどちらも)
		_allWars = new CopyOnWriteArrayList<L1War>(); // 全ての戰爭
	}

	public static L1World getInstance() {
		if (_instance == null) {
			_instance = new L1World();
		}
		return _instance;
	}

	/**
	 * 全ての狀態をクリアする。<br>
	 * デバッグ、テストなどの特殊な目的以外で呼び出してはならない。
	 */
	public void clear() {
		_instance = new L1World();
	}

	public void storeObject(L1Object object) {
		if (object == null) {
			throw new NullPointerException();
		}

		_allObjects.put(object.getId(), object);
		if (object instanceof L1PcInstance) {
			_allPlayers.put(((L1PcInstance) object).getName(), (L1PcInstance) object);
		}
		if (object instanceof L1MerchantInstance) {
			_allMerchants.put(((L1MerchantInstance) object).getNpcTemplate().get_npcId(), (L1MerchantInstance) object);
		}
		if (object instanceof L1MonsterInstance) {
			_allMonsters.put(((L1MonsterInstance) object).getNpcTemplate().get_npcId(), (L1MonsterInstance) object);
		}
		if (object instanceof L1PetInstance) {
			_allPets.put(object.getId(), (L1PetInstance) object);
		}
		if (object instanceof L1SummonInstance) {
			_allSummons.put(object.getId(), (L1SummonInstance) object);
		}
	}

	public void removeObject(L1Object object) {
		if (object == null) {
			throw new NullPointerException();
		}

		_allObjects.remove(object.getId());
		if (object instanceof L1PcInstance) {
			_allPlayers.remove(((L1PcInstance) object).getName());
		}
		if (object instanceof L1MerchantInstance) {
			_allMerchants.remove(((L1MerchantInstance) object).getNpcTemplate().get_npcId());
		}
		if (object instanceof L1MonsterInstance) {
			_allMonsters.remove(((L1MonsterInstance) object).getNpcTemplate().get_npcId());
		}
		if (object instanceof L1PetInstance) {
			_allPets.remove(object.getId());
		}
		if (object instanceof L1SummonInstance) {
			_allSummons.remove(object.getId());
		}
	}

	public L1Object findObject(int objId) {
		return _allObjects.get(objId);
	}

	// _allObjectsのビュー
	private Collection<L1Object> _allValues;

	public Collection<L1Object> getObject() {
		Collection<L1Object> vs = _allValues;
		return (vs != null) ? vs : (_allValues = Collections.unmodifiableCollection(_allObjects.values()));
	}

	public L1GroundInventory getInventory(int x, int y, short map) {
		int inventoryKey = ((x - 30000) * 10000 + (y - 30000)) * -1; // xyのマイナス值をインベントリキーとして使用

		Object object = WorldMap.getMap(map).Get(inventoryKey);

		if (object == null) {
			return new L1GroundInventory(inventoryKey, x, y, map);
		} else {
			return (L1GroundInventory) object;
		}
	}

	public L1GroundInventory getInventory(L1Location loc) {
		return getInventory(loc.getX(), loc.getY(), (short) loc.getMap().getId());
	}

	public void addVisibleObject(L1Object object) {
		WorldMap.getMap(object.getMapId()).Add(object);
	}

	public void removeVisibleObject(L1Object object) {
		WorldMap.getMap(object.getMapId()).Remove(object);
	}

	// set_Mapで新しいMapにするまえに呼ぶこと
	public void moveVisibleObject(L1Object object, int newMap) {
		if (object.getMapId() == newMap) {
			return;
		}

		WorldMap.getMap(object.getMapId()).Remove(object);
		WorldMap.getMap((short) newMap).Add(object);
	}

	private ConcurrentHashMap<Integer, Integer> createLineMap(Point src, Point target) {
		ConcurrentHashMap<Integer, Integer> lineMap = new ConcurrentHashMap<Integer, Integer>();

		/*
		 * http://www2.starcat.ne.jp/~fussy/algo/algo1-1.htmより
		 */
		int E;
		int x;
		int y;
		int key;
		int i;
		int x0 = src.getX();
		int y0 = src.getY();
		int x1 = target.getX();
		int y1 = target.getY();
		int sx = (x1 > x0) ? 1 : -1;
		int dx = (x1 > x0) ? x1 - x0 : x0 - x1;
		int sy = (y1 > y0) ? 1 : -1;
		int dy = (y1 > y0) ? y1 - y0 : y0 - y1;

		x = x0;
		y = y0;
		/* 傾きが1以下の場合 */
		if (dx >= dy) {
			E = -dx;
			for (i = 0; i <= dx; i++) {
				key = (x << 16) + y;
				lineMap.put(key, key);
				x += sx;
				E += 2 * dy;
				if (E >= 0) {
					y += sy;
					E -= 2 * dx;
				}
			}
			/* 傾きが1より大きい場合 */
		} else {
			E = -dy;
			for (i = 0; i <= dy; i++) {
				key = (x << 16) + y;
				lineMap.put(key, key);
				y += sy;
				E += 2 * dx;
				if (E >= 0) {
					x += sx;
					E -= 2 * dy;
				}
			}
		}

		return lineMap;
	}

	public FastTable<L1Object> getVisibleLineObjects(L1Object src, L1Object target) {
		ConcurrentHashMap<Integer, Integer> lineMap = createLineMap(src.getLocation(), target.getLocation());

		short map = target.getMapId();
		FastTable<L1Object> result = new FastTable<L1Object>();

		for (L1Object element : WorldMap.getMap(map).getObjects()) {
			if (element.equals(src)) {
				continue;
			}

			int key = (element.getX() << 16) + element.getY();

			if (lineMap.containsKey(key)) {
				result.add(element);
			}
		}

		return result;
	}

	public FastTable<L1Object> getVisibleBoxObjects(L1Object object, int heading, int width, int height) {
		int x = object.getX();
		int y = object.getY();
		short map = object.getMapId();
		L1Location location = object.getLocation();
		FastTable<L1Object> result = new FastTable<L1Object>();
		int headingRotate[] = { 6, 7, 0, 1, 2, 3, 4, 5 };
		double cosSita = Math.cos(headingRotate[heading] * Math.PI / 4);
		double sinSita = Math.sin(headingRotate[heading] * Math.PI / 4);

		for (L1Object element : WorldMap.getMap(map).getObjects()) {
			if (element.equals(object) || map != element.getMapId()) {
				continue;
			}

			// 同じ座標に重なっている場合は範圍內とする
			if (location.equals(element.getLocation())) {
				result.add(element);
				continue;
			}

			int distance = location.getTileLineDistance(element.getLocation());

			// 直線距離が高さ、幅どちらよりも大きい場合、計算するまでもなく範圍外
			if (distance > height && distance > width) {
				continue;
			}

			int x1 = element.getX() - x;
			int y1 = element.getY() - y;
			int rotX = (int) Math.round(x1 * cosSita + y1 * sinSita);
			int rotY = (int) Math.round(-x1 * sinSita + y1 * cosSita);
			int xmin = 0;
			int xmax = height;
			int ymin = -width;
			int ymax = width;

			if (rotX > xmin && distance <= xmax && rotY >= ymin && rotY <= ymax) {
				result.add(element);
			}
		}

		return result;
	}

	public FastTable<L1Object> getVisibleObjects(L1Object object) {
		return getVisibleObjects(object, -1);
	}

	public FastTable<L1Object> getVisibleObjects(L1Object object, int radius) {
		L1Map map = object.getMap();
		Point pt = object.getLocation();
		FastTable<L1Object> result = new FastTable<L1Object>();

		for (L1Object element : WorldMap.getMap((short) map.getId()).getObjects()) {
			if (element.equals(object) || map != element.getMap()) {
				continue;
			}

			if (radius == -1) {
				if (pt.isInScreen(element.getLocation())) {
					result.add(element);
				}
			} else if (radius == 0) {
				if (pt.equals(element.getLocation())) {
					result.add(element);
				}
			} else {
				if (pt.getTileLineDistance(element.getLocation()) <= radius) {
					result.add(element);
				}
			}
		}

		return result;
	}

	public FastTable<L1Object> getVisiblePoint(L1Location loc, int radius) {
		FastTable<L1Object> result = new FastTable<L1Object>();
		short mapId = (short) loc.getMapId();

		for (L1Object element : WorldMap.getMap(mapId).getObjects()) {
			if (mapId != element.getMapId()) {
				continue;
			}

			if (loc.getTileLineDistance(element.getLocation()) <= radius)
				result.add(element);
		}

		return result;
	}

	public FastTable<L1PcInstance> getVisiblePlayer(L1Object object) {
		return getVisiblePlayer(object, -1);
	}

	public FastTable<L1PcInstance> getVisiblePlayer(L1Object object, int radius) {
		int map = object.getMapId();
		Point pt = object.getLocation();
		FastTable<L1PcInstance> result = new FastTable<L1PcInstance>();

		for (L1PcInstance element : _allPlayers.values()) {
			if (element.equals(object)) {
				continue;
			}

			if (map != element.getMapId()) {
				continue;
			}

			if (radius == -1) {
				if (pt.isInScreen(element.getLocation())) {
					result.add(element);
				}
			} else if (radius == 0) {
				if (pt.equals(element.getLocation())) {
					result.add(element);
				}
			} else {
				if (pt.getTileLineDistance(element.getLocation()) <= radius) {
					result.add(element);
				}
			}
		}
		return result;
	}

	public FastTable<L1PcInstance> getVisiblePlayerExceptTargetSight(L1Object object, L1Object target) {
		int map = object.getMapId();
		Point objectPt = object.getLocation();
		Point targetPt = target.getLocation();
		FastTable<L1PcInstance> result = new FastTable<L1PcInstance>();

		for (L1PcInstance element : _allPlayers.values()) {
			if (element.equals(object)) {
				continue;
			}

			if (map != element.getMapId()) {
				continue;
			}

			if (Config.PC_RECOGNIZE_RANGE == -1) {
				if (objectPt.isInScreen(element.getLocation())) {
					if (!targetPt.isInScreen(element.getLocation())) {
						result.add(element);
					}
				}
			} else {
				if (objectPt.getTileLineDistance(element.getLocation()) <= Config.PC_RECOGNIZE_RANGE) {
					if (targetPt.getTileLineDistance(element.getLocation()) > Config.PC_RECOGNIZE_RANGE) {
						result.add(element);
					}
				}
			}
		}
		return result;
	}

	/**
	 * objectを認識できる範圍にいるプレイヤーを取得する
	 * 
	 * @param object
	 * @return
	 */
	public FastTable<L1PcInstance> getRecognizePlayer(L1Object object) {
		return getVisiblePlayer(object, Config.PC_RECOGNIZE_RANGE);
	}

	// _allPlayersのビュー
	private Collection<L1PcInstance> _allPlayerValues;

	public Collection<L1PcInstance> getAllPlayers() {
		Collection<L1PcInstance> vs = _allPlayerValues;
		return (vs != null) ? vs : (_allPlayerValues = Collections.unmodifiableCollection(_allPlayers.values()));
	}

	public L1PcInstance[] getAllPlayers2() {
		return _allPlayers.values().toArray(new L1PcInstance[_allPlayers.size()]);
	}

	/**
	 * ワールド內にいる指定された名前のプレイヤーを取得する。
	 * 
	 * @param name - プレイヤー名(小文字‧大文字は無視される)
	 * @return 指定された名前のL1PcInstance。該當プレイヤーが存在しない場合はnullを返す。
	 */
	public L1PcInstance getPlayer(String name) {
		if (_allPlayers.contains(name)) {
			return _allPlayers.get(name);
		}
		for (L1PcInstance each : getAllPlayers()) {
			if (each.getName().equalsIgnoreCase(name)) {
				return each;
			}
		}
		return null;
	}

	// _allPetsのビュー
	private Collection<L1PetInstance> _allPetValues;

	public Collection<L1PetInstance> getAllPets() {
		Collection<L1PetInstance> vs = _allPetValues;
		return (vs != null) ? vs : (_allPetValues = Collections.unmodifiableCollection(_allPets.values()));
	}

	// _allSummonsのビュー
	private Collection<L1SummonInstance> _allSummonValues;

	public Collection<L1SummonInstance> getAllSummons() {
		Collection<L1SummonInstance> vs = _allSummonValues;
		return (vs != null) ? vs : (_allSummonValues = Collections.unmodifiableCollection(_allSummons.values()));
	}

	public final Map<Integer, L1Object> getAllVisibleObjects() {
		return _allObjects;
	}

/*
	public final Map<Integer, L1Object>[] getVisibleObjects() {
		return null;
	}

	public final Map<Integer, WorldMap> getVisibleObjects(int mapId) {
		return WorldMap.getMap(mapId).getMapList();
	}

	public Object getRegion(Object object) {
		return null;
	}
*/

	public void addWar(L1War war) {
		if (!_allWars.contains(war)) {
			_allWars.add(war);
		}
	}

	public void removeWar(L1War war) {
		if (_allWars.contains(war)) {
			_allWars.remove(war);
		}
	}

	// _allWarsのビュー
	private List<L1War> _allWarList;

	public List<L1War> getWarList() {
		List<L1War> vs = _allWarList;
		return (vs != null) ? vs : (_allWarList = Collections.unmodifiableList(_allWars));
	}

	public void storeClan(L1Clan clan) {
		L1Clan temp = getClan(clan.getClanName());
		if (temp == null) {
			_allClans.put(clan.getClanName(), clan);
		}
	}

	public void removeClan(L1Clan clan) {
		L1Clan temp = getClan(clan.getClanName());
		if (temp != null) {
			_allClans.remove(clan.getClanName());
		}
	}

	public L1Clan getClan(String clan_name) {
		return _allClans.get(clan_name);
	}

	// _allClansのビュー
	private Collection<L1Clan> _allClanValues;

	public Collection<L1Clan> getAllClans() {
		Collection<L1Clan> vs = _allClanValues;
		return (vs != null) ? vs : (_allClanValues = Collections.unmodifiableCollection(_allClans.values()));
	}

	public void setWeather(int weather) {
		_weather = weather;
	}

	public int getWeather() {
		return _weather;
	}

	public void set_worldChatElabled(boolean flag) {
		_worldChatEnabled = flag;
	}

	public boolean isWorldChatElabled() {
		return _worldChatEnabled;
	}

	public void setProcessingContributionTotal(boolean flag) {
		_processingContributionTotal = flag;
	}

	public boolean isProcessingContributionTotal() {
		return _processingContributionTotal;
	}

	/**
	 * <font color=#827B00>傳回玩家的總數</font>
	 * 
	 * @return L1PcInstance[]
	 */
	public L1PcInstance[] getWorldPlayers() {
		L1PcInstance[] pc = new L1PcInstance[_allPlayers.size()];
		L1PcInstance[] allPc = _allPlayers.values().toArray(pc);
		return allPc;
	}

	/**
	 * <font color=#827B00>傳回商人的總數</font>
	 * 
	 * @return L1MerchantInstance[]
	 */
	public L1MerchantInstance[] getWorldMerchants() {
		L1MerchantInstance[] merchant = new L1MerchantInstance[_allMerchants.size()];
		L1MerchantInstance[] allMerchant = _allMerchants.values().toArray(merchant);
		return allMerchant;
	}

	/**
	 * <font color=#827B00>傳回怪物的總數</font>
	 * 
	 * @return L1MonsterInstance[]
	 */
	public L1MonsterInstance[] getWorldMonsters() {
		L1MonsterInstance[] monster = new L1MonsterInstance[_allMonsters.size()];
		L1MonsterInstance[] allMonster = _allMonsters.values().toArray(monster);
		return allMonster;
	}

	/**
	 * <font color=#827B00>傳回物件的總數</font>
	 * 
	 * @return L1Object[]
	 */
	public L1Object[] getWorldObjects() {
		L1Object[] obj = new L1Object[_allObjects.size()];
		L1Object[] allObj = _allObjects.values().toArray(obj);
		return allObj;
	}

	/**
	 * <font color=#827B00>傳回血盟的總數</font>
	 * 
	 * @return L1Clan[]
	 */
	public L1Clan[] getWorldClans() {
		L1Clan[] clan = new L1Clan[_allClans.size()];
		L1Clan[] allClan = _allClans.values().toArray(clan);
		return allClan;
	}

	/**
	 * ワールド上に存在する全てのプレイヤーへパケットを送信する。
	 * 
	 * @param packet 送信するパケットを表すServerBasePacketオブジェクト。
	 */
	public void broadcastPacketToAll(ServerBasePacket packet) {
		_log.finest("players to notify : " + getAllPlayers().size());
		for (L1PcInstance pc : getAllPlayers()) {
			pc.sendPackets(packet);
		}
	}

	/**
	 * ワールド上に存在する全てのプレイヤーへサーバーメッセージを送信する。
	 * 
	 * @param message 送信するメッセージ
	 */
	public void broadcastServerMessage(String message) {
		broadcastPacketToAll(new S_SystemMessage(message));
	}
}
