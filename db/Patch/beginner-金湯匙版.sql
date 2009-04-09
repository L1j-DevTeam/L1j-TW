/*
MySQL Data Transfer
Source Host: localhost
Source Database: l1jdb
Target Host: localhost
Target Database: l1jdb
Date: 2009/4/9 ¤W¤È 09:07:01
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for beginner
-- ----------------------------
DROP TABLE IF EXISTS `beginner`;
CREATE TABLE `beginner` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(6) NOT NULL DEFAULT '0',
  `count` int(10) NOT NULL DEFAULT '0',
  `charge_count` int(10) NOT NULL DEFAULT '0',
  `enchantlvl` int(6) NOT NULL DEFAULT '0',
  `item_name` varchar(50) NOT NULL DEFAULT '',
  `activate` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `beginner` VALUES ('1', '40005', '1', '0', '0', 'ã­ã£ã³ãã«', 'A');
INSERT INTO `beginner` VALUES ('2', '40005', '1', '0', '0', 'ã­ã£ã³ãã«', 'A');
INSERT INTO `beginner` VALUES ('3', '40641', '1', '0', '0', 'ãã¼ã­ã³ã°ã¹ã¯ã­ã¼ã«', 'A');
INSERT INTO `beginner` VALUES ('4', '22', '1', '0', '6', 'éå­ç²ç ´å£è', 'A');
INSERT INTO `beginner` VALUES ('5', '20011', '1', '0', '4', 'æé­æ³é ­ç', 'A');
INSERT INTO `beginner` VALUES ('6', '20057', '1', '0', '4', 'å¥æ³è»çæç¯·', 'A');
INSERT INTO `beginner` VALUES ('7', '20085', '1', '0', '4', 'Tæ¤', 'A');
INSERT INTO `beginner` VALUES ('8', '20126', '1', '0', '4', 'è±¡çå¡ç®çç²', 'A');
INSERT INTO `beginner` VALUES ('9', '20173', '1', '0', '4', 'è±¡çå¡ç®æå¥', 'A');
INSERT INTO `beginner` VALUES ('10', '20206', '1', '0', '4', 'è±¡çå¡ç®æ¶¼é', 'A');
INSERT INTO `beginner` VALUES ('11', '20221', '1', '0', '4', 'éª·é«ç¾ç', 'A');
