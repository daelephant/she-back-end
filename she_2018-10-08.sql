# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.21)
# Database: she
# Generation Time: 2018-10-08 12:23:03 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table banner
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banner`;

CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='banner管理表';

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;

INSERT INTO `banner` (`id`, `name`, `description`, `delete_time`, `update_time`)
VALUES
	(1,'首页置顶','首页轮播图',NULL,NULL),
	(2,'维修首页','维修首页轮播',NULL,NULL);

/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table banner_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banner_item`;

CREATE TABLE `banner_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联image表',
  `key_word` varchar(100) NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '跳转类型，可能导向商品，可能导向专题，可能导向其他。0，无导向；1：导向商品;2:导向专题',
  `delete_time` int(11) DEFAULT NULL,
  `banner_id` int(11) NOT NULL COMMENT '外键，关联banner表',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='banner子项表';

LOCK TABLES `banner_item` WRITE;
/*!40000 ALTER TABLE `banner_item` DISABLE KEYS */;

INSERT INTO `banner_item` (`id`, `img_id`, `key_word`, `type`, `delete_time`, `banner_id`, `update_time`)
VALUES
	(1,65,'6',1,NULL,1,NULL),
	(2,2,'25',1,NULL,1,NULL),
	(3,3,'11',1,NULL,1,NULL),
	(5,1,'10',1,NULL,1,NULL),
	(6,152,'30',0,NULL,2,NULL),
	(7,153,'35',0,NULL,2,NULL);

/*!40000 ALTER TABLE `banner_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table brand
# ------------------------------------------------------------

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '品牌名称',
  `brand_img_url` varchar(255) DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT '1',
  `from` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='品牌种类';

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;

INSERT INTO `brand` (`id`, `name`, `brand_img_url`, `delete_time`, `update_time`, `category_id`, `from`)
VALUES
	(1,'Breguet宝玑','/bag_breguet.jpg',NULL,NULL,2,1),
	(2,'Bvlgari宝格丽','/bag_bvlgari.jpg',NULL,NULL,2,1),
	(3,'Chanel香奈儿','/bag_chanel.jpg',NULL,NULL,2,1),
	(4,'Cartier卡地亚','/bag_cartier.jpg',NULL,NULL,2,1),
	(5,'Chopard肖邦','/bag_chopard.jpg',NULL,NULL,2,1),
	(6,'Gucci古驰','/bag_gucci.jpg',NULL,NULL,2,1),
	(7,'Hermes爱马仕','/bag_hermes.jpg',NULL,NULL,2,1),
	(8,'IWC万国','/bag_iwc.jpg',NULL,NULL,2,1),
	(9,'Longines浪琴','/bag_longines.jpg',NULL,NULL,2,1),
	(10,'Louis Vuitton路易威登','/bag_lv.jpg',NULL,NULL,2,1),
	(11,'Omega欧米茄','/bag_omega.jpg',NULL,NULL,2,1),
	(12,'Patek Philippe百达翡丽','/bag_patek.jpg',NULL,NULL,2,1),
	(13,'Rolex劳力士','/bag_rolex.jpg',NULL,NULL,2,1),
	(14,'Tudor帝陀','/bag_tudor.jpg',NULL,NULL,2,1),
	(15,'Vacheron Constantin江诗丹顿','/bag_vacheron.jpg',NULL,NULL,2,1),
	(16,'Alexander McQueen亚历山大麦昆',NULL,NULL,NULL,2,0),
	(17,'Balenciaga巴黎世家',NULL,NULL,NULL,2,0),
	(18,'Bally巴利',NULL,NULL,NULL,2,0),
	(19,'Bottega Veneta葆蝶家',NULL,NULL,NULL,2,0),
	(20,'Burberry巴宝莉',NULL,NULL,NULL,2,0),
	(21,'Celine赛琳',NULL,NULL,NULL,2,0),
	(22,'Chloe克洛伊',NULL,NULL,NULL,2,0),
	(23,'Christian Louboutin克里斯提鲁布托',NULL,NULL,NULL,2,0),
	(24,'Delvaux德尔沃',NULL,NULL,NULL,2,0),
	(25,'Dior迪奥',NULL,NULL,NULL,2,0),
	(26,'Dolce&Gabbana杜嘉班纳',NULL,NULL,NULL,2,0),
	(27,'Dunhill登喜路',NULL,NULL,NULL,2,0),
	(28,'Fendi芬迪',NULL,NULL,NULL,2,0),
	(29,'Ferragamo菲拉格慕',NULL,NULL,NULL,2,0),
	(30,'Versace范思哲',NULL,NULL,NULL,2,0),
	(31,'Gucci古驰',NULL,NULL,NULL,2,0),
	(32,'Givenchy纪梵希',NULL,NULL,NULL,2,0),
	(33,'Goyard高雅德',NULL,NULL,NULL,2,0),
	(34,'Hermes爱马仕',NULL,NULL,NULL,2,0),
	(35,'Valentino华伦天奴',NULL,NULL,NULL,2,0),
	(36,'Issey Miyake三宅一生',NULL,NULL,NULL,2,0),
	(37,'Givenchy纪梵希',NULL,NULL,NULL,2,0),
	(38,'Chloe克洛伊',NULL,NULL,NULL,2,0),
	(39,'Christian Louboutin克里斯提鲁布托',NULL,NULL,NULL,2,0),
	(40,'Louis Vuitton路易威登',NULL,NULL,NULL,2,0),
	(41,'Lancel兰姿',NULL,NULL,NULL,2,0),
	(42,'Lanvin浪凡',NULL,NULL,NULL,2,0),
	(43,'Loewe罗意威',NULL,NULL,NULL,2,0),
	(44,'Longchamp珑骧',NULL,NULL,NULL,2,0),
	(45,'Montblanc万宝龙',NULL,NULL,NULL,2,0),
	(46,'Marc Jacobs马克雅克布',NULL,NULL,NULL,2,0),
	(47,'Marni玛尼',NULL,NULL,NULL,2,0),
	(48,'MCM MCM',NULL,NULL,NULL,2,0),
	(49,'Miumiu缪缪',NULL,NULL,NULL,2,0),
	(50,'Moschino莫里奇诺',NULL,NULL,NULL,2,0),
	(51,'Moynat摩纳',NULL,NULL,NULL,2,0),
	(52,'Mulberry迈宝瑞',NULL,NULL,NULL,2,0),
	(53,'Prada普拉达',NULL,NULL,NULL,2,0),
	(54,'Saint Laurent圣罗兰',NULL,NULL,NULL,2,0),
	(55,'Stella McCartney斯特拉:麦卡托尼',NULL,NULL,NULL,2,0),
	(56,'Celine赛琳',NULL,NULL,NULL,2,0),
	(57,'TOD\'S托德斯',NULL,NULL,NULL,2,0),
	(58,'Valentino华伦天奴',NULL,NULL,NULL,2,0),
	(59,'Valextra瓦莱可斯特拉',NULL,NULL,NULL,2,0),
	(60,'Versace范思哲',NULL,NULL,NULL,2,0),
	(61,'Vivienne Westwood薇薇安.韦斯特伍德',NULL,NULL,NULL,2,0),
	(62,'Montblanc万宝龙',NULL,NULL,NULL,2,0),
	(63,'Valextra瓦莱可斯特拉',NULL,NULL,NULL,2,0),
	(65,'Alexander McQueen亚历山大:麦昆',NULL,NULL,NULL,2,0),
	(68,'A.lange&Sohne朗格',NULL,NULL,NULL,1,0),
	(69,'Audemars Piguet爱彼',NULL,NULL,NULL,1,0),
	(70,'Hermes爱马仕',NULL,NULL,NULL,1,0),
	(71,'Maurice L acroix艾美',NULL,NULL,NULL,1,0),
	(72,'Ball波尔',NULL,NULL,NULL,1,0),
	(73,'Baume & Mercier名仕',NULL,NULL,NULL,1,0),
	(74,'Bell & Ross柏莱士',NULL,NULL,NULL,1,0),
	(75,'Blancpain宝珀',NULL,NULL,NULL,1,0),
	(76,'Breguet宝玑','/watch_breguet.jpg',NULL,NULL,1,1),
	(77,'Breitling百年灵',NULL,NULL,NULL,1,0),
	(78,'Bvlgari宝格丽','/watch_bvlgari.jpg',NULL,NULL,1,1),
	(79,'Carl F. Bucherer宝齐莱',NULL,NULL,NULL,1,0),
	(80,'Patek Philippe百达翡丽',NULL,NULL,NULL,1,0),
	(81,'Piaget伯爵',NULL,NULL,NULL,1,0),
	(82,'Carl F. Bucherer宝齐莱',NULL,NULL,NULL,1,0),
	(83,'Cartier卡地亚','/watch_cartier.jpg',NULL,NULL,1,1),
	(84,'Chanel香奈儿','/watch_chanel.jpg',NULL,NULL,1,1),
	(85,'Charriol夏利豪',NULL,NULL,NULL,1,0),
	(86,'Chopard萧邦','/watch_chopard.jpg',NULL,NULL,1,1),
	(87,'Concord君皇',NULL,NULL,NULL,1,0),
	(88,'Corum昆仑',NULL,NULL,NULL,1,0),
	(89,'DANIEL ROTH丹尼尔罗斯',NULL,NULL,NULL,1,0),
	(90,'Tudor帝舵',NULL,NULL,NULL,1,0),
	(91,'Eble玉宝',NULL,NULL,NULL,1,0),
	(92,'Franck Muller法兰克穆勒',NULL,NULL,NULL,1,0),
	(93,'Girard-Perregaux芝柏',NULL,NULL,NULL,1,0),
	(94,'Glashutte Original格拉苏蒂',NULL,NULL,NULL,1,0),
	(95,'Greubel Forsey高铂富斯',NULL,NULL,NULL,1,0),
	(96,'Gucci古驰','/watch_gucci.jpg',NULL,NULL,1,1),
	(97,'Gerald Genta尊达',NULL,NULL,NULL,1,0),
	(98,'Hamilton汉米尔顿',NULL,NULL,NULL,1,0),
	(99,'Hermes爱马仕','/watch_hermes.jpg',NULL,NULL,1,1),
	(100,'Hublot宇舶',NULL,NULL,NULL,1,0),
	(101,'Oris豪利时',NULL,NULL,NULL,1,0),
	(102,'Sarcar geneve豪门世家',NULL,NULL,NULL,1,0),
	(103,'TAG Heuer豪雅',NULL,NULL,NULL,1,0),
	(104,'IWC万国','/watch_iwc.jpg',NULL,NULL,1,1),
	(105,'Jaeger-L eCoultre积家',NULL,NULL,NULL,1,0),
	(106,'Jaquet Droz雅克德罗',NULL,NULL,NULL,1,0),
	(107,'Jean Richard尚维沙',NULL,NULL,NULL,1,0),
	(108,'Juvenia尊皇',NULL,NULL,NULL,1,0),
	(109,'Concord君皇',NULL,NULL,NULL,1,0),
	(110,'Seiko精工',NULL,NULL,NULL,1,0),
	(111,'Vacheron Constantin江诗丹顿',NULL,NULL,NULL,1,0),
	(112,'Cartier卡地亚',NULL,NULL,NULL,1,0),
	(113,'Corum昆仑',NULL,NULL,NULL,1,0),
	(114,'Longines浪琴','/watch_longines.jpg',NULL,NULL,1,1),
	(115,'Louis Vuitton路易威登','/watch_louis.jpg',NULL,NULL,1,1),
	(116,'A.lange&Sohne朗格',NULL,NULL,NULL,1,0),
	(117,'Rado雷达',NULL,NULL,NULL,1,0),
	(118,'Raymond Weil蕾蒙威',NULL,NULL,NULL,1,0),
	(119,'Richard Mille里查德米尔',NULL,NULL,NULL,1,0),
	(120,'Roger Dubuis罗杰杜彼',NULL,NULL,NULL,1,0),
	(121,'Rolex劳力士',NULL,NULL,NULL,1,0),
	(122,'Marvin摩纹',NULL,NULL,NULL,1,0),
	(123,'Maurice L acroix艾美',NULL,NULL,NULL,1,0),
	(124,'Mido美度',NULL,NULL,NULL,1,0),
	(125,'Montblanc万宝龙',NULL,NULL,NULL,1,0),
	(126,'Baume & Mercier名仕',NULL,NULL,NULL,1,0),
	(127,'NOMOS',NULL,NULL,NULL,1,0),
	(128,'Omega欧米茄','/watch_omega.jpg',NULL,NULL,1,1),
	(129,'Oris豪利时',NULL,NULL,NULL,1,0),
	(130,'Panerai沛纳海',NULL,NULL,NULL,1,0),
	(131,'Parmigiani Fleurier帕玛强尼',NULL,NULL,NULL,1,0),
	(132,'Patek Philippe百达翡丽','/watch_patek.jpg',NULL,NULL,1,1),
	(133,'Piaget伯爵',NULL,NULL,NULL,1,0),
	(134,'Rado雷达',NULL,NULL,NULL,1,0),
	(135,'Raymond Weil蕾蒙威',NULL,NULL,NULL,1,0),
	(136,'Richard Mille里查德米尔',NULL,NULL,NULL,1,0),
	(137,'Roger Dubuis罗杰杜彼',NULL,NULL,NULL,1,0),
	(138,'Rolex劳力士','/watch_rolex.jpg',NULL,NULL,1,1),
	(139,'Sarcar geneve豪门世家',NULL,NULL,NULL,1,0),
	(140,'Seiko精工',NULL,NULL,NULL,1,0),
	(141,'Jean Richard尚维沙',NULL,NULL,NULL,1,0),
	(142,'TAG Heuer豪雅',NULL,NULL,NULL,1,0),
	(143,'Tissot天梭',NULL,NULL,NULL,1,0),
	(144,'Tudor帝舵','/watch_tudor.jpg',NULL,NULL,1,1),
	(145,'Ulysse Nardin雅典',NULL,NULL,NULL,1,0),
	(146,'Vacheron Constantin江诗丹顿','/watch_vacheron.jpg',NULL,NULL,1,1),
	(147,'VCA梵克雅宝',NULL,NULL,NULL,1,0),
	(148,'IWC万国',NULL,NULL,NULL,1,0),
	(149,'Montblanc万宝龙',NULL,NULL,NULL,1,0),
	(150,'Chanel香奈儿',NULL,NULL,NULL,1,0),
	(151,'Charriol夏利豪',NULL,NULL,NULL,1,0),
	(152,'Chopard萧邦',NULL,NULL,NULL,1,0),
	(153,'Eble玉宝',NULL,NULL,NULL,1,0),
	(154,'Hublot宇舶',NULL,NULL,NULL,1,0),
	(155,'Jaquet Droz雅克德罗',NULL,NULL,NULL,1,0),
	(156,'Ulysse Nardin雅典',NULL,NULL,NULL,1,0),
	(157,'Zenith真力时',NULL,NULL,NULL,1,0),
	(158,'Girard-Perregaux芝柏',NULL,NULL,NULL,1,0),
	(159,'Juvenia尊皇',NULL,NULL,NULL,1,0),
	(160,'Gerald Genta尊达',NULL,NULL,NULL,1,0),
	(161,'Bvlgari宝格丽','/gem_bvlgari.jpg',NULL,NULL,3,1),
	(162,'Cartier卡地亚','/gem_cartier.jpg',NULL,NULL,3,1),
	(163,'Chopard萧邦','/gem_chopard.jpg',NULL,NULL,3,1),
	(164,'Chaumet尚美',NULL,NULL,NULL,3,0),
	(165,'Damiani玳美雅',NULL,NULL,NULL,3,0),
	(166,'De Beers戴比尔斯',NULL,NULL,NULL,3,0),
	(167,'Tiffany&Co.蒂芙尼','/gem_tiffany.jpg',NULL,NULL,3,1),
	(168,'Harry Winston海瑞温斯顿',NULL,NULL,NULL,3,0),
	(169,'Cartier卡地亚',NULL,NULL,NULL,3,0),
	(170,'Mikimoto御木本','/gem_mikimoto.jpg',NULL,NULL,3,1),
	(171,'Chaumet尚美',NULL,NULL,NULL,3,0),
	(172,'Tasaki田崎',NULL,NULL,NULL,3,0),
	(173,'Tiffany&Co蒂芙尼',NULL,NULL,NULL,3,0),
	(174,'VCA梵克雅宝','/gem_vca.jpg',NULL,NULL,3,1),
	(175,'Chopard萧邦','/gem_chopard.jpg',NULL,NULL,3,0),
	(176,'Mikimoto御木本',NULL,NULL,NULL,3,0),
	(177,'其他','/gem_chopard.jpg',NULL,NULL,4,1);

