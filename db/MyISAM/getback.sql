#----------------------------
# Table structure for getback
#----------------------------
CREATE TABLE `getback` (
  `area_x1` int(10) NOT NULL default '0',
  `area_y1` int(10) NOT NULL default '0',
  `area_x2` int(10) NOT NULL default '0',
  `area_y2` int(10) NOT NULL default '0',
  `area_mapid` int(10) NOT NULL default '0',
  `getback_x1` int(10) NOT NULL default '0',
  `getback_y1` int(10) NOT NULL default '0',
  `getback_x2` int(10) NOT NULL default '0',
  `getback_y2` int(10) NOT NULL default '0',
  `getback_x3` int(10) NOT NULL default '0',
  `getback_y3` int(10) NOT NULL default '0',
  `getback_mapid` int(10) NOT NULL default '0',
  `getback_townid` int(10) unsigned NOT NULL default '0',
  `getback_townid_elf` int(10) unsigned NOT NULL default '0',
  `getback_townid_darkelf` int(10) unsigned NOT NULL default '0',
  `scrollescape` int(10) NOT NULL default '1',
  `note` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`area_x1`,`area_y1`,`area_x2`,`area_y2`,`area_mapid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
#----------------------------
# Records for table getback
#----------------------------


INSERT INTO `getback` VALUES
(0, 0, 0, 0, 0, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, '話せる島'),
(0, 0, 0, 0, 1, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, '話せる島ケイブ1F'),
(0, 0, 0, 0, 2, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, '話せる島ケイブ2F'),
(0, 0, 0, 0, 3, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, 'グンターの家'),
(0, 0, 0, 0, 5, 32624, 32813, 32624, 32813, 32624, 32813, 4, 1, 0, 0, 1, 'グルーディオに行く船'),
(0, 0, 0, 0, 6, 32574, 32941, 32574, 32941, 32574, 32941, 0, 3, 0, 0, 1, '話せる島に行く船'),
(0, 0, 0, 0, 7, 32624, 32813, 32624, 32813, 32624, 32813, 4, 3, 0, 0, 1, 'メインランドケイブ1F'),
(0, 0, 0, 0, 8, 32624, 32813, 32624, 32813, 32624, 32813, 4, 3, 0, 0, 1, 'メインランドケイブ2F'),
(0, 0, 0, 0, 9, 32624, 32813, 32624, 32813, 32624, 32813, 4, 3, 0, 0, 1, 'メインランドケイブ3F'),
(0, 0, 0, 0, 10, 32624, 32813, 32624, 32813, 32624, 32813, 4, 3, 0, 0, 1, 'メインランドケイブ4F'),
(0, 0, 0, 0, 11, 32624, 32813, 32624, 32813, 32624, 32813, 4, 3, 0, 0, 1, 'メインランドケイブ5F'),
(0, 0, 0, 0, 12, 32624, 32813, 32624, 32813, 32624, 32813, 4, 3, 0, 0, 1, 'メインランドケイブ6F'),
(0, 0, 0, 0, 13, 32624, 32813, 32624, 32813, 32624, 32813, 4, 3, 0, 0, 1, 'メインランドケイブ7F'),
(0, 0, 0, 0, 14, 32574, 32941, 32574, 32941, 32574, 32941, 0, 0, 0, 0, 1, '海底水道'),
(0, 0, 0, 0, 15, 33049, 32780, 33049, 32780, 33049, 32780, 4, 6, 0, 0, 1, 'ケント城內部'),
(0, 0, 0, 0, 16, 33051, 32343, 33051, 32343, 33051, 32343, 4, 0, 0, 0, 1, 'ハキンの研究所'),
(0, 0, 0, 0, 17, 33051, 32343, 33051, 32343, 33051, 32343, 4, 4, 11, 0, 1, 'ネルファの洞窟'),
(0, 0, 0, 0, 18, 33051, 32343, 33051, 32343, 33051, 32343, 4, 4, 11, 0, 1, 'デュペルゲノンケイブ'),
(0, 0, 0, 0, 19, 32745, 32445, 32745, 32445, 32745, 32445, 4, 4, 11, 0, 1, 'エルヴンケイブ1F'),
(0, 0, 0, 0, 20, 32745, 32445, 32745, 32445, 32745, 32445, 4, 4, 11, 0, 1, 'エルヴンケイブ2F'),
(0, 0, 0, 0, 21, 32745, 32445, 32745, 32445, 32745, 32445, 4, 4, 11, 0, 1, 'エルヴンケイブ3F'),
(0, 0, 0, 0, 22, 33089, 33397, 33089, 33397, 33089, 33397, 4, 0, 0, 0, 1, 'ゲラドクエストケイブ'),
(0, 0, 0, 0, 23, 32612, 33188, 32612, 33188, 32612, 33188, 4, 5, 0, 0, 1, 'ウィンダウッドケイブ1F'),
(0, 0, 0, 0, 24, 32612, 33188, 32612, 33188, 32612, 33188, 4, 5, 0, 0, 1, 'ウィンダウッドケイブ2F'),
(0, 0, 0, 0, 25, 33089, 33397, 33089, 33397, 33089, 33397, 4, 2, 0, 0, 1, 'シルバーナイトタウンケイブ1F'),
(0, 0, 0, 0, 26, 33089, 33397, 33089, 33397, 33089, 33397, 4, 2, 0, 0, 1, 'シルバーナイトタウンケイブ2F'),
(0, 0, 0, 0, 27, 33089, 33397, 33089, 33397, 33089, 33397, 4, 2, 0, 0, 1, 'シルバーナイトタウンケイブ3F'),
(0, 0, 0, 0, 28, 33089, 33397, 33089, 33397, 33089, 33397, 4, 2, 0, 0, 1, 'シルバーナイトタウンケイブ4F'),
(0, 0, 0, 0, 29, 32612, 33188, 32612, 33188, 32612, 33188, 4, 5, 0, 0, 1, 'ウィンダウッド城內部'),
(0, 0, 0, 0, 30, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ドラゴンバレーケイブ1F'),
(0, 0, 0, 0, 31, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ドラゴンバレーケイブ2F'),
(0, 0, 0, 0, 32, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ドラゴンバレーケイブ3F'),
(0, 0, 0, 0, 33, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ドラゴンバレーケイブ4F'),
(0, 0, 0, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'カロのクエストケイブ'),
(0, 0, 0, 0, 35, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ドラゴンバレーケイブ5F'),
(0, 0, 0, 0, 36, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ドラゴンバレーケイブ6F'),
(0, 0, 0, 0, 37, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ドラゴンバレーケイブ7F'),
(0, 0, 0, 0, 38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'カロのクエストケイブ'),
(0, 0, 0, 0, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'カロのクエストケイブ'),
(0, 0, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'カロのクエストケイブ'),
(0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'カロのクエストケイブ'),
(0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, ''),
(0, 0, 0, 0, 43, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'アントケイブ1F'),
(0, 0, 0, 0, 44, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'アントケイブ2F'),
(0, 0, 0, 0, 45, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'アントケイブ3F'),
(0, 0, 0, 0, 46, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'アントケイブ4F'),
(0, 0, 0, 0, 47, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'アントケイブ5F'),
(0, 0, 0, 0, 48, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'アントケイブ6F'),
(0, 0, 0, 0, 49, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'アントケイブ7F'),
(0, 0, 0, 0, 50, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'アントケイブ8F'),
(0, 0, 0, 0, 51, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'アントケイブ（QA）'),
(0, 0, 0, 0, 52, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ギラン城內部'),
(0, 0, 0, 0, 53, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ギランケイブ1F'),
(0, 0, 0, 0, 54, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ギランケイブ2F'),
(0, 0, 0, 0, 55, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ギランケイブ3F'),
(0, 0, 0, 0, 56, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ギランケイブ4F'),
(0, 0, 0, 0, 57, 32574, 32941, 32574, 32941, 32574, 32941, 4, 0, 0, 0, 1, '歌う島'),
(0, 0, 0, 0, 58, 33082, 33389, 33082, 33389, 33082, 33389, 4, 0, 0, 0, 1, '隱された溪谷'),
(0, 0, 0, 0, 59, 33614, 33243, 33614, 33243, 33614, 33243, 4, 8, 0, 0, 1, 'ハイネケイブ1F'),
(0, 0, 0, 0, 60, 33614, 33243, 33614, 33243, 33614, 33243, 4, 8, 0, 0, 1, 'ハイネケイブ2F'),
(0, 0, 0, 0, 61, 33614, 33243, 33614, 33243, 33614, 33243, 4, 8, 0, 0, 1, 'ハイネケイブ3F'),
(0, 0, 0, 0, 62, 33604, 33237, 33604, 33237, 33604, 33237, 4, 8, 0, 0, 1, 'エヴァの神殿'),
(0, 0, 0, 0, 63, 33604, 33237, 33604, 33237, 33604, 33237, 4, 8, 0, 0, 1, 'ハイネケイブ4F'),
(0, 0, 0, 0, 64, 33604, 33237, 33604, 33237, 33604, 33237, 4, 8, 0, 0, 1, 'ハイネ城內部'),
(0, 0, 0, 0, 65, 33604, 33237, 33604, 33237, 33604, 33237, 4, 8, 0, 0, 1, '水龍の棲處'),
(0, 0, 0, 0, 66, 33722, 32496, 33722, 32496, 33722, 32496, 4, 9, 0, 0, 1, 'ドワーフの洞窟'),
(0, 0, 0, 0, 67, 33719, 32491, 33719, 32491, 33719, 32491, 4, 9, 0, 0, 1, '火龍の棲處'),
(0, 0, 0, 0, 68, 32778, 32779, 32778, 32779, 32778, 32779, 68, 0, 0, 0, 1, '歌う島'),
(0, 0, 0, 0, 69, 32714, 32877, 32714, 32877, 32714, 32877, 69, 0, 0, 0, 1, '隱された溪谷'),
(0, 0, 0, 0, 70, 32828, 32848, 32828, 32848, 32828, 32848, 70, 0, 0, 0, 1, '忘れられた島'),
(0, 0, 0, 0, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, ''),
(0, 0, 0, 0, 72, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, '水晶の洞窟1F'),
(0, 0, 0, 0, 73, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, '水晶の洞窟2F'),
(0, 0, 0, 0, 74, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, '水晶の洞窟3F'),
(0, 0, 0, 0, 75, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, '象牙の塔1F'),
(0, 0, 0, 0, 76, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, '象牙の塔2F'),
(0, 0, 0, 0, 77, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, '象牙の塔3F'),
(0, 0, 0, 0, 78, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, '象牙の塔4F'),
(0, 0, 0, 0, 79, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, '象牙の塔5F'),
(0, 0, 0, 0, 80, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, '象牙の塔6F'),
(0, 0, 0, 0, 81, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, '象牙の塔7F'),
(0, 0, 0, 0, 82, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, '象牙の塔8F'),
(0, 0, 0, 0, 83, 33604, 33237, 33604, 33237, 33604, 33237, 4, 8, 0, 0, 1, '忘れられた島に行く船'),
(0, 0, 0, 0, 84, 33604, 33237, 33604, 33237, 33604, 33237, 4, 0, 0, 0, 1, 'ハイネに行く船'),
(0, 0, 0, 0, 85, 32831, 32838, 32831, 32838, 32831, 32838, 8011, 0, 0, 0, 1, '歌う島のケイブ（npcココから）'),
(0, 0, 0, 0, 86, 32831, 32838, 32831, 32838, 32831, 32838, 8011, 0, 0, 0, 1, '歌う島のケイブ（npcクンから）'),
(0, 0, 0, 0, 87, 32831, 32838, 32831, 32838, 32831, 32838, 8011, 0, 0, 0, 1, 'パゴの部屋'),
(0, 0, 0, 0, 88, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 1, 'ギランUB'),
(0, 0, 0, 0, 89, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 1, 'ギランUB'),
(0, 0, 0, 0, 90, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 1, 'ギランUB'),
(0, 0, 0, 0, 91, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, '話せる島UB'),
(0, 0, 0, 0, 92, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1, 'グルーディオUB'),
(0, 0, 0, 0, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'ケントUB'),
(0, 0, 0, 0, 94, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'ウィンダウッドUB'),
(0, 0, 0, 0, 95, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, 'シルバーナイトタウンUB'),
(0, 0, 0, 0, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 'ヴァラカスの棲みUB'),
(0, 0, 0, 0, 97, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 1, 'ハイネUB'),
(0, 0, 0, 0, 98, 0, 0, 0, 0, 0, 0, 0, 9, 0, 0, 1, 'ウェルダンUB'),
(0, 0, 0, 0, 99, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, 'GMルーム'),
(0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0'),
(0, 0, 0, 0, 101, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔1F'),
(0, 0, 0, 0, 102, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔2F'),
(0, 0, 0, 0, 103, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔3F'),
(0, 0, 0, 0, 104, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔4F'),
(0, 0, 0, 0, 105, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔5F'),
(0, 0, 0, 0, 106, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔6F'),
(0, 0, 0, 0, 107, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔7F'),
(0, 0, 0, 0, 108, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔8F'),
(0, 0, 0, 0, 109, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔9F'),
(0, 0, 0, 0, 110, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔10F'),
(0, 0, 0, 0, 111, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔11F'),
(0, 0, 0, 0, 112, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔12F'),
(0, 0, 0, 0, 113, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔13F'),
(0, 0, 0, 0, 114, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔14F'),
(0, 0, 0, 0, 115, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔15F'),
(0, 0, 0, 0, 116, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔16F'),
(0, 0, 0, 0, 117, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔17F'),
(0, 0, 0, 0, 118, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔18F'),
(0, 0, 0, 0, 119, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔19F'),
(0, 0, 0, 0, 120, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔20F'),
(0, 0, 0, 0, 121, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔21F'),
(0, 0, 0, 0, 122, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔22F'),
(0, 0, 0, 0, 123, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔23F'),
(0, 0, 0, 0, 124, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔24F'),
(0, 0, 0, 0, 125, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔25F'),
(0, 0, 0, 0, 126, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔26F'),
(0, 0, 0, 0, 127, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔27F'),
(0, 0, 0, 0, 128, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔28F'),
(0, 0, 0, 0, 129, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔29F'),
(0, 0, 0, 0, 130, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔30F'),
(0, 0, 0, 0, 131, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔31F'),
(0, 0, 0, 0, 132, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔32F'),
(0, 0, 0, 0, 133, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔33F'),
(0, 0, 0, 0, 134, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔34F'),
(0, 0, 0, 0, 135, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔35F'),
(0, 0, 0, 0, 136, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔36F'),
(0, 0, 0, 0, 137, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔37F'),
(0, 0, 0, 0, 138, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔38F'),
(0, 0, 0, 0, 139, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔39F'),
(0, 0, 0, 0, 140, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔40F'),
(0, 0, 0, 0, 141, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔41F'),
(0, 0, 0, 0, 142, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔42F'),
(0, 0, 0, 0, 143, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔43F'),
(0, 0, 0, 0, 144, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔44F'),
(0, 0, 0, 0, 145, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔45F'),
(0, 0, 0, 0, 146, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔46F'),
(0, 0, 0, 0, 147, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔47F'),
(0, 0, 0, 0, 148, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔48F'),
(0, 0, 0, 0, 149, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔49F'),
(0, 0, 0, 0, 150, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔50F'),
(0, 0, 0, 0, 151, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔51F'),
(0, 0, 0, 0, 152, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔52F'),
(0, 0, 0, 0, 153, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔53F'),
(0, 0, 0, 0, 154, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔54F'),
(0, 0, 0, 0, 155, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔55F'),
(0, 0, 0, 0, 156, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔56F'),
(0, 0, 0, 0, 157, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔57F'),
(0, 0, 0, 0, 158, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔58F'),
(0, 0, 0, 0, 159, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔59F'),
(0, 0, 0, 0, 160, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔60F'),
(0, 0, 0, 0, 161, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔61F'),
(0, 0, 0, 0, 162, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔62F'),
(0, 0, 0, 0, 163, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔63F'),
(0, 0, 0, 0, 164, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔64F'),
(0, 0, 0, 0, 165, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔65F'),
(0, 0, 0, 0, 166, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔66F'),
(0, 0, 0, 0, 167, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔67F'),
(0, 0, 0, 0, 168, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔68F'),
(0, 0, 0, 0, 169, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔69F'),
(0, 0, 0, 0, 170, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔70F'),
(0, 0, 0, 0, 171, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔71F'),
(0, 0, 0, 0, 172, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔72F'),
(0, 0, 0, 0, 173, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔73F'),
(0, 0, 0, 0, 174, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔74F'),
(0, 0, 0, 0, 175, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔75F'),
(0, 0, 0, 0, 176, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔76F'),
(0, 0, 0, 0, 177, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔77F'),
(0, 0, 0, 0, 178, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔78F'),
(0, 0, 0, 0, 179, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔79F'),
(0, 0, 0, 0, 180, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔80F'),
(0, 0, 0, 0, 181, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔81F'),
(0, 0, 0, 0, 182, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔82F'),
(0, 0, 0, 0, 183, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔83F'),
(0, 0, 0, 0, 184, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔84F'),
(0, 0, 0, 0, 185, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔85F'),
(0, 0, 0, 0, 186, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔86F'),
(0, 0, 0, 0, 187, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔87F'),
(0, 0, 0, 0, 188, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔88F'),
(0, 0, 0, 0, 189, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔89F'),
(0, 0, 0, 0, 190, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔90F'),
(0, 0, 0, 0, 191, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔91F'),
(0, 0, 0, 0, 192, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔92F'),
(0, 0, 0, 0, 193, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔93F'),
(0, 0, 0, 0, 194, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔94F'),
(0, 0, 0, 0, 195, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔95F'),
(0, 0, 0, 0, 196, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔96F'),
(0, 0, 0, 0, 197, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔97F'),
(0, 0, 0, 0, 198, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔98F'),
(0, 0, 0, 0, 199, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔99F'),
(0, 0, 0, 0, 200, 33966, 33253, 33966, 33253, 33966, 33253, 4, 12, 0, 0, 1, '傲慢の塔100F'),
(0, 0, 0, 0, 201, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, 'ウィザードのクエストケイブ'),
(0, 0, 0, 0, 202, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, 'ウィザードのクエストケイブ'),
(0, 0, 0, 0, 203, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, 'ウィザードのクエストケイブ'),
(0, 0, 0, 0, 204, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, 'ウィザードのクエストケイブ'),
(0, 0, 0, 0, 205, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, 'ウィザードのクエストケイブ'),
(0, 0, 0, 0, 206, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, 'ウィザードのクエストケイブ'),
(0, 0, 0, 0, 207, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, 'ウィザードのクエストケイブ'),
(0, 0, 0, 0, 208, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, 'ウィザードのクエストケイブ'),
(0, 0, 0, 0, 209, 0, 0, 0, 0, 0, 0, 0, 4, 11, 0, 1, 'ダークエルフケイブ'),
(0, 0, 0, 0, 210, 0, 0, 0, 0, 0, 0, 0, 4, 11, 0, 1, 'ダークエルフケイブ'),
(0, 0, 0, 0, 211, 0, 0, 0, 0, 0, 0, 0, 4, 11, 0, 1, 'ダークエルフケイブ'),
(0, 0, 0, 0, 212, 0, 0, 0, 0, 0, 0, 0, 4, 11, 0, 1, 'ダークエルフケイブ'),
(0, 0, 0, 0, 213, 0, 0, 0, 0, 0, 0, 0, 4, 11, 0, 1, 'ダークエルフケイブ'),
(0, 0, 0, 0, 214, 0, 0, 0, 0, 0, 0, 0, 4, 11, 0, 1, 'ダークエルフケイブ'),
(0, 0, 0, 0, 215, 0, 0, 0, 0, 0, 0, 0, 4, 11, 0, 1, 'ダークエルフケイブ'),
(0, 0, 0, 0, 216, 0, 0, 0, 0, 0, 0, 0, 4, 11, 0, 1, 'ダークエルフケイブ'),
(0, 0, 0, 0, 217, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'プリLV30クエスト（ミュータントアントケイブ）'),
(0, 0, 0, 0, 218, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'プリLV30クエスト（ミュータントアントケイブ）'),
(0, 0, 0, 0, 219, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'プリLV30クエスト（ミュータントアントケイブ）'),
(0, 0, 0, 0, 220, 32612, 33188, 32612, 33188, 32612, 33188, 4, 2, 0, 0, 1, 'プリLV30クエスト（ミュータントアントケイブ）'),
(0, 0, 0, 0, 221, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 222, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 223, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 224, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 225, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 226, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 227, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 228, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 229, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 230, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 231, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 232, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 233, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 234, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 235, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 236, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'ゲラドのクエストケイブ'),
(0, 0, 0, 0, 237, 32628, 32807, 32628, 32807, 32628, 32807, 4, 3, 0, 0, 1, 'ジムの密室'),
(0, 0, 0, 0, 238, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, ''),
(0, 0, 0, 0, 239, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, ''),
(0, 0, 0, 0, 240, 33049, 32780, 33049, 32780, 33049, 32780, 4, 6, 0, 0, 1, 'ケントケイブ1F'),
(0, 0, 0, 0, 241, 33049, 32780, 33049, 32780, 33049, 32780, 4, 6, 0, 0, 1, 'ケントケイブ2F'),
(0, 0, 0, 0, 242, 33049, 32780, 33049, 32780, 33049, 32780, 4, 6, 0, 0, 1, 'ケントケイブ3F'),
(0, 0, 0, 0, 243, 33049, 32780, 33049, 32780, 33049, 32780, 4, 6, 0, 0, 1, 'ケントケイブ4F'),
(0, 0, 0, 0, 244, 32750, 32435, 32745, 32447, 32738, 32452, 4, 0, 0, 0, 1, '污染された祝福の地'),
(0, 0, 0, 0, 255, 33722, 32496, 33722, 32496, 33722, 32496, 4, 0, 0, 0, 1, 'ドワーフ城ケイブ:礦山'),
(0, 0, 0, 0, 256, 33722, 32496, 33722, 32496, 33722, 32496, 4, 0, 0, 0, 1, 'ドワーフ城ケイブ:荒野'),
(0, 0, 0, 0, 310, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0, 1, 'オームの洞窟'),
(0, 0, 0, 0, 320, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0, 1, 'ディアド'),
(0, 0, 0, 0, 330, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0, 1, 'ブラックミスリル礦山'),
(0, 0, 0, 0, 340, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, 'グルーディン市場'),
(0, 0, 0, 0, 350, 0, 0, 0, 0, 0, 0, 0, 7, 0, 0, 1, 'ギラン市場'),
(0, 0, 0, 0, 360, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 1, '象牙の塔の村市場'),
(0, 0, 0, 0, 370, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, 'シルバーナイトタウン市場'),
(0, 0, 0, 0, 420, 32422, 33074, 32422, 33074, 32422, 33074, 440, 17, 0, 0, 1, '地底湖'),
(0, 0, 0, 0, 430, 32422, 33074, 32422, 33074, 32422, 33074, 440, 16, 0, 0, 1, '精靈の墓'),
(0, 0, 0, 0, 440, 32422, 33074, 32422, 33074, 32422, 33074, 440, 16, 0, 0, 1, '海賊島'),
(0, 0, 0, 0, 441, 32422, 33074, 32422, 33074, 32422, 33074, 440, 16, 0, 0, 1, '海賊島ケイブ1F'),
(0, 0, 0, 0, 442, 32422, 33074, 32422, 33074, 32422, 33074, 440, 16, 0, 0, 1, '海賊島ケイブ2F'),
(0, 0, 0, 0, 443, 32422, 33074, 32422, 33074, 32422, 33074, 440, 16, 0, 0, 1, '海賊島ケイブ3F'),
(0, 0, 0, 0, 444, 32422, 33074, 32422, 33074, 32422, 33074, 440, 16, 0, 0, 1, '海賊島ケイブ4F'),
(0, 0, 0, 0, 482, 32451, 33058, 32451, 33058, 32451, 33058, 440, 0, 0, 0, 1, 'フランコの迷宮'),
(0, 0, 0, 0, 483, 32451, 33058, 32451, 33058, 32451, 33058, 440, 0, 0, 0, 1, 'ディエゴの閉ざされた牢'),
(0, 0, 0, 0, 484, 32451, 33058, 32451, 33058, 32451, 33058, 440, 0, 0, 0, 1, 'ホセの地下牢'),
(32515, 32192, 32959, 32536, 4, 32745, 32445, 32745, 32445, 32745, 32445, 4, 4, 0, 0, 1, '火田村'),
(32515, 32537, 32959, 33022, 4, 32628, 32807, 32628, 32807, 32628, 32807, 4, 3, 0, 0, 1, 'グルーディン'),
(32515, 33023, 32959, 33532, 4, 32612, 33188, 32612, 33188, 32612, 33188, 4, 5, 0, 0, 1, 'ウッドベック'),
(32960, 32192, 33215, 32510, 4, 33051, 32343, 33051, 32343, 33051, 32343, 4, 4, 11, 0, 1, 'エルフの森'),
(32960, 32511, 33280, 33022, 4, 33049, 32780, 33049, 32780, 33049, 32780, 4, 6, 0, 0, 1, 'ケント'),
(32960, 33023, 33279, 33532, 4, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'シルバーナイトタウン'),
(33216, 32192, 33471, 32510, 4, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 11, 0, 1, 'ドラゴンバレー'),
(33280, 32511, 33535, 33022, 4, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ギラン'),
(33280, 33023, 33791, 33532, 4, 33604, 33237, 33604, 33237, 33604, 33237, 4, 8, 0, 0, 1, 'ハイネ'),
(33472, 32192, 33855, 32574, 4, 33722, 32496, 33722, 32496, 33722, 32496, 4, 9, 0, 0, 1, '火山'),
(33536, 32574, 33919, 33022, 4, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'ギラン'),
(33792, 33023, 34303, 33532, 4, 33962, 33254, 33962, 33254, 33962, 33254, 4, 12, 0, 0, 1, 'アデン'),
(33856, 32192, 33920, 32738, 4, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, 'オーレン'),
(33920, 32128, 34303, 32738, 4, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, 'オーレン'),
(33920, 32739, 34303, 33532, 4, 33962, 33254, 33962, 33254, 33962, 33254, 4, 12, 0, 0, 1, 'アデン'),
(0, 0, 0, 0, 521, 34017, 32188, 34023, 32160, 34041, 32164, 4, 0, 0, 0, 1, '影の神殿外部'),
(0, 0, 0, 0, 522, 34017, 32188, 34023, 32160, 34041, 32164, 4, 0, 0, 0, 1, '影の神殿1階'),
(0, 0, 0, 0, 523, 34017, 32188, 34023, 32160, 34041, 32164, 4, 0, 0, 0, 1, '影の神殿2階'),
(0, 0, 0, 0, 524, 34017, 32188, 34023, 32160, 34041, 32164, 4, 0, 0, 0, 1, '影の神殿3階'),
(0, 0, 0, 0, 480, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 1, '海族島後半部'),
(0, 0, 0, 0, 481, 0, 0, 0, 0, 0, 0, 0, 16, 0, 0, 1, 'カミーラの部屋'),
(0, 0, 0, 0, 550, 32844, 32694, 32844, 32694, 32844, 32694, 550, 0, 0, 0, 1, '船の墓場:地上層'),
(0, 0, 0, 0, 551, 32844, 32694, 32844, 32694, 32844, 32694, 550, 0, 0, 0, 1, '船の墓場:船內'),
(0, 0, 0, 0, 552, 32844, 32694, 32844, 32694, 32844, 32694, 550, 0, 0, 0, 1, '船の墓場:船內'),
(0, 0, 0, 0, 553, 32844, 32694, 32844, 32694, 32844, 32694, 550, 0, 0, 0, 1, '船の墓場:船內'),
(0, 0, 0, 0, 554, 32844, 32694, 32844, 32694, 32844, 32694, 550, 0, 0, 0, 1, '船の墓場:船內'),
(0, 0, 0, 0, 555, 32844, 32694, 32844, 32694, 32844, 32694, 550, 0, 0, 0, 1, '船の墓場:船內'),
(0, 0, 0, 0, 556, 32844, 32694, 32844, 32694, 32844, 32694, 550, 0, 0, 0, 1, '船の墓場:船內'),
(0, 0, 0, 0, 557, 32844, 32694, 32844, 32694, 32844, 32694, 550, 0, 0, 0, 1, '船の墓場:船內'),
(0, 0, 0, 0, 558, 32844, 32694, 32844, 32694, 32844, 32694, 550, 0, 0, 0, 1, '船の墓場:深海層'),
(0, 0, 0, 0, 600, 32608, 33178, 32626, 33185, 32630, 33179, 4, 5, 0, 0, 1, '欲望の洞窟外周部'),
(0, 0, 0, 0, 601, 32608, 33178, 32626, 33185, 32630, 33179, 4, 5, 0, 0, 1, '欲望の洞窟ロビー'),
(0, 0, 0, 0, 608, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, 'ヤヒの實驗室'),
(0, 0, 0, 0, 777, 34043, 32184, 34023, 32174, 34053, 32195, 4, 0, 0, 0, 1, '見棄てられた者たちの地(空間の歪)'),
(0, 0, 0, 0, 778, 32608, 33178, 32626, 33185, 32630, 33179, 4, 5, 0, 0, 1, '見棄てられた者たちの地'),
(0, 0, 0, 0, 779, 32608, 33178, 32626, 33185, 32630, 33179, 4, 5, 0, 0, 1, '見棄てられた者たちの地(次元の門‧海底)'),
(0, 0, 0, 0, 8011, 32831, 32838, 32831, 32838, 32831, 32838, 8011, 0, 0, 0, 1, '歌う島'),
(0, 0, 0, 0, 8012, 32831, 32838, 32831, 32838, 32831, 32838, 8011, 0, 0, 0, 1, '歌う島（西部）'),
(0, 0, 0, 0, 8013, 32734, 32798, 32734, 32798, 32734, 32798, 8013, 0, 0, 0, 0, 'ドロモンドの部屋'),
(0, 0, 0, 0, 8014, 32745, 32722, 32745, 32722, 32745, 32722, 8014, 0, 0, 0, 0, '訓練所'),
(0, 0, 0, 0, 8015, 32831, 32838, 32831, 32838, 32831, 32838, 8011, 0, 0, 0, 1, '歌う島（北部）'),
(32512, 32810, 32581, 32865, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-隱れ里周邊1）'),
(32512, 32865, 32553, 32880, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-隱れ里周邊2）'),
(32512, 32880, 32541, 32995, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-隱れ里周邊3）'),
(32736, 32595, 32890, 32647, 400, 32600, 32922, 32600, 32922, 32600, 32922, 400, 0, 0, 0, 1, '地下大洞窟(隱れ里エリア-エレメンタリスト)'),
(32699, 32647, 32740, 32720, 400, 32600, 32922, 32600, 32922, 32600, 32922, 400, 0, 0, 0, 1, '地下大洞窟(隱れ里エリア-エレメンタリスト通路1)'),
(32740, 32647, 32890, 32720, 400, 32600, 32922, 32600, 32922, 32600, 32922, 400, 0, 0, 0, 1, '地下大洞窟(隱れ里エリア-エレメンタリスト通路2)'),
(32740, 32720, 32885, 32730, 400, 32600, 32922, 32600, 32922, 32600, 32922, 400, 0, 0, 0, 1, '地下大洞窟(隱れ里エリア-エレメンタリスト通路3)'),
(32586, 32813, 32659, 32868, 400, 32600, 32922, 32600, 32922, 32600, 32922, 400, 0, 0, 0, 1, '地下大洞窟(隱れ里エリア-隱れ里周邊1)'),
(32555, 32868, 32659, 32958, 400, 32600, 32922, 32600, 32922, 32600, 32922, 400, 0, 0, 0, 1, '地下大洞窟(隱れ里エリア-隱れ里周邊2)'),
(32530, 32958, 32730, 33003, 400, 32600, 32922, 32600, 32922, 32600, 32922, 400, 0, 0, 0, 1, '地下大洞窟(隱れ里エリア-隱れ里周邊3)'),
(32659, 32817, 32665, 32958, 400, 32600, 32922, 32600, 32922, 32600, 32922, 400, 0, 0, 0, 1, '地下大洞窟(隱れ里エリア-隱れ里-橋周邊1)'),
(32665, 32808, 32730, 32958, 400, 32600, 32922, 32600, 32922, 32600, 32922, 400, 0, 0, 0, 1, '地下大洞窟(隱れ里エリア-隱れ里-地底湖通路1)'),
(32730, 32796, 32746, 32829, 400, 32600, 32922, 32600, 32922, 32600, 32922, 400, 0, 0, 0, 1, '地下大洞窟(隱れ里エリア-隱れ里-地底湖通路2)'),
(32810, 32850, 32915, 32870, 400, 32600, 32922, 32600, 32922, 32600, 32922, 400, 0, 0, 0, 1, '地下大洞窟(隱れ里エリア-隱れ里-地底湖通路3)'),
(32915, 32920, 33000, 33000, 400, 32600, 32922, 32600, 32922, 32600, 32922, 400, 0, 0, 0, 1, '地下大洞窟(隱れ里エリア-地底湖入口)'),
(32752, 32730, 32865, 32852, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-古代巨人墓周邊)'),
(32863, 32830, 32915, 32940, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-ラスタバ城通路1)'),
(32911, 32618, 33004, 32860, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-ラスタバ城通路)'),
(32900, 32650, 32911, 32690, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-ラスタバ城通路3)'),
(32890, 32690, 32911, 32830, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-ラスタバ城通路4)'),
(32730, 32833, 32860, 32980, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-古代巨人墓橋周邊)'),
(32788, 32828, 32800, 32833, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-古代巨人墓テレポート周邊)'),
(32538, 32595, 32695, 32810, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-レジスタンス村周邊）'),
(32568, 32810, 32575, 32815, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-レジスタンス村周邊1）'),
(32658, 32810, 32665, 32816, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-レジスタンス村周邊2）'),
(32695, 32629, 32710, 32647, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-オーム洞窟入り口周邊1）'),
(32695, 32720, 32737, 32790, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-中央通り1）'),
(32737, 32730, 32890, 32765, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-中央通り2）'),
(32737, 32765, 32755, 32790, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-中央通り3）'),
(32695, 32790, 32710, 32810, 400, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（レジスタンスエリア-中央通り4）'),
(0, 0, 0, 0, 401, 32563, 32680, 32563, 32680, 32563, 32680, 400, 0, 0, 0, 1, '地下大洞窟（オームのダンジョン中間通路）'),
(0, 0, 0, 0, 450, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城城門'),
(0, 0, 0, 0, 451, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:集會場1F'),
(0, 0, 0, 0, 452, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:突擊隊訓練場1F'),
(0, 0, 0, 0, 453, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:魔獸軍王の執務室1F'),
(0, 0, 0, 0, 454, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:野獸調教室1F'),
(0, 0, 0, 0, 455, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:野獸訓練室1F'),
(0, 0, 0, 0, 456, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:魔獸召喚室1F'),
(0, 0, 0, 0, 457, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城：闇の結界1F'),
(0, 0, 0, 0, 460, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:黑魔法訓練場2F'),
(0, 0, 0, 0, 461, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:黑魔法研究室2F'),
(0, 0, 0, 0, 462, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:魔靈軍王の執務室2F'),
(0, 0, 0, 0, 463, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:魔靈軍王の書齋2F'),
(0, 0, 0, 0, 464, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:精靈召喚室2F'),
(0, 0, 0, 0, 465, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:精靈の生息地2F'),
(0, 0, 0, 0, 466, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:闇の精靈研究室2F'),
(0, 0, 0, 0, 467, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城：闇の結界2F'),
(0, 0, 0, 0, 468, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城：闇の結界2F(未使用)'),
(0, 0, 0, 0, 470, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:惡靈の祭壇3F'),
(0, 0, 0, 0, 471, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:デビルロードの祭壇3F'),
(0, 0, 0, 0, 472, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:傭兵訓練場3F'),
(0, 0, 0, 0, 473, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:冥法軍の訓練場3F'),
(0, 0, 0, 0, 474, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:オーム實驗室3F'),
(0, 0, 0, 0, 475, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:冥法軍王の執務室3F'),
(0, 0, 0, 0, 476, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:中央コントロールルーム3F'),
(0, 0, 0, 0, 477, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:デビルロードの傭兵室3F'),
(0, 0, 0, 0, 478, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:立入禁止エリア3F'),
(0, 0, 0, 0, 490, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:地下訓練場B1F'),
(0, 0, 0, 0, 491, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:地下通路B1F'),
(0, 0, 0, 0, 492, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:暗殺軍王の執務室B1F'),
(0, 0, 0, 0, 493, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:地下コントロールルームB1F'),
(0, 0, 0, 0, 494, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:地下處刑場B1F'),
(0, 0, 0, 0, 495, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:地下決鬥場B1F'),
(0, 0, 0, 0, 496, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:地下牢B1F'),
(0, 0, 0, 0, 530, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:4F入口'),
(0, 0, 0, 0, 531, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:グランカインの神殿/ケイナの部屋'),
(0, 0, 0, 0, 532, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:ビアタス/バロメス/エンディアスの部屋'),
(0, 0, 0, 0, 533, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:庭園/イデアの部屋'),
(0, 0, 0, 0, 534, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:ティアメス/ラミアス/バロードの部屋'),
(0, 0, 0, 0, 535, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ラスタバ城:カサンドラ/ダンテスの部屋'),
(0, 0, 0, 0, 536, 32744, 32818, 32744, 32818, 32744, 32818, 450, 0, 0, 0, 1, 'ダークエルフの聖地'),
(0, 0, 0, 0, 5140, 32624, 32813, 32624, 32813, 32624, 32813, 4, 3, 0, 0, 1, 'お化け屋敷'),
(0, 0, 0, 0, 16384, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, 'Talking Island Hotel Hotel'),
(0, 0, 0, 0, 16896, 32574, 32941, 32574, 32941, 32574, 32941, 0, 1, 0, 0, 1, 'Talking Island Hotel'),
(0, 0, 0, 0, 21054, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'SKT Hotel'),
(0, 0, 0, 0, 22016, 33082, 33389, 33082, 33389, 33082, 33389, 4, 2, 0, 0, 1, 'SKT Hotel'),
(0, 0, 0, 0, 17408, 32628, 32807, 32628, 32807, 32628, 32807, 4, 3, 0, 0, 1, 'Gludio Hotel'),
(0, 0, 0, 0, 17920, 32628, 32807, 32628, 32807, 32628, 32807, 4, 3, 0, 0, 1, 'Gludio Hotel'),
(0, 0, 0, 0, 20480, 32612, 33188, 32612, 33188, 32612, 33188, 4, 5, 0, 0, 1, 'Windawood Hotel'),
(0, 0, 0, 0, 20992, 32612, 33188, 32612, 33188, 32612, 33188, 4, 5, 0, 0, 1, 'Windawood Hotel'),
(0, 0, 0, 0, 18432, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'Giran Hotel'),
(0, 0, 0, 0, 18944, 33429, 32814, 33429, 32814, 33429, 32814, 4, 7, 0, 0, 1, 'Giran Hotel'),
(0, 0, 0, 0, 22528, 33604, 33237, 33604, 33237, 33604, 33237, 4, 8, 0, 0, 1, 'Heine Hotel'),
(0, 0, 0, 0, 23040, 33604, 33237, 33604, 33237, 33604, 33237, 4, 8, 0, 0, 1, 'Heine Hotel'),
(0, 0, 0, 0, 19456, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, 'Oren Hotel'),
(0, 0, 0, 0, 19968, 34053, 32284, 34053, 32284, 34053, 32284, 4, 10, 0, 0, 1, 'Oren Hotel');
