#----------------------------
# Table structure for commands
#----------------------------
CREATE TABLE `commands` (
  `name` varchar(255) NOT NULL,
  `access_level` int(10) NOT NULL default '200',
  `class_name` varchar(255) NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#----------------------------
# Records for commands
#----------------------------
INSERT INTO `commands` VALUES
('echo', 200, 'L1Echo'),
('setting', 200, 'L1Status'),
('summon', 200, 'L1Summon'),
('cleaning', 200, 'L1DeleteGroundItem'),
('addskill', 200, 'L1AddSkill'),
('level', 200, 'L1Level'),
('loc', 200, 'L1Loc'),
('desc', 200, 'L1Describe'),
('who', 200, 'L1Who'),
('allbuff', 200, 'L1AllBuff'),
('speed', 200, 'L1Speed'),
('adena', 200, 'L1Adena'),
('hpbar', 200, 'L1HpBar'),
('resettrap', 200, 'L1ResetTrap'),
('reloadtrap', 200, 'L1ReloadTrap'),
('showtrap', 200, 'L1ShowTrap'),
('castgfx', 200, 'L1CastGfx'),
('gfxid', 200, 'L1GfxId'),
('invgfxid', 200, 'L1InvGfxId'),
('hometown', 200, 'L1HomeTown'),
('gm', 200, 'L1GM'),
('present', 200, 'L1Present'),
('lvpresent', 200, 'L1LevelPresent'),
('shutdown', 200, 'L1Shutdown'),
('item', 200, 'L1CreateItem'),
('itemset', 200, 'L1CreateItemSet'),
('buff', 200, 'L1Buff'),
('patrol', 200, 'L1Patrol'),
('banip', 200, 'L1BanIp'),
('chat', 200, 'L1Chat'),
('chatng', 200, 'L1ChatNG'),
('skick', 200, 'L1SKick'),
('kick', 200, 'L1Kick'),
('powerkick', 200, 'L1PowerKick'),
('accbankick', 200, 'L1AccountBanKick'),
('poly', 200, 'L1Poly'),
('ress', 200, 'L1Ress'),
('death', 200, 'L1Kill'),
('gmroom', 200, 'L1GMRoom'),
('topc', 200, 'L1ToPC'),
('move', 200, 'L1Move'),
('weather', 200, 'L1ChangeWeather'),
('tospawn', 200, 'L1ToSpawn'),
('f', 200, 'L1Favorite'),
('recall', 200, 'L1Recall'),
('visible', 200, 'L1Visible'),
('partyrecall', 200, 'L1PartyRecall'),
('invisible', 200, 'L1Invisible'),
('spawn', 200, 'L1SpawnCmd'),
('insert', 200, 'L1InsertSpawn'),
('help', 200, 'L1CommandHelp'),
('action', 200, 'L1Action');