/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `category_img_url` varchar(255) DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `from` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品类目';

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `name`, `category_img_url`, `delete_time`, `update_time`, `from`)
VALUES
	(1,'腕表','/category-bag.png',NULL,NULL,1),
	(2,'箱包','/category-bag.png',NULL,NULL,1),
	(3,'首饰','/category-bag.png',NULL,NULL,1),
	(4,'其他','/category-bag.png',NULL,NULL,1),
	(5,'金属','/category-bag.png',NULL,NULL,1);

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '所属识别',
  `only_num` char(13) DEFAULT NULL COMMENT '唯一num',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图片总表';

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;

INSERT INTO `image` (`id`, `url`, `from`, `delete_time`, `update_time`, `product_id`, `only_num`)
VALUES
	(1,'/banner-1a.png',1,NULL,NULL,NULL,NULL),
	(2,'/banner-2a.png',1,NULL,NULL,NULL,NULL),
	(3,'/banner-3a.png',1,NULL,NULL,NULL,NULL),
	(4,'/category-cake.png',1,NULL,NULL,NULL,NULL),
	(5,'/category-vg.png',1,NULL,NULL,NULL,NULL),
	(6,'/category-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(7,'/category-fry-a.png',1,NULL,NULL,NULL,NULL),
	(8,'/category-tea.png',1,NULL,NULL,NULL,NULL),
	(9,'/category-rice.png',1,NULL,NULL,NULL,NULL),
	(10,'/product-dryfruit@1.png',1,NULL,NULL,NULL,NULL),
	(13,'/product-vg@1.png',1,NULL,NULL,NULL,NULL),
	(14,'/product-rice@6.png',1,NULL,NULL,NULL,NULL),
	(16,'/1@theme.png',1,NULL,NULL,NULL,NULL),
	(17,'/2@theme.png',1,NULL,NULL,NULL,NULL),
	(18,'/3@theme.png',1,NULL,NULL,NULL,NULL),
	(19,'/detail-1@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(20,'/detail-2@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(21,'/detail-3@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(22,'/detail-4@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(23,'/detail-5@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(24,'/detail-6@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(25,'/detail-7@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(26,'/detail-8@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(27,'/detail-9@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(28,'/detail-11@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(29,'/detail-10@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(31,'/product-rice@1.png',1,NULL,NULL,NULL,NULL),
	(32,'/product-tea@1.png',1,NULL,NULL,NULL,NULL),
	(33,'/product-dryfruit@2.png',1,NULL,NULL,NULL,NULL),
	(36,'/product-dryfruit@3.png',1,NULL,NULL,NULL,NULL),
	(37,'/product-dryfruit@4.png',1,NULL,NULL,NULL,NULL),
	(38,'/product-dryfruit@5.png',1,NULL,NULL,NULL,NULL),
	(39,'/product-dryfruit-a@6.png',1,NULL,NULL,NULL,NULL),
	(40,'/product-dryfruit@7.png',1,NULL,NULL,NULL,NULL),
	(41,'/product-rice@2.png',1,NULL,NULL,NULL,NULL),
	(42,'/product-rice@3.png',1,NULL,NULL,NULL,NULL),
	(43,'/product-rice@4.png',1,NULL,NULL,NULL,NULL),
	(44,'/product-fry@1.png',1,NULL,NULL,NULL,NULL),
	(45,'/product-fry@2.png',1,NULL,NULL,NULL,NULL),
	(46,'/product-fry@3.png',1,NULL,NULL,NULL,NULL),
	(47,'/product-tea@2.png',1,NULL,NULL,NULL,NULL),
	(48,'/product-tea@3.png',1,NULL,NULL,NULL,NULL),
	(49,'/1@theme-head.png',1,NULL,NULL,NULL,NULL),
	(50,'/2@theme-head.png',1,NULL,NULL,NULL,NULL),
	(51,'/3@theme-head.png',1,NULL,NULL,NULL,NULL),
	(52,'/product-cake@1.png',1,NULL,NULL,NULL,NULL),
	(53,'/product-cake@2.png',1,NULL,NULL,NULL,NULL),
	(54,'/product-cake-a@3.png',1,NULL,NULL,NULL,NULL),
	(55,'/product-cake-a@4.png',1,NULL,NULL,NULL,NULL),
	(56,'/product-dryfruit@8.png',1,NULL,NULL,NULL,NULL),
	(57,'/product-fry@4.png',1,NULL,NULL,NULL,NULL),
	(58,'/product-fry@5.png',1,NULL,NULL,NULL,NULL),
	(59,'/product-rice@5.png',1,NULL,NULL,NULL,NULL),
	(60,'/product-rice@7.png',1,NULL,NULL,NULL,NULL),
	(62,'/detail-12@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(63,'/detail-13@1-dryfruit.png',1,NULL,NULL,NULL,NULL),
	(65,'/banner-4a.png',1,NULL,NULL,NULL,NULL),
	(66,'/product-vg@4.png',1,NULL,NULL,NULL,NULL),
	(67,'/product-vg@5.png',1,NULL,NULL,NULL,NULL),
	(68,'/product-vg@2.png',1,NULL,NULL,NULL,NULL),
	(69,'/product-vg@3.png',1,NULL,NULL,NULL,NULL),
	(147,'/product-B830304866649704.png',1,NULL,NULL,NULL,'cyx1535630484'),
	(148,'/product-B830304868448473.png',1,NULL,NULL,NULL,'cyx1535630484'),
	(149,'/product-B830304869995213.png',1,NULL,NULL,NULL,'cyx1535630484'),
	(150,'/product-B830304871280778.png',1,NULL,NULL,NULL,'cyx1535630484'),
	(151,'/product-B830304872567250.png',1,NULL,NULL,NULL,'cyx1535630484'),
	(152,'/banner-1b.png',1,NULL,NULL,NULL,NULL),
	(153,'/banner-2b.png',1,NULL,NULL,NULL,NULL),
	(154,'/product-B926489049030742.png',1,NULL,NULL,NULL,'cyx1537948873'),
	(155,'/product-B926489052034963.png',1,NULL,NULL,NULL,'cyx1537948873'),
	(156,'/product-B926489053957912.png',1,NULL,NULL,NULL,'cyx1537948873'),
	(157,'/product-B926489055710863.png',1,NULL,NULL,NULL,'cyx1537948873'),
	(158,'/product-B926489058433973.png',1,NULL,NULL,NULL,'cyx1537948873'),
	(159,'/product-B926505649316454.png',1,NULL,NULL,NULL,'cyx1537950562'),
	(160,'/product-B926505652367010.png',1,NULL,NULL,NULL,'cyx1537950562'),
	(161,'/product-B926505654466855.jpg',1,NULL,NULL,NULL,'cyx1537950562'),
	(162,'/product-B926505656458184.png',1,NULL,NULL,NULL,'cyx1537950562'),
	(163,'/product-B926505657907880.jpg',1,NULL,NULL,NULL,'cyx1537950562'),
	(164,'/product-B926508998637440.png',1,NULL,NULL,NULL,'cyx1537950871'),
	(165,'/product-B926509001276940.png',1,NULL,NULL,NULL,'cyx1537950871'),
	(166,'/product-B926509003130276.png',1,NULL,NULL,NULL,'cyx1537950871'),
	(167,'/product-B926509004943506.png',1,NULL,NULL,NULL,'cyx1537950871'),
	(168,'/product-B926509007010517.png',1,NULL,NULL,NULL,'cyx1537950871'),
	(169,'/product-B926509008935258.png',1,NULL,NULL,NULL,'cyx1537950871'),
	(170,'/product-B926515152489876.png',1,NULL,NULL,NULL,'cyx1537951513'),
	(171,'/product-B926515156062751.png',1,NULL,NULL,NULL,'cyx1537951513'),
	(172,'/product-B926515157877294.png',1,NULL,NULL,NULL,'cyx1537951513'),
	(173,'/product-B926515159614224.png',1,NULL,NULL,NULL,'cyx1537951513'),
	(174,'/product-B926515160981217.png',1,NULL,NULL,NULL,'cyx1537951513'),
	(175,'/product-B926515162300893.png',1,NULL,NULL,NULL,'cyx1537951513'),
	(176,'/product-B926522203279381.png',1,NULL,NULL,NULL,'cyx1537952209'),
	(177,'/product-B926522204632262.png',1,NULL,NULL,NULL,'cyx1537952209'),
	(178,'/product-B926522205665435.png',1,NULL,NULL,NULL,'cyx1537952209'),
	(179,'/product-B926522207109417.png',1,NULL,NULL,NULL,'cyx1537952209'),
	(180,'/product-B926522208219272.png',1,NULL,NULL,NULL,'cyx1537952209'),
	(181,'/product-B926522209505958.png',1,NULL,NULL,NULL,'cyx1537952209'),
	(182,'/product-B926523130388792.png',1,NULL,NULL,NULL,'cyx1537952309'),
	(183,'/product-B926523133375429.png',1,NULL,NULL,NULL,'cyx1537952309'),
	(184,'/product-B926523135324094.png',1,NULL,NULL,NULL,'cyx1537952309'),
	(185,'/product-B926523136605003.png',1,NULL,NULL,NULL,'cyx1537952309'),
	(186,'/product-B926523137868953.png',1,NULL,NULL,NULL,'cyx1537952309'),
	(187,'/product-B926523139148305.png',1,NULL,NULL,NULL,'cyx1537952309'),
	(188,'/product-B926527863304676.png',1,NULL,NULL,NULL,'cyx1537952761'),
	(189,'/product-B926527865546573.png',1,NULL,NULL,NULL,'cyx1537952761'),
	(190,'/product-B926527867228587.png',1,NULL,NULL,NULL,'cyx1537952761'),
	(191,'/product-B926527868888224.png',1,NULL,NULL,NULL,'cyx1537952761'),
	(192,'/product-B926527870641244.png',1,NULL,NULL,NULL,'cyx1537952761'),
	(193,'/product-B926527872692313.png',1,NULL,NULL,NULL,'cyx1537952761'),
	(194,'/product-B926534211124095.png',1,NULL,NULL,NULL,'cyx1537953420'),
	(195,'/product-B926534212564296.png',1,NULL,NULL,NULL,'cyx1537953420'),
	(196,'/product-B926534213846273.png',1,NULL,NULL,NULL,'cyx1537953420'),
	(197,'/product-B926534215324726.png',1,NULL,NULL,NULL,'cyx1537953420'),
	(198,'/product-B926534216543160.png',1,NULL,NULL,NULL,'cyx1537953420'),
	(199,'/product-B926534217771618.png',1,NULL,NULL,NULL,'cyx1537953420'),
	(200,'/product-B926537284056180.png',1,NULL,NULL,NULL,'cyx1537953688'),
	(201,'/product-B926537285376708.png',1,NULL,NULL,NULL,'cyx1537953688'),
	(202,'/product-B926537286599688.png',1,NULL,NULL,NULL,'cyx1537953688'),
	(203,'/product-B926537287844167.png',1,NULL,NULL,NULL,'cyx1537953688'),
	(204,'/product-B926537289285216.png',1,NULL,NULL,NULL,'cyx1537953688'),
	(205,'/product-B926537290503805.png',1,NULL,NULL,NULL,'cyx1537953688'),
	(206,'/product-B926555002607209.png',1,NULL,NULL,NULL,'cyx1537955471'),
	(207,'/product-B926555008901755.png',1,NULL,NULL,NULL,'cyx1537955471'),
	(208,'/product-B926555010479398.png',1,NULL,NULL,NULL,'cyx1537955471'),
	(209,'/product-B926555012323158.png',1,NULL,NULL,NULL,'cyx1537955471'),
	(210,'/product-B926555013677089.png',1,NULL,NULL,NULL,'cyx1537955471'),
	(211,'/product-B926555015987956.png',1,NULL,NULL,NULL,'cyx1537955471'),
	(212,'/product-B926556321614064.png',1,NULL,NULL,NULL,'cyx1537955629'),
	(213,'/product-B926556324161616.png',1,NULL,NULL,NULL,'cyx1537955629'),
	(214,'/product-B926556326133152.png',1,NULL,NULL,NULL,'cyx1537955629'),
	(215,'/product-B926556328176509.png',1,NULL,NULL,NULL,'cyx1537955629'),
	(216,'/product-B926556330269148.png',1,NULL,NULL,NULL,'cyx1537955629'),
	(217,'/product-B926556332285617.png',1,NULL,NULL,NULL,'cyx1537955629'),
	(218,'/product-B926588891524337.png',1,NULL,NULL,NULL,'cyx1537956102'),
	(219,'/product-B926588894551117.png',1,NULL,NULL,NULL,'cyx1537956102'),
	(220,'/product-B926588897597567.png',1,NULL,NULL,NULL,'cyx1537956102'),
	(221,'/product-B926588900884355.png',1,NULL,NULL,NULL,'cyx1537956102'),
	(222,'/product-B926588903916094.png',1,NULL,NULL,NULL,'cyx1537956102'),
	(223,'/product-B926607983549355.png',1,NULL,NULL,NULL,'cyx1537960762'),
	(224,'/product-B926607987007902.png',1,NULL,NULL,NULL,'cyx1537960762'),
	(225,'/product-B926607989101653.png',1,NULL,NULL,NULL,'cyx1537960762'),
	(226,'/product-B926607992173546.png',1,NULL,NULL,NULL,'cyx1537960762'),
	(227,'/product-B926607995279411.png',1,NULL,NULL,NULL,'cyx1537960762'),
	(228,'/product-B926607997351450.png',1,NULL,NULL,NULL,'cyx1537960762'),
	(229,'/product-B926645900423935.jpg',1,NULL,NULL,NULL,'cyx1537964536'),
	(230,'/product-B926645903959925.jpg',1,NULL,NULL,NULL,'cyx1537964536'),
	(231,'/product-B926645906939218.jpg',1,NULL,NULL,NULL,'cyx1537964536'),
	(232,'/product-B926645909964483.jpg',1,NULL,NULL,NULL,'cyx1537964536'),
	(233,'/product-B926645913075776.jpg',1,NULL,NULL,NULL,'cyx1537964536'),
	(234,'/product-B926645916068134.jpg',1,NULL,NULL,NULL,'cyx1537964536'),
	(235,'/product-B926648006746529.jpg',1,NULL,NULL,NULL,'cyx1537964797'),
	(236,'/product-B926648010235860.jpg',1,NULL,NULL,NULL,'cyx1537964797'),
	(237,'/product-B926648013144019.jpg',1,NULL,NULL,NULL,'cyx1537964797'),
	(238,'/product-B926648015130508.jpg',1,NULL,NULL,NULL,'cyx1537964797'),
	(239,'/product-B926648017064910.jpg',1,NULL,NULL,NULL,'cyx1537964797'),
	(240,'/product-B926648020136764.jpg',1,NULL,NULL,NULL,'cyx1537964797'),
	(241,'/product-B926649192057394.jpg',1,NULL,NULL,NULL,'cyx1537964914'),
	(242,'/product-B926649197804980.jpg',1,NULL,NULL,NULL,'cyx1537964914'),
	(243,'/product-B926649200245981.jpg',1,NULL,NULL,NULL,'cyx1537964914'),
	(244,'/product-B926649202913777.jpg',1,NULL,NULL,NULL,'cyx1537964914'),
	(245,'/product-B926649204979242.jpg',1,NULL,NULL,NULL,'cyx1537964914'),
	(246,'/product-B926649207050189.jpg',1,NULL,NULL,NULL,'cyx1537964914'),
	(247,'/product-B926710499759118.jpg',1,NULL,NULL,NULL,'cyx1537971039'),
	(248,'/product-B926710503925540.jpg',1,NULL,NULL,NULL,'cyx1537971039'),
	(249,'/product-B926710507097209.jpg',1,NULL,NULL,NULL,'cyx1537971039'),
	(250,'/product-B926710510198548.jpg',1,NULL,NULL,NULL,'cyx1537971039'),
	(251,'/product-B926710513337908.jpg',1,NULL,NULL,NULL,'cyx1537971039'),
	(252,'/product-B926710515408587.jpg',1,NULL,NULL,NULL,'cyx1537971039'),
	(253,'/product-B926725709300538.jpg',1,NULL,NULL,NULL,'cyx1537972561'),
	(254,'/product-B926725717533995.jpg',1,NULL,NULL,NULL,'cyx1537972561'),
	(255,'/product-B926725721599601.jpg',1,NULL,NULL,NULL,'cyx1537972561'),
	(256,'/product-B926725725814461.jpg',1,NULL,NULL,NULL,'cyx1537972561'),
	(257,'/product-B926725729862772.jpg',1,NULL,NULL,NULL,'cyx1537972561'),
	(258,'/product-B926725731856705.jpg',1,NULL,NULL,NULL,'cyx1537972561'),
	(259,'/product-B927273016525596.jpg',1,NULL,NULL,NULL,'cyx1538027298'),
	(260,'/product-B927273022966094.jpg',1,NULL,NULL,NULL,'cyx1538027298'),
	(261,'/product-B927273026978542.jpg',1,NULL,NULL,NULL,'cyx1538027298'),
	(262,'/product-B927273029947636.jpg',1,NULL,NULL,NULL,'cyx1538027298'),
	(263,'/product-B927273035236786.jpg',1,NULL,NULL,NULL,'cyx1538027298'),
	(264,'/product-B927273036996371.jpg',1,NULL,NULL,NULL,'cyx1538027298');

/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table image_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `image_category`;

CREATE TABLE `image_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT '所属识别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分类提交图片总表';

LOCK TABLES `image_category` WRITE;
/*!40000 ALTER TABLE `image_category` DISABLE KEYS */;

INSERT INTO `image_category` (`id`, `url`, `from`, `delete_time`, `update_time`, `category_id`)
VALUES
	(2,'/watch_access1.jpg',1,NULL,NULL,1),
	(3,'/watch_access2.jpg',1,NULL,NULL,1),
	(4,'/watch_access3.jpg',1,NULL,NULL,1),
	(5,'/watch_access4.jpg',1,NULL,NULL,1),
	(6,'/watch_access5.jpg',1,NULL,NULL,1),
	(7,'/watch_access6.jpg',1,NULL,NULL,1),
	(8,'/watch_access6.jpg',1,NULL,NULL,2),
	(9,'/watch_title1.png',1,NULL,NULL,1),
	(10,'/watch_title2.png',1,NULL,NULL,1),
	(11,'/watch_title3.png',1,NULL,NULL,1),
	(12,'/watch_title4.png',1,NULL,NULL,1),
	(13,'/watch_title5.png',1,NULL,NULL,1),
	(14,'/watch_title6.png',1,NULL,NULL,1);

/*!40000 ALTER TABLE `image_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `evaluate_price` int(11) DEFAULT NULL COMMENT '评估价格,单位：元',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:已提交， 2：待评估，3：已评估 , 4: 已出售 ，5：已退回，6：已取消',
  `snap_img` varchar(255) DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` varchar(80) DEFAULT NULL COMMENT '订单快照名称',
  `update_time` int(11) DEFAULT NULL,
  `snap_items` text COMMENT '订单其他信息快照（json)',
  `snap_address` varchar(500) DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;

INSERT INTO `order` (`id`, `order_no`, `user_id`, `delete_time`, `create_time`, `evaluate_price`, `status`, `snap_img`, `snap_name`, `update_time`, `snap_items`, `snap_address`, `prepay_id`)
VALUES
	(1,'cyx1537972561',2,NULL,1537972573,NULL,1,'http://she.cn/images/watch_access1.jpg','腕表',1537972573,NULL,NULL,NULL);

/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_product`;

CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;

INSERT INTO `order_product` (`order_id`, `product_id`, `count`, `delete_time`, `update_time`)
VALUES
	(5,4,1,NULL,NULL),
	(3,5,1,NULL,NULL),
	(1,7,1,NULL,NULL);

/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_admin`;

CREATE TABLE `p2018_admin` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员';

LOCK TABLES `p2018_admin` WRITE;
/*!40000 ALTER TABLE `p2018_admin` DISABLE KEYS */;

INSERT INTO `p2018_admin` (`id`, `username`, `password`)
VALUES
	(1,'root','21232f297a57a5a743894a0e4a801fc3'),
	(3,'goods','59da8bd04473ac6711d74cd91dbe903d'),
	(4,'rbac','eae22f4f89a3e1a049b3992d107229d1');

/*!40000 ALTER TABLE `p2018_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_admin_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_admin_role`;

CREATE TABLE `p2018_admin_role` (
  `admin_id` mediumint(8) unsigned NOT NULL COMMENT '管理员id',
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色id',
  KEY `admin_id` (`admin_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员角色';

LOCK TABLES `p2018_admin_role` WRITE;
/*!40000 ALTER TABLE `p2018_admin_role` DISABLE KEYS */;

INSERT INTO `p2018_admin_role` (`admin_id`, `role_id`)
VALUES
	(3,1),
	(4,2);

/*!40000 ALTER TABLE `p2018_admin_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_attribute`;

CREATE TABLE `p2018_attribute` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `attr_name` varchar(30) NOT NULL COMMENT '属性名称',
  `attr_type` enum('唯一','可选') NOT NULL COMMENT '属性类型',
  `attr_option_values` varchar(300) NOT NULL DEFAULT '' COMMENT '属性可选值',
  `type_id` mediumint(8) unsigned NOT NULL COMMENT '所属类型Id',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='属性表';

LOCK TABLES `p2018_attribute` WRITE;
/*!40000 ALTER TABLE `p2018_attribute` DISABLE KEYS */;

INSERT INTO `p2018_attribute` (`id`, `attr_name`, `attr_type`, `attr_option_values`, `type_id`)
VALUES
	(1,'颜色','可选','白色,黑色,绿色,紫色,蓝色,金色,银色,粉色',1),
	(4,'出厂日期','唯一','',1),
	(5,'操作系统','可选','ios,android,windows',1),
	(6,'页数','唯一','',3),
	(7,'作者','唯一','',3),
	(8,'材质','唯一','',2),
	(9,'尺码','可选','M,XL,XXL,XXXL,XXXXL',2),
	(10,'屏幕尺寸','唯一','',1),
	(12,'出版社','可选','人大出版社,清华出版社',3),
	(13,'颜色','可选','白色,粉色',3);

/*!40000 ALTER TABLE `p2018_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_brand
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_brand`;

CREATE TABLE `p2018_brand` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `brand_name` varchar(30) NOT NULL COMMENT '品牌名称',
  `site_url` varchar(150) NOT NULL DEFAULT '' COMMENT '官方网址',
  `logo` varchar(150) NOT NULL DEFAULT '' COMMENT '品牌Logo图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品牌';

LOCK TABLES `p2018_brand` WRITE;
/*!40000 ALTER TABLE `p2018_brand` DISABLE KEYS */;

INSERT INTO `p2018_brand` (`id`, `brand_name`, `site_url`, `logo`)
VALUES
	(2,'劳力士','','Brand/2015-10-13/561cc92ba6c33.jpg'),
	(3,'卡塔尔','mi.com','Brand/2018-03-24/5ab5b85f4ec30.jpg'),
	(4,'香奈儿','sumsung','Brand/2018-03-24/5ab5b8ca4d1ff.jpg'),
	(5,'亚历山大','huawei.com','Brand/2018-03-24/5ab5b8e47c12c.jpg'),
	(6,'泰铢儿','','');

/*!40000 ALTER TABLE `p2018_brand` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_cart`;

CREATE TABLE `p2018_cart` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  `goods_attr_id` varchar(150) NOT NULL DEFAULT '' COMMENT '商品属性Id',
  `goods_number` mediumint(8) unsigned NOT NULL COMMENT '购买的数量',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员Id',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';



# Dump of table p2018_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_category`;

CREATE TABLE `p2018_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `cat_name` varchar(30) NOT NULL COMMENT '分类名称',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类的Id,0:顶级分类',
  `is_floor` enum('是','否') NOT NULL DEFAULT '否' COMMENT '是否推荐楼层',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类';

LOCK TABLES `p2018_category` WRITE;
/*!40000 ALTER TABLE `p2018_category` DISABLE KEYS */;

INSERT INTO `p2018_category` (`id`, `cat_name`, `parent_id`, `is_floor`)
VALUES
	(1,'腕表',0,'是'),
	(2,'箱包',0,'是'),
	(3,'首饰',0,'是'),
	(4,'配饰',0,'否'),
	(5,'服装',0,'否'),
	(6,'鞋履',0,'否'),
	(8,'其他',0,'否');

/*!40000 ALTER TABLE `p2018_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_comment`;

CREATE TABLE `p2018_comment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员Id',
  `content` varchar(200) NOT NULL COMMENT '内容',
  `addtime` datetime NOT NULL COMMENT '发表时间',
  `star` tinyint(3) unsigned NOT NULL COMMENT '分值',
  `click_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '有用的数字',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';

LOCK TABLES `p2018_comment` WRITE;
/*!40000 ALTER TABLE `p2018_comment` DISABLE KEYS */;

INSERT INTO `p2018_comment` (`id`, `goods_id`, `member_id`, `content`, `addtime`, `star`, `click_count`)
VALUES
	(1,4,1,'测试','2015-10-28 09:40:55',5,0),
	(2,4,1,'测试','2015-10-28 09:41:25',4,0),
	(3,4,1,'测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试v','2015-10-28 09:41:53',4,0),
	(4,4,1,'formformformformformform','2015-10-28 09:43:26',4,0),
	(5,4,1,'fdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasfdasf','2015-10-28 09:43:40',3,0),
	(6,4,1,'1233212','2015-10-28 09:43:57',5,0),
	(7,4,1,'测试一下！！','2015-10-28 09:54:28',4,0),
	(8,4,1,'再测试一下！！','2015-10-28 09:55:22',1,0),
	(9,4,1,'再评论五！！','2015-10-28 09:56:25',2,0),
	(10,4,1,'123','2015-10-28 09:56:30',4,0),
	(11,4,1,'53645','2015-10-28 09:56:34',3,0),
	(12,4,1,'6576','2015-10-28 09:56:39',1,0),
	(13,4,1,'45645','2015-10-28 09:56:42',3,0),
	(14,4,1,'65576565','2015-10-28 09:56:45',2,0),
	(15,4,1,'最新的评论！！@3','2015-10-28 09:56:55',4,0),
	(16,4,1,'最新的评论！@#1','2015-10-28 09:57:07',4,0),
	(17,4,1,'滚动起来！@#','2015-10-28 09:59:18',4,0),
	(18,4,1,'234432','2015-10-28 09:59:24',4,0),
	(19,4,1,'435554','2015-10-28 09:59:27',5,0),
	(20,4,1,'454545','2015-10-28 09:59:31',1,0),
	(21,4,1,'7687','2015-10-28 09:59:35',5,0),
	(22,4,1,'454565','2015-10-28 09:59:41',3,0),
	(23,4,1,'76687687','2015-10-28 09:59:45',2,0),
	(24,4,1,'滚动吧！','2015-10-28 09:59:54',5,0),
	(25,4,1,'！@#QEWQEWfdsa','2015-10-28 10:00:08',1,0),
	(26,4,1,'厅','2015-10-28 10:00:46',5,0),
	(27,4,1,'1231213','2015-10-28 10:03:24',5,0),
	(28,4,1,'342432','2015-10-28 10:03:29',5,0),
	(29,4,1,'4345','2015-10-28 10:03:35',5,0),
	(30,4,1,'56545','2015-10-28 10:03:40',5,0),
	(31,4,1,'砌墙左','2015-10-28 10:03:49',5,0),
	(32,4,1,'43我用脾','2015-10-28 10:04:01',3,0),
	(33,4,1,'sfdsafdas','2015-10-28 10:04:10',3,0),
	(34,4,1,'fdfdadf','2015-10-28 10:04:32',4,0),
	(35,4,1,'fdafdas','2015-10-28 10:04:50',5,0),
	(36,4,1,'4434343','2015-10-28 10:04:54',2,0),
	(37,4,1,'454545','2015-10-28 10:05:00',1,0),
	(38,4,1,'434343','2015-10-28 10:05:40',5,0),
	(39,4,1,'454545','2015-10-28 10:05:44',3,0),
	(40,4,1,'&lt;script&gt;alert(123132);&lt;/script&gt;','2015-10-28 10:05:59',5,0),
	(41,4,1,'&lt;script&gt;alert(123132);&lt;/script&gt;','2015-10-28 10:06:30',5,0),
	(42,4,1,'&lt;script&gt;alert(123132);&lt;/script&gt;','2015-10-28 10:06:38',3,0),
	(43,4,1,'fdsfdsaafds','2015-10-28 10:53:14',5,0),
	(44,4,1,'fafdadfs','2015-10-28 10:53:38',5,0),
	(45,4,1,'fdsfdsa','2015-10-28 10:53:58',5,0),
	(46,4,1,'fdasfd','2015-10-28 11:04:41',5,0),
	(47,4,1,'2132321','2015-10-28 11:17:07',5,0),
	(48,4,1,'印象数据的测试！！！','2015-10-28 15:00:44',3,0),
	(49,4,1,'再测试！！1·','2015-10-28 15:02:17',5,0),
	(50,4,1,'测试一下！！','2015-10-28 15:10:55',2,0),
	(51,4,1,'测试','2015-10-28 15:11:19',5,0),
	(52,4,1,'大棒 324324','2015-10-28 15:12:49',5,0),
	(53,4,1,'dfsaafds','2015-10-28 15:38:19',5,0),
	(54,4,1,'fdsafdsadsa','2015-10-28 15:38:51',5,0),
	(55,4,1,'fdfdsa','2015-10-28 15:44:26',5,0),
	(56,9,1,'0406','2018-04-07 16:38:45',5,0),
	(57,9,1,'啊','2018-04-07 17:16:33',4,0),
	(58,11,1,'lalalla','2018-04-07 17:17:58',4,0),
	(59,11,1,'04061','2018-04-07 17:19:09',5,0),
	(60,11,1,'04062','2018-04-07 17:19:32',4,0),
	(61,11,1,'dadada','2018-04-07 17:24:50',4,0),
	(62,11,1,'wishing','2018-04-07 17:25:47',4,0),
	(63,11,1,'测试0406呀呀','2018-04-07 17:28:12',5,0),
	(64,11,1,'大街上','2018-04-07 17:28:27',3,0),
	(65,11,1,'我1','2018-04-07 17:29:31',1,0),
	(66,11,1,'啦啦啦1','2018-04-07 17:30:31',2,0),
	(67,11,1,'万千瓦群','2018-04-07 17:30:41',5,0),
	(68,11,1,'按时','2018-04-07 17:30:53',4,0),
	(69,11,1,'阿达','2018-04-07 17:30:59',3,0),
	(70,11,1,'请求','2018-04-07 17:33:28',3,0),
	(71,4,1,'www','2018-04-07 17:34:07',5,0),
	(72,4,1,'qq','2018-04-07 17:34:11',4,0),
	(73,4,1,'qwsa','2018-04-07 17:34:16',3,0),
	(74,4,1,'asa','2018-04-07 17:34:21',4,0),
	(75,4,1,'qwqwsq','2018-04-07 17:39:04',4,0),
	(76,4,1,'aaaa','2018-04-07 17:40:44',5,0),
	(77,4,1,'kakak','2018-04-07 17:40:56',4,0),
	(78,11,1,'lalla','2018-04-07 17:41:25',3,0),
	(79,11,1,'success','2018-04-07 17:41:39',4,0),
	(80,11,1,'sdjkas','2018-04-07 17:41:51',3,0),
	(81,11,1,'sjkasdjka','2018-04-07 17:42:00',4,0),
	(82,11,1,'sadia','2018-04-07 17:42:15',3,0),
	(83,4,1,'asdja','2018-04-07 17:43:07',1,0),
	(84,4,1,'qwq','2018-04-07 17:43:41',4,0),
	(85,4,1,'aa','2018-04-07 17:46:03',1,0),
	(86,4,1,'asas','2018-04-07 17:46:26',4,0),
	(87,4,1,'爱爱啊','2018-04-07 17:53:37',5,0),
	(88,4,1,'啊啊','2018-04-07 17:53:49',1,0),
	(89,4,1,'驱蚊器','2018-04-07 17:53:58',1,0),
	(90,4,1,'驱蚊器','2018-04-07 17:54:08',5,0),
	(91,4,1,'1212','2018-04-07 17:54:17',5,0),
	(92,4,1,'1','2018-04-07 17:54:54',5,0),
	(93,4,1,'2','2018-04-07 17:54:59',5,0),
	(94,4,1,'3','2018-04-07 17:55:04',4,0),
	(95,4,1,'4','2018-04-07 17:55:12',4,0),
	(96,4,1,'5','2018-04-07 17:55:17',3,0),
	(97,4,1,'111','2018-04-07 17:56:03',4,0),
	(98,4,1,'2','2018-04-07 17:56:11',3,0),
	(99,4,1,'1','2018-04-07 17:57:05',5,0),
	(100,4,1,'2','2018-04-07 17:57:38',4,0),
	(101,4,1,'33','2018-04-07 17:57:49',3,0),
	(102,4,1,'4','2018-04-07 17:58:00',4,0),
	(103,4,1,'5','2018-04-07 17:58:05',1,0),
	(104,4,1,'6','2018-04-07 17:58:10',1,0),
	(105,4,1,'7','2018-04-07 17:58:14',1,0),
	(106,4,1,'1','2018-04-07 18:00:57',3,0),
	(107,4,1,'44','2018-04-07 18:01:10',1,0),
	(108,4,1,'4','2018-04-07 18:04:44',4,0),
	(109,4,1,'驱蚊器','2018-04-07 18:04:50',4,0),
	(110,4,1,'12121','2018-04-07 18:04:58',3,0),
	(111,11,1,'我','2018-04-07 22:55:55',4,0),
	(112,4,1,'3242','2018-04-07 23:27:20',4,0),
	(113,5,1,'we','2018-04-07 23:28:02',5,0);

/*!40000 ALTER TABLE `p2018_comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_comment_reply
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_comment_reply`;

CREATE TABLE `p2018_comment_reply` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `comment_id` mediumint(8) unsigned NOT NULL COMMENT '评论Id',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员Id',
  `content` varchar(200) NOT NULL COMMENT '内容',
  `addtime` datetime NOT NULL COMMENT '发表时间',
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论回复';

LOCK TABLES `p2018_comment_reply` WRITE;
/*!40000 ALTER TABLE `p2018_comment_reply` DISABLE KEYS */;

INSERT INTO `p2018_comment_reply` (`id`, `comment_id`, `member_id`, `content`, `addtime`)
VALUES
	(1,54,1,'回复！！','2015-10-28 16:19:54'),
	(2,54,1,'回复！！！','2015-10-28 16:22:37'),
	(3,54,1,'回复一下1！！','2015-10-28 16:33:59'),
	(4,54,1,'再回复现代战争！！！','2015-10-28 16:34:09'),
	(5,54,1,'苷械  苷械  苷械  苷械  苷械  苷械','2015-10-28 16:34:16'),
	(6,54,1,'口口口口口口口口中','2015-10-28 16:34:44'),
	(7,52,1,'发表个回复试试','2015-10-28 16:43:23'),
	(8,53,1,'yuyuyuyuyu','2015-10-28 16:43:58'),
	(9,51,1,'ohjgfsdf','2015-10-28 16:44:16');

/*!40000 ALTER TABLE `p2018_comment_reply` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_goods`;

CREATE TABLE `p2018_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `goods_name` varchar(150) NOT NULL COMMENT '商品名称',
  `market_price` decimal(10,2) NOT NULL COMMENT '市场价格',
  `shop_price` decimal(10,2) NOT NULL COMMENT '本店价格',
  `goods_desc` longtext COMMENT '商品描述',
  `is_on_sale` enum('是','否') NOT NULL DEFAULT '是' COMMENT '是否上架',
  `is_delete` enum('是','否') NOT NULL DEFAULT '否' COMMENT '是否放到回收站',
  `addtime` datetime NOT NULL COMMENT '添加时间',
  `logo` varchar(150) NOT NULL DEFAULT '' COMMENT '原图',
  `sm_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '小图',
  `mid_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '中图',
  `big_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '大图',
  `mbig_logo` varchar(150) NOT NULL DEFAULT '' COMMENT '更大图',
  `brand_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '品牌id',
  `cat_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主分类Id',
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '类型Id',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `promote_start_date` datetime NOT NULL COMMENT '促销开始时间',
  `promote_end_date` datetime NOT NULL COMMENT '促销结束时间',
  `is_new` enum('是','否') NOT NULL DEFAULT '否' COMMENT '是否新品',
  `is_hot` enum('是','否') NOT NULL DEFAULT '否' COMMENT '是否热卖',
  `is_best` enum('是','否') NOT NULL DEFAULT '否' COMMENT '是否精品',
  `sort_num` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '排序的数字',
  `is_floor` enum('是','否') NOT NULL DEFAULT '否' COMMENT '是否推荐楼层',
  `is_updated` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否被修改',
  PRIMARY KEY (`id`),
  KEY `shop_price` (`shop_price`),
  KEY `addtime` (`addtime`),
  KEY `brand_id` (`brand_id`),
  KEY `is_on_sale` (`is_on_sale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

LOCK TABLES `p2018_goods` WRITE;
/*!40000 ALTER TABLE `p2018_goods` DISABLE KEYS */;

INSERT INTO `p2018_goods` (`id`, `goods_name`, `market_price`, `shop_price`, `goods_desc`, `is_on_sale`, `is_delete`, `addtime`, `logo`, `sm_logo`, `mid_logo`, `big_logo`, `mbig_logo`, `brand_id`, `cat_id`, `type_id`, `promote_price`, `promote_start_date`, `promote_end_date`, `is_new`, `is_hot`, `is_best`, `sort_num`, `is_floor`, `is_updated`)
VALUES
	(3,'测试相册',111.00,222.00,'','是','否','2015-10-15 16:05:05','','','','','',0,0,0,0.00,'0000-00-00 00:00:00','0000-00-00 00:00:00','否','否','否',100,'否',0),
	(4,'mijia牙刷',320.00,299.00,'','是','否','2018-01-24 21:49:55','Goods/2018-01-24/5a688f023e577.png','Goods/2018-01-24/thumb_3_5a688f023e577.png','Goods/2018-01-24/thumb_2_5a688f023e577.png','Goods/2018-01-24/thumb_1_5a688f023e577.png','Goods/2018-01-24/thumb_0_5a688f023e577.png',3,1,0,0.00,'0000-00-00 00:00:00','0000-00-00 00:00:00','是','是','是',90,'否',0),
	(5,'mijia冰箱',3300.00,2344.00,'<p><span style=\"font-size:24px;background-color:rgb(217,150,148);\">试试看</span></p><p><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\" alt=\"j_0002.gif\" /><img src=\"http://www.2018.com/Public/umeditor1_2_2-utf8-php/php/upload/20180324/15218847844367.jpg\" alt=\"15218847844367.jpg\" /></p>','是','否','2018-01-25 07:40:36','Goods/2018-01-25/5a6919729799f.png','Goods/2018-01-25/thumb_3_5a6919729799f.png','Goods/2018-01-25/thumb_2_5a6919729799f.png','Goods/2018-01-25/thumb_1_5a6919729799f.png','Goods/2018-01-25/thumb_0_5a6919729799f.png',3,1,1,0.00,'0000-00-00 00:00:00','0000-00-00 00:00:00','是','是','是',100,'是',0),
	(7,'嗯嗯嗯',0.00,0.00,'','是','否','2018-01-25 07:44:07','Goods/2018-03-24/5ab5ba2d45627.png','Goods/2018-03-24/thumb_3_5ab5ba2d45627.png','Goods/2018-03-24/thumb_2_5ab5ba2d45627.png','Goods/2018-03-24/thumb_1_5ab5ba2d45627.png','Goods/2018-03-24/thumb_0_5ab5ba2d45627.png',4,1,0,5666.00,'2018-03-22 22:18:00','2018-03-31 00:00:00','是','是','是',100,'是',0),
	(8,'嗯嗯嗯mi',0.00,0.00,'','是','否','2018-01-25 07:45:22','Goods/2018-03-24/5ab5ba1ec4613.png','Goods/2018-03-24/thumb_3_5ab5ba1ec4613.png','Goods/2018-03-24/thumb_2_5ab5ba1ec4613.png','Goods/2018-03-24/thumb_1_5ab5ba1ec4613.png','Goods/2018-03-24/thumb_0_5ab5ba1ec4613.png',3,1,1,0.00,'0000-00-00 00:00:00','0000-00-00 00:00:00','是','是','是',100,'是',0),
	(9,'哒哒哒哒大',0.00,0.00,'','是','否','2018-01-25 07:46:17','Goods/2018-01-25/5a691ac900dd6.png','Goods/2018-01-25/thumb_3_5a691ac900dd6.png','Goods/2018-01-25/thumb_2_5a691ac900dd6.png','Goods/2018-01-25/thumb_1_5a691ac900dd6.png','Goods/2018-01-25/thumb_0_5a691ac900dd6.png',5,16,0,0.00,'0000-00-00 00:00:00','0000-00-00 00:00:00','是','否','是',100,'是',0),
	(10,'iphonex',0.00,0.00,'<p>biger and bigger</p>','是','否','2018-03-04 06:40:59','Goods/2018-03-04/5a9b247b58960.jpg','Goods/2018-03-04/thumb_3_5a9b247b58960.jpg','Goods/2018-03-04/thumb_2_5a9b247b58960.jpg','Goods/2018-03-04/thumb_1_5a9b247b58960.jpg','Goods/2018-03-04/thumb_0_5a9b247b58960.jpg',2,2,1,3999.00,'2018-03-21 21:53:00','2018-03-22 23:53:00','是','是','是',100,'是',0),
	(11,'coole',3900.00,2000.00,'<p>kuku</p>','是','否','2018-04-06 15:29:42','Goods/2018-04-06/5ac721e66c974.jpg','Goods/2018-04-06/thumb_3_5ac721e66c974.jpg','Goods/2018-04-06/thumb_2_5ac721e66c974.jpg','Goods/2018-04-06/thumb_1_5ac721e66c974.jpg','Goods/2018-04-06/thumb_0_5ac721e66c974.jpg',6,1,1,0.00,'0000-00-00 00:00:00','0000-00-00 00:00:00','是','是','是',100,'是',0),
	(12,'呀呀呀痴狂的小宝',8000.00,0.00,'<p>呀呀呀痴狂的小宝</p>','是','否','2018-04-10 06:27:13','','','','','',3,1,0,0.00,'0000-00-00 00:00:00','0000-00-00 00:00:00','是','是','是',100,'是',0),
	(13,'软件',0.00,0.00,'','是','否','2018-04-10 07:14:36','','','','','',0,1,0,0.00,'0000-00-00 00:00:00','0000-00-00 00:00:00','否','否','否',100,'否',0);

/*!40000 ALTER TABLE `p2018_goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_goods_attr
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_goods_attr`;

CREATE TABLE `p2018_goods_attr` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `attr_value` varchar(150) NOT NULL DEFAULT '' COMMENT '属性值',
  `attr_id` mediumint(8) unsigned NOT NULL COMMENT '属性Id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性';

LOCK TABLES `p2018_goods_attr` WRITE;
/*!40000 ALTER TABLE `p2018_goods_attr` DISABLE KEYS */;

INSERT INTO `p2018_goods_attr` (`id`, `attr_value`, `attr_id`, `goods_id`)
VALUES
	(1,'白色',1,7),
	(2,'黑色',1,7),
	(3,'绿色',1,7),
	(4,'2015-10-01',4,7),
	(5,'ios',5,7),
	(6,'android',5,7),
	(7,'富士白',1,8),
	(10,'2015-10-01',4,8),
	(11,'ios',5,8),
	(12,'windows',5,8),
	(13,'14寸',10,8),
	(15,'蓝色',1,8),
	(16,'android',5,8),
	(18,'金色',1,8),
	(19,'富士白',1,8),
	(20,'白色',1,10),
	(21,'金色',1,10),
	(22,'黑色',1,10),
	(23,'2018-01-11',4,10),
	(24,'ios',5,10),
	(25,'android',5,10),
	(26,'8.01',10,10),
	(27,'白色',1,5),
	(28,'黑色',1,5),
	(29,'2018-01-11',4,5),
	(30,'android',5,5),
	(31,'6.01',10,5),
	(32,'金色',1,5),
	(33,'windows',5,5),
	(34,'白色',1,8),
	(35,'2018-04-06',4,8),
	(37,'5.999',10,8),
	(38,'黑色',1,11),
	(39,'2018-04-05',4,11),
	(40,'android',5,11),
	(41,'4.5',10,11);

/*!40000 ALTER TABLE `p2018_goods_attr` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_goods_cat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_goods_cat`;

CREATE TABLE `p2018_goods_cat` (
  `cat_id` mediumint(8) unsigned NOT NULL COMMENT '分类id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  KEY `goods_id` (`goods_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品扩展分类';

LOCK TABLES `p2018_goods_cat` WRITE;
/*!40000 ALTER TABLE `p2018_goods_cat` DISABLE KEYS */;

INSERT INTO `p2018_goods_cat` (`cat_id`, `goods_id`)
VALUES
	(16,5),
	(22,5),
	(17,5),
	(16,8),
	(17,11),
	(16,12),
	(16,13);

/*!40000 ALTER TABLE `p2018_goods_cat` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_goods_number
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_goods_number`;

CREATE TABLE `p2018_goods_number` (
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  `goods_number` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '库存量',
  `goods_attr_id` varchar(150) NOT NULL COMMENT '商品属性表的ID,如果有多个，就用程序拼成字符串存到这个字段中',
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存量';

LOCK TABLES `p2018_goods_number` WRITE;
/*!40000 ALTER TABLE `p2018_goods_number` DISABLE KEYS */;

INSERT INTO `p2018_goods_number` (`goods_id`, `goods_number`, `goods_attr_id`)
VALUES
	(10,6,'20,24'),
	(10,2,'20,25'),
	(10,50,'21,24'),
	(10,10,'21,25'),
	(10,1,'22,25'),
	(7,8,'2,6'),
	(11,400,'38,40');

/*!40000 ALTER TABLE `p2018_goods_number` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_goods_pic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_goods_pic`;

CREATE TABLE `p2018_goods_pic` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `pic` varchar(150) NOT NULL COMMENT '原图',
  `sm_pic` varchar(150) NOT NULL COMMENT '小图',
  `mid_pic` varchar(150) NOT NULL COMMENT '中图',
  `big_pic` varchar(150) NOT NULL COMMENT '大图',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品相册';

LOCK TABLES `p2018_goods_pic` WRITE;
/*!40000 ALTER TABLE `p2018_goods_pic` DISABLE KEYS */;

INSERT INTO `p2018_goods_pic` (`id`, `pic`, `sm_pic`, `mid_pic`, `big_pic`, `goods_id`)
VALUES
	(2,'Goods/2015-10-15/561f5e4374c7d.jpg','Goods/2015-10-15/thumb_2_561f5e4374c7d.jpg','Goods/2015-10-15/thumb_1_561f5e4374c7d.jpg','Goods/2015-10-15/thumb_0_561f5e4374c7d.jpg',3),
	(4,'Goods/2015-10-15/561f6f5e19948.jpg','Goods/2015-10-15/thumb_2_561f6f5e19948.jpg','Goods/2015-10-15/thumb_1_561f6f5e19948.jpg','Goods/2015-10-15/thumb_0_561f6f5e19948.jpg',3),
	(5,'Goods/2015-10-15/561f6f6018a1a.jpg','Goods/2015-10-15/thumb_2_561f6f6018a1a.jpg','Goods/2015-10-15/thumb_1_561f6f6018a1a.jpg','Goods/2015-10-15/thumb_0_561f6f6018a1a.jpg',3),
	(6,'Goods/2015-10-15/561f6f612ab67.jpg','Goods/2015-10-15/thumb_2_561f6f612ab67.jpg','Goods/2015-10-15/thumb_1_561f6f612ab67.jpg','Goods/2015-10-15/thumb_0_561f6f612ab67.jpg',3),
	(7,'Goods/2015-10-15/561f6f7151c1c.gif','Goods/2015-10-15/thumb_2_561f6f7151c1c.gif','Goods/2015-10-15/thumb_1_561f6f7151c1c.gif','Goods/2015-10-15/thumb_0_561f6f7151c1c.gif',3),
	(8,'Goods/2018-03-24/5ab61e7a56f4b.png','Goods/2018-03-24/thumb_2_5ab61e7a56f4b.png','Goods/2018-03-24/thumb_1_5ab61e7a56f4b.png','Goods/2018-03-24/thumb_0_5ab61e7a56f4b.png',5),
	(9,'Goods/2018-03-24/5ab61e7aaed9f.png','Goods/2018-03-24/thumb_2_5ab61e7aaed9f.png','Goods/2018-03-24/thumb_1_5ab61e7aaed9f.png','Goods/2018-03-24/thumb_0_5ab61e7aaed9f.png',5),
	(10,'Goods/2018-03-24/5ab61e7b11a14.png','Goods/2018-03-24/thumb_2_5ab61e7b11a14.png','Goods/2018-03-24/thumb_1_5ab61e7b11a14.png','Goods/2018-03-24/thumb_0_5ab61e7b11a14.png',5),
	(11,'Goods/2018-03-24/5ab621c650eb3.png','Goods/2018-03-24/thumb_2_5ab621c650eb3.png','Goods/2018-03-24/thumb_1_5ab621c650eb3.png','Goods/2018-03-24/thumb_0_5ab621c650eb3.png',10),
	(12,'Goods/2018-04-06/5ac721e703215.jpg','Goods/2018-04-06/thumb_2_5ac721e703215.jpg','Goods/2018-04-06/thumb_1_5ac721e703215.jpg','Goods/2018-04-06/thumb_0_5ac721e703215.jpg',11);

/*!40000 ALTER TABLE `p2018_goods_pic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_member`;

CREATE TABLE `p2018_member` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `face` varchar(150) NOT NULL DEFAULT '' COMMENT '头像',
  `jifen` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `openid` char(32) NOT NULL DEFAULT '' COMMENT 'openid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员';

LOCK TABLES `p2018_member` WRITE;
/*!40000 ALTER TABLE `p2018_member` DISABLE KEYS */;

INSERT INTO `p2018_member` (`id`, `username`, `password`, `face`, `jifen`, `openid`)
VALUES
	(1,'php39','21232f297a57a5a743894a0e4a801fc3','',15000,'');

/*!40000 ALTER TABLE `p2018_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_member_level
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_member_level`;

CREATE TABLE `p2018_member_level` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `level_name` varchar(30) NOT NULL COMMENT '级别名称',
  `jifen_bottom` mediumint(8) unsigned NOT NULL COMMENT '积分下限',
  `jifen_top` mediumint(8) unsigned NOT NULL COMMENT '积分上限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员级别';

LOCK TABLES `p2018_member_level` WRITE;
/*!40000 ALTER TABLE `p2018_member_level` DISABLE KEYS */;

INSERT INTO `p2018_member_level` (`id`, `level_name`, `jifen_bottom`, `jifen_top`)
VALUES
	(1,'注册会员',0,5000),
	(2,'初级会员',5001,10000),
	(3,'高级会员',10001,20000),
	(4,'VIP',20001,16777215);

/*!40000 ALTER TABLE `p2018_member_level` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_member_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_member_price`;

CREATE TABLE `p2018_member_price` (
  `price` decimal(10,2) NOT NULL COMMENT '会员价格',
  `level_id` mediumint(8) unsigned NOT NULL COMMENT '级别Id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  KEY `level_id` (`level_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员价格';

LOCK TABLES `p2018_member_price` WRITE;
/*!40000 ALTER TABLE `p2018_member_price` DISABLE KEYS */;

INSERT INTO `p2018_member_price` (`price`, `level_id`, `goods_id`)
VALUES
	(2340.00,1,5),
	(2329.00,2,5),
	(2300.00,3,5),
	(2000.00,4,5),
	(3200.00,1,11),
	(3000.00,2,11),
	(2500.00,3,11),
	(1000.00,4,11);

/*!40000 ALTER TABLE `p2018_member_price` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_order`;

CREATE TABLE `p2018_order` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员Id',
  `addtime` int(10) unsigned NOT NULL COMMENT '下单时间',
  `pay_status` enum('是','否') NOT NULL DEFAULT '否' COMMENT '支付状态',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `total_price` decimal(10,2) NOT NULL COMMENT '定单总价',
  `shr_name` varchar(30) NOT NULL COMMENT '收货人姓名',
  `shr_tel` varchar(30) NOT NULL COMMENT '收货人电话',
  `shr_province` varchar(30) NOT NULL COMMENT '收货人省',
  `shr_city` varchar(30) NOT NULL COMMENT '收货人城市',
  `shr_area` varchar(30) NOT NULL COMMENT '收货人地区',
  `shr_address` varchar(30) NOT NULL COMMENT '收货人详细地址',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态,0:未发货,1:已发货2:已收到货',
  `post_number` varchar(30) NOT NULL DEFAULT '' COMMENT '快递号',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  KEY `addtime` (`addtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定单基本信息';

LOCK TABLES `p2018_order` WRITE;
/*!40000 ALTER TABLE `p2018_order` DISABLE KEYS */;

INSERT INTO `p2018_order` (`id`, `member_id`, `addtime`, `pay_status`, `pay_time`, `total_price`, `shr_name`, `shr_tel`, `shr_province`, `shr_city`, `shr_area`, `shr_address`, `post_status`, `post_number`)
VALUES
	(2,1,1445655657,'是',0,3359.00,'吴英雷','13344441111','上海','东城区','西三旗','西三旗',0,''),
	(3,1,1445655771,'是',0,333.00,'吴英雷','13344441111','北京','东城区','三环以内','西三旗',0,''),
	(4,1,1522502736,'否',0,0.00,'1111111111111111','1111111111','北京','朝阳区','西三旗','11111111111',0,''),
	(5,1,1522537354,'否',0,0.00,'222222222','22222222222','北京','朝阳区','西二旗','2222222222222',0,'');

/*!40000 ALTER TABLE `p2018_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_order_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_order_goods`;

CREATE TABLE `p2018_order_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `order_id` mediumint(8) unsigned NOT NULL COMMENT '定单Id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  `goods_attr_id` varchar(150) NOT NULL DEFAULT '' COMMENT '商品属性id',
  `goods_number` mediumint(8) unsigned NOT NULL COMMENT '购买的数量',
  `price` decimal(10,2) NOT NULL COMMENT '购买的价格',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定单商品表';

LOCK TABLES `p2018_order_goods` WRITE;
/*!40000 ALTER TABLE `p2018_order_goods` DISABLE KEYS */;

INSERT INTO `p2018_order_goods` (`id`, `order_id`, `goods_id`, `goods_attr_id`, `goods_number`, `price`)
VALUES
	(2,2,7,'2,6',7,95.00),
	(3,2,7,'3,5',4,95.00),
	(4,2,7,'1,5',4,95.00),
	(5,2,7,'3,6',4,95.00),
	(6,2,3,'',4,222.00),
	(7,2,4,'',2,333.00),
	(8,3,4,'',1,333.00),
	(9,4,7,'2,6',1,0.00),
	(10,5,7,'2,6',1,0.00);

/*!40000 ALTER TABLE `p2018_order_goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_privilege
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_privilege`;

CREATE TABLE `p2018_privilege` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `pri_name` varchar(30) NOT NULL COMMENT '权限名称',
  `module_name` varchar(30) NOT NULL DEFAULT '' COMMENT '模块名称',
  `controller_name` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action_name` varchar(30) NOT NULL DEFAULT '' COMMENT '方法名称',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级权限Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限';

LOCK TABLES `p2018_privilege` WRITE;
/*!40000 ALTER TABLE `p2018_privilege` DISABLE KEYS */;

INSERT INTO `p2018_privilege` (`id`, `pri_name`, `module_name`, `controller_name`, `action_name`, `parent_id`)
VALUES
	(10,'RBAC','','','',0),
	(11,'权限列表','Admin','Privilege','lst',10),
	(12,'添加权限','Privilege','Admin','add',11),
	(13,'修改权限','Admin','Privilege','edit',11),
	(14,'删除权限','Admin','Privilege','delete',11),
	(15,'角色列表','Admin','Role','lst',10),
	(16,'添加角色','Admin','Role','add',15),
	(17,'修改角色','Admin','Role','edit',15),
	(18,'删除角色','Admin','Role','delete',15),
	(19,'管理员列表','Admin','Admin','lst',10),
	(20,'添加管理员','Admin','Admin','add',19),
	(21,'修改管理员','Admin','Admin','edit',19),
	(22,'删除管理员','Admin','Admin','delete',19),
	(24,'添加类型','Admin','Type','add',23),
	(25,'修改类型','Admin','Type','edit',23),
	(26,'删除类型','Admin','Type','delete',23),
	(27,'属性列表','Admin','Attribute','lst',23),
	(28,'添加属性','Admin','Attribute','add',27),
	(29,'修改属性','Admin','Attribute','edit',27),
	(30,'删除属性','Admin','Attribute','delete',27),
	(33,'会员管理','','','',0),
	(35,'添加会员级别','Admin','MemberLevel','add',34),
	(36,'修改会员级别','Admin','MemberLevel','edit',34),
	(37,'删除会员级别','Admin','MemberLevel','delete',34),
	(39,'会员列表','Admin','Address','lst',33),
	(40,'订单管理','','','',0),
	(41,'订单列表','Admin','Product','lst',40);

/*!40000 ALTER TABLE `p2018_privilege` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_role`;

CREATE TABLE `p2018_role` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

LOCK TABLES `p2018_role` WRITE;
/*!40000 ALTER TABLE `p2018_role` DISABLE KEYS */;

INSERT INTO `p2018_role` (`id`, `role_name`)
VALUES
	(1,'商品模块管理员'),
	(2,'RBAC管理员');

/*!40000 ALTER TABLE `p2018_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_role_pri
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_role_pri`;

CREATE TABLE `p2018_role_pri` (
  `pri_id` mediumint(8) unsigned NOT NULL COMMENT '权限id',
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色id',
  KEY `pri_id` (`pri_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限';

LOCK TABLES `p2018_role_pri` WRITE;
/*!40000 ALTER TABLE `p2018_role_pri` DISABLE KEYS */;

INSERT INTO `p2018_role_pri` (`pri_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(31,1),
	(32,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(23,1),
	(24,1),
	(25,1),
	(26,1),
	(27,1),
	(28,1),
	(29,1),
	(30,1),
	(38,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(21,1),
	(22,1),
	(1,2),
	(2,2),
	(3,2),
	(4,2),
	(23,2),
	(24,2),
	(25,2),
	(27,2),
	(28,2),
	(29,2),
	(10,2),
	(11,2),
	(12,2),
	(13,2),
	(15,2),
	(16,2),
	(17,2),
	(19,2),
	(20,2),
	(21,2);

/*!40000 ALTER TABLE `p2018_role_pri` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_sphinx_id
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_sphinx_id`;

CREATE TABLE `p2018_sphinx_id` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '已经索引好索引的最后一件商品的ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sphinx';

LOCK TABLES `p2018_sphinx_id` WRITE;
/*!40000 ALTER TABLE `p2018_sphinx_id` DISABLE KEYS */;

INSERT INTO `p2018_sphinx_id` (`id`)
VALUES
	(13);

/*!40000 ALTER TABLE `p2018_sphinx_id` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_type`;

CREATE TABLE `p2018_type` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `type_name` varchar(30) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类型';

LOCK TABLES `p2018_type` WRITE;
/*!40000 ALTER TABLE `p2018_type` DISABLE KEYS */;

INSERT INTO `p2018_type` (`id`, `type_name`)
VALUES
	(1,'手机'),
	(2,'服装'),
	(3,'书');

/*!40000 ALTER TABLE `p2018_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table p2018_yinxiang
# ------------------------------------------------------------

DROP TABLE IF EXISTS `p2018_yinxiang`;

CREATE TABLE `p2018_yinxiang` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品Id',
  `yx_name` varchar(30) NOT NULL COMMENT '印象名称',
  `yx_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '印象的次数',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='印象';

LOCK TABLES `p2018_yinxiang` WRITE;
/*!40000 ALTER TABLE `p2018_yinxiang` DISABLE KEYS */;

INSERT INTO `p2018_yinxiang` (`id`, `goods_id`, `yx_name`, `yx_count`)
VALUES
	(1,4,'屏幕大',1),
	(2,4,'性能好',4),
	(3,4,'外观漂亮',1),
	(4,4,'便宜',3),
	(5,4,'颜色正宗',1),
	(6,4,'大棒1',1),
	(7,4,'大棒2',1),
	(8,4,'大棒3',1),
	(9,4,'大棒4',1),
	(10,4,'大棒5',1),
	(11,4,'大棒6',1),
	(12,4,'大棒76',1),
	(13,4,'8',1),
	(14,4,'9',1),
	(15,4,'43',4),
	(16,4,'4',1),
	(17,4,'3',2),
	(18,4,'32',1),
	(19,4,'5',1),
	(20,4,'6',1),
	(21,4,'7',1),
	(22,4,'76',1),
	(23,4,'一',1),
	(24,4,'于',1),
	(25,4,'城',1),
	(26,4,'re',5),
	(27,4,'er',1),
	(28,4,'re43',1),
	(29,4,'45',1);

/*!40000 ALTER TABLE `p2018_yinxiang` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluate_price` int(11) DEFAULT NULL COMMENT '评估价格,单位：元',
  `market_price` int(11) DEFAULT NULL COMMENT '市场价格,单位：元',
  `delete_time` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '图片来自 1 本地 ，2公网',
  `new_level` tinyint(4) DEFAULT '90' COMMENT '新旧',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL COMMENT '摘要',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `only_num` char(13) NOT NULL,
  PRIMARY KEY (`only_num`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`id`, `evaluate_price`, `market_price`, `delete_time`, `category_id`, `brand_id`, `from`, `new_level`, `create_time`, `update_time`, `summary`, `user_id`, `only_num`)
VALUES
	(29,NULL,NULL,NULL,1,NULL,1,90,1537964591,1537964591,'?hello，永业汇通，我是在2015年买的这个腕表，地点在大悦城',2,'cyx1537964536'),
	(30,NULL,NULL,NULL,1,NULL,1,90,1537964802,1537964802,'y工业回头',2,'cyx1537964797'),
	(31,2255,NULL,NULL,1,NULL,1,90,1537964920,1537964920,'哈哈，这是我去年买的，在永业汇通，花了7万呢。',2,'cyx1537964914'),
	(32,NULL,NULL,NULL,1,NULL,1,90,1537972573,1537972573,'fffffff',2,'cyx1537972561'),
	(33,NULL,NULL,NULL,1,NULL,1,90,1538027303,1538027303,'永业汇通',2,'cyx1538027298');

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_image
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_image`;

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '物品，关联图片表',
  `delete_time` int(11) DEFAULT NULL COMMENT '状态，主要表示是否删除，也可以扩展其他状态',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;

INSERT INTO `product_image` (`id`, `img_id`, `delete_time`, `order`, `product_id`)
VALUES
	(1,19,NULL,1,1),
	(2,20,NULL,2,1),
	(3,21,NULL,3,1),
	(4,22,NULL,4,1),
	(5,23,NULL,5,1),
	(6,24,NULL,6,1),
	(7,25,NULL,7,1),
	(8,26,NULL,8,1),
	(9,27,NULL,9,1);

/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table third_app
# ------------------------------------------------------------

DROP TABLE IF EXISTS `third_app`;

CREATE TABLE `third_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) NOT NULL COMMENT '应用app_id',
  `app_secret` varchar(64) NOT NULL COMMENT '应用secret',
  `app_description` varchar(100) DEFAULT NULL COMMENT '应用程序描述',
  `scope` varchar(20) NOT NULL COMMENT '应用权限',
  `scope_description` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问API的各应用账号密码表';

LOCK TABLES `third_app` WRITE;
/*!40000 ALTER TABLE `third_app` DISABLE KEYS */;

INSERT INTO `third_app` (`id`, `app_id`, `app_secret`, `app_description`, `scope`, `scope_description`, `delete_time`, `update_time`)
VALUES
	(1,'starcraft','777*777','CMS','32','Super',NULL,NULL);

/*!40000 ALTER TABLE `third_app` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL,
  `scope` varchar(20) DEFAULT NULL COMMENT '用户权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `openid`, `nickname`, `extend`, `delete_time`, `create_time`, `update_time`, `scope`)
VALUES
	(1,'oqwrH5Sz90KOs_mVJyZseoWqi2m8',NULL,NULL,NULL,NULL,1538376616,'32'),
	(2,'o2RXE5NFff9AUMJV22NwzOSpX5N4',NULL,NULL,NULL,NULL,NULL,'32');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_address`;

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `nick_name` varchar(30) DEFAULT NULL COMMENT '昵称',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `QQ` varchar(20) DEFAULT NULL COMMENT 'QQ号码',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `country` varchar(20) DEFAULT NULL COMMENT '区',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL,
  `vip` int(11) DEFAULT '0' COMMENT 'vip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user_address` WRITE;
/*!40000 ALTER TABLE `user_address` DISABLE KEYS */;

INSERT INTO `user_address` (`id`, `name`, `nick_name`, `mobile`, `QQ`, `province`, `city`, `country`, `detail`, `delete_time`, `user_id`, `update_time`, `vip`)
VALUES
	(4,'张三','小三','13381101326','2224168716','广东省','广州市','海珠区','新港中路397号',NULL,1,1538376616,1),
	(5,'张三',NULL,'020-81167888',NULL,'广东省','广州市','海珠区','新港中路397号',NULL,2,NULL,0);

/*!40000 ALTER TABLE `user_address` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
