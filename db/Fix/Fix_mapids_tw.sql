/* 20090516 測試更改水晶洞座標 */
Delete From mapids Where mapid = '72';
Delete From mapids Where mapid = '73';
Delete From mapids Where mapid = '74';
Insert Into `mapids` Values
('72', '水晶洞1F', '32704', '32895', '32768', '32895', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('73', '水晶洞2F', '32704', '32895', '32704', '32895', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1'),
('74', '水晶洞3F', '32704', '32895', '32768', '32959', '1', '1', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1');
