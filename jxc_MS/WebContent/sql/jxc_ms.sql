/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : jxc_ms

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2019-10-12 15:07:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `userPw` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `t_cangku`
-- ----------------------------
DROP TABLE IF EXISTS `t_cangku`;
CREATE TABLE `t_cangku` (
  `cangku_id` int(11) NOT NULL AUTO_INCREMENT,
  `cangku_name` varchar(49) DEFAULT NULL,
  `cangku_master` varchar(49) DEFAULT NULL,
  `cangku_tel` varchar(49) DEFAULT NULL,
  `cangku_addr` varchar(49) DEFAULT NULL,
  `cangku_size` int(20) DEFAULT NULL,
  `del` varchar(49) DEFAULT NULL,
  PRIMARY KEY (`cangku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cangku
-- ----------------------------
INSERT INTO `t_cangku` VALUES ('1', '杭州1号仓库', '张三', '18718116258', '浙江省杭州市xxx街xx号', '19', 'no');
INSERT INTO `t_cangku` VALUES ('2', '江西2号仓库', '李四', '18170402287', '江西省南昌市青山湖区庐山中大道888号', '145', 'no');
INSERT INTO `t_cangku` VALUES ('3', '广州3号仓库', '李华', '15448687556', '广东省广州市白云区xxx街道xx号', '200', 'no');
INSERT INTO `t_cangku` VALUES ('4', '长沙4号仓库', '李明', '15089882678', '湖南省长沙市xxx街xx号', '500', 'no');

-- ----------------------------
-- Table structure for `t_catelog`
-- ----------------------------
DROP TABLE IF EXISTS `t_catelog`;
CREATE TABLE `t_catelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_catelog
-- ----------------------------
INSERT INTO `t_catelog` VALUES ('22', '小米', 'no');
INSERT INTO `t_catelog` VALUES ('23', '华为', 'no');
INSERT INTO `t_catelog` VALUES ('24', '苹果', 'no');
INSERT INTO `t_catelog` VALUES ('25', '华硕', 'no');
INSERT INTO `t_catelog` VALUES ('26', '联想', 'no');
INSERT INTO `t_catelog` VALUES ('27', '神州', 'yes');
INSERT INTO `t_catelog` VALUES ('28', '惠普', 'no');
INSERT INTO `t_catelog` VALUES ('29', '戴尔', 'no');
INSERT INTO `t_catelog` VALUES ('30', '战神', 'yes');
INSERT INTO `t_catelog` VALUES ('31', '雷神', 'yes');
INSERT INTO `t_catelog` VALUES ('33', 'ThinkPad', 'no');
INSERT INTO `t_catelog` VALUES ('34', '神舟', 'no');
INSERT INTO `t_catelog` VALUES ('35', '外星人', 'no');
INSERT INTO `t_catelog` VALUES ('36', 'Acer宏碁', 'no');
INSERT INTO `t_catelog` VALUES ('39', '荣耀', 'no');
INSERT INTO `t_catelog` VALUES ('40', '机械师', 'yes');

-- ----------------------------
-- Table structure for `t_chuku`
-- ----------------------------
DROP TABLE IF EXISTS `t_chuku`;
CREATE TABLE `t_chuku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `danjuhao` varchar(55) DEFAULT NULL,
  `shijian` date DEFAULT NULL,
  `jingshouren` varchar(50) DEFAULT NULL,
  `beizhu` varchar(50) DEFAULT NULL,
  `customer_id` varchar(49) NOT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shijian` (`shijian`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `t_chuku_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `t_customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_chuku
-- ----------------------------
INSERT INTO `t_chuku` VALUES ('12', 'C201910091010795140', '2019-05-01', '李明', '销售一批华硕笔记本', '1910011456594551', 'no');
INSERT INTO `t_chuku` VALUES ('14', 'C201910091951824238', '2019-12-12', '王芳华', '销售20台小米笔记本', '1910012074616152', 'no');
INSERT INTO `t_chuku` VALUES ('15', 'C201910121051903302', '2019-10-12', '徐明', '销售一批苹果电脑', '191001500324585', 'no');
INSERT INTO `t_chuku` VALUES ('17', 'C2019101248151911', '2019-10-12', '张亮', '销售一批小米笔记本', '191001258659363', 'yes');
INSERT INTO `t_chuku` VALUES ('18', 'C201910122009787824', '2019-10-12', '张亮', '销售一批小米笔记本', '191001258659363', 'yes');
INSERT INTO `t_chuku` VALUES ('19', 'C201910121996067619', '2019-02-14', '张亮', '销售一批小米笔记本', '191001258659363', 'no');

-- ----------------------------
-- Table structure for `t_chukumingxi`
-- ----------------------------
DROP TABLE IF EXISTS `t_chukumingxi`;
CREATE TABLE `t_chukumingxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chuku_id` int(11) NOT NULL,
  `goods_id` varchar(20) NOT NULL,
  `danjia` int(11) DEFAULT NULL,
  `shuliang` int(11) DEFAULT NULL,
  `beizhu` varchar(255) DEFAULT NULL,
  `time` date NOT NULL,
  `cangku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chuku_id` (`chuku_id`),
  KEY `goods_id` (`goods_id`),
  KEY `time` (`time`),
  KEY `cangku_id` (`cangku_id`),
  CONSTRAINT `t_chukumingxi_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_chukumingxi_ibfk_2` FOREIGN KEY (`chuku_id`) REFERENCES `t_chuku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_chukumingxi_ibfk_3` FOREIGN KEY (`cangku_id`) REFERENCES `t_cangku` (`cangku_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_chukumingxi_ibfk_4` FOREIGN KEY (`time`) REFERENCES `t_chuku` (`shijian`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_chukumingxi
-- ----------------------------
INSERT INTO `t_chukumingxi` VALUES ('22', '12', 'G2019100915204', '4500', '10', '出库成功，单价:4500元', '2019-05-01', '3');
INSERT INTO `t_chukumingxi` VALUES ('23', '12', 'G2019100916157', '4900', '2', '出库成功，单价:4900元', '2019-05-01', '3');
INSERT INTO `t_chukumingxi` VALUES ('24', '14', 'G2019100913924', '7000', '2', '出库成功，单价:7000元', '2019-12-12', '1');
INSERT INTO `t_chukumingxi` VALUES ('25', '14', 'G2019100919291', '4900', '10', '出库成功，单价:4900元', '2019-12-12', '1');
INSERT INTO `t_chukumingxi` VALUES ('26', '14', 'G2019100914727', '7300', '1', '出库成功，单价:7300元', '2019-12-12', '1');
INSERT INTO `t_chukumingxi` VALUES ('27', '14', 'G2019100999137', '5000', '7', '出库成功，单价:5000元', '2019-12-12', '2');
INSERT INTO `t_chukumingxi` VALUES ('28', '15', 'G2019100915566', '7500', '1', '出库成功，单价:7500元', '2019-10-12', '4');
INSERT INTO `t_chukumingxi` VALUES ('29', '15', 'G2019100967209', '8500', '20', '出库成功，单价:8500元', '2019-10-12', '4');
INSERT INTO `t_chukumingxi` VALUES ('30', '15', 'G2019100919811', '9000', '5', '出库成功，单价:9000元', '2019-10-12', '4');
INSERT INTO `t_chukumingxi` VALUES ('32', '19', 'G2019100919291', '4900', '10', '出库成功，单价:4900元', '2019-02-14', '1');

-- ----------------------------
-- Table structure for `t_customer`
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `id` varchar(49) NOT NULL,
  `c_name` varchar(49) DEFAULT NULL,
  `c_sex` varchar(5) DEFAULT NULL,
  `c_tel` varchar(11) DEFAULT NULL,
  `c_type` varchar(11) DEFAULT NULL,
  `del` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_customer
-- ----------------------------
INSERT INTO `t_customer` VALUES ('1910011456594551', '赵铭', '男', '13926548925', '重要客户', 'no');
INSERT INTO `t_customer` VALUES ('1910011728301444', '刘芳', '女', '15620478925', 'VIP客户', 'no');
INSERT INTO `t_customer` VALUES ('1910012074616152', '李四', '男', '15089882678', '重要客户', 'no');
INSERT INTO `t_customer` VALUES ('191001258659363', '张三', '男', '18718116258', '普通客户', 'no');
INSERT INTO `t_customer` VALUES ('191001500324585', '李明', '男', '18170402287', '普通客户', 'no');

-- ----------------------------
-- Table structure for `t_gongyingshang`
-- ----------------------------
DROP TABLE IF EXISTS `t_gongyingshang`;
CREATE TABLE `t_gongyingshang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mingcheng` varchar(55) DEFAULT NULL,
  `dizhi` varchar(88) DEFAULT NULL,
  `lianxiren` varchar(55) DEFAULT NULL,
  `dianhua` varchar(50) DEFAULT NULL,
  `youbian` varchar(50) DEFAULT NULL,
  `chuanzhen` varchar(50) DEFAULT NULL,
  `youxiang` varchar(50) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_gongyingshang
-- ----------------------------
INSERT INTO `t_gongyingshang` VALUES ('5', '深圳市泡泡堂数码科技有限公司', '广东深圳市福田区爱华路6号', '泡泡堂手机在线女士', '0755-27860201', '518110', '0755-13926559745', 'liusan@yahoo.cn', 'no');
INSERT INTO `t_gongyingshang` VALUES ('6', '宏鑫数码有限公司', '广东深圳市盐田区沙头角中英街88号', '赵保明先生', '13358555264', '518000', '0755-6600000', 'lisisi@126.com', 'no');
INSERT INTO `t_gongyingshang` VALUES ('8', '深圳市赛欧实业有限公司', '广东深圳市福田区', '翁小姐', '0755-26260103', '518000', '0755-26260103', 'njzwz@qq.com', 'no');
INSERT INTO `t_gongyingshang` VALUES ('13', '深圳润汇科技有限公司', '广东深圳市南山区侨香路东方科技园华科大厦5A', '马智涛先生', '0755-26755778', '518053', '0755-26927402', 'wanfa@163.com', 'no');
INSERT INTO `t_gongyingshang` VALUES ('14', '顺达数码科贸公司', '江苏南京市玄武区中央路218号', '王先生', '025-86872360', '211000', '025-86872360', 'aalya@126.com', 'no');
INSERT INTO `t_gongyingshang` VALUES ('15', '香港深发国际发展有限公司', '广东深圳市福田区香蜜湖', '杨竹女士', '0755-82973715-805', '518000', '0755-82973715-808', 'yangzhu@163.com', 'no');

-- ----------------------------
-- Table structure for `t_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` varchar(20) NOT NULL,
  `catelog_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `danjia` int(11) DEFAULT NULL,
  `chandi` varchar(50) DEFAULT NULL,
  `danwei` varchar(50) DEFAULT NULL,
  `guige` varchar(50) DEFAULT NULL,
  `beizhu` varchar(50) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `catelog_id` (`catelog_id`),
  CONSTRAINT `t_goods_ibfk_1` FOREIGN KEY (`catelog_id`) REFERENCES `t_catelog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('G2019100910742', '23', '华为MateBook 17', '5000', '广东广州', '台', '14.3英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100912099', '26', '联想Y7000P', '4000', '北京', '台', '13英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100912139', '23', '华为MateBook 20', '5500', '江西南昌', '台', '15.6英寸', '无', 'yes');
INSERT INTO `t_goods` VALUES ('G2019100913924', '22', '小米游戏本2019款', '5900', '浙江杭州', '台', '13.5英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100914727', '22', '小米游戏本', '6300', '江西南昌', '台', '14.3英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100915204', '25', '华硕A540U', '4000', '江西南昌', '台', '15.6英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100915566', '24', '苹果MPXQ2CH/A', '6400', '广东广州', '台', '13英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100916157', '25', '华硕S4300U3', '4500', '江苏南京', '台', '13.3英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100919291', '22', '小米笔记本Pro', '4300', '江西南昌', '台', '13.5英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100919811', '24', '苹果MQD42CH/A', '6800', '浙江杭州', '台', '16英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100932128', '22', '小米笔记本Air', '4800', '广东深圳', '台', '13.6英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100935699', '22', '小米笔记本Pro MD3', '4700', '江西南昌', '台', '15.6英寸', '无', 'yes');
INSERT INTO `t_goods` VALUES ('G2019100941778', '23', '华为MateBook 14', '5340', '江苏南京', '台', '15.6英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100951614', '24', '苹果MR962CH/A', '6540', '广东深圳', '台', '13.3英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100967209', '24', '苹果MacBook Pro', '7320', '江苏南京', '台', '15英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100970871', '25', '华硕FX86FE', '3980', '广东深圳', '台', '13.5英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100986540', '23', '华为MX250', '3690', '浙江杭州', '台', '13.5英寸', '无', 'no');
INSERT INTO `t_goods` VALUES ('G2019100999137', '22', '小米笔记本Pro GTX版', '4860', '浙江杭州', '台', '15.6英寸', '无', 'no');

-- ----------------------------
-- Table structure for `t_kucun`
-- ----------------------------
DROP TABLE IF EXISTS `t_kucun`;
CREATE TABLE `t_kucun` (
  `kucun_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` varchar(20) DEFAULT NULL,
  `kucun` int(11) DEFAULT NULL,
  `ruku_price` int(20) unsigned zerofill DEFAULT NULL,
  `chuku_price` int(20) unsigned zerofill DEFAULT NULL,
  `cangku_id` int(11) DEFAULT NULL,
  `del` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`kucun_id`),
  KEY `goods_id` (`goods_id`),
  KEY `cangku_id` (`cangku_id`),
  CONSTRAINT `t_kucun_ibfk_1` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_kucun_ibfk_2` FOREIGN KEY (`cangku_id`) REFERENCES `t_cangku` (`cangku_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_kucun
-- ----------------------------
INSERT INTO `t_kucun` VALUES ('39', 'G2019100913924', '50', '00000000000000005900', '00000000000000007000', '1', null);
INSERT INTO `t_kucun` VALUES ('40', 'G2019100914727', '10', '00000000000000006300', '00000000000000007300', '1', null);
INSERT INTO `t_kucun` VALUES ('41', 'G2019100919291', '60', '00000000000000004300', '00000000000000004900', '1', null);
INSERT INTO `t_kucun` VALUES ('42', 'G2019100999137', '3', '00000000000000004860', '00000000000000005000', '2', null);
INSERT INTO `t_kucun` VALUES ('43', 'G2019100915566', '50', '00000000000000006400', '00000000000000007500', '4', null);
INSERT INTO `t_kucun` VALUES ('44', 'G2019100967209', '60', '00000000000000007320', '00000000000000008500', '4', null);
INSERT INTO `t_kucun` VALUES ('45', 'G2019100919811', '5', '00000000000000006800', '00000000000000009000', '4', null);
INSERT INTO `t_kucun` VALUES ('48', 'G2019100915204', '89', '00000000000000004000', '00000000000000004500', '3', null);
INSERT INTO `t_kucun` VALUES ('49', 'G2019100916157', '18', '00000000000000004500', '00000000000000004900', '3', null);
INSERT INTO `t_kucun` VALUES ('50', 'G2019100999137', '9', '00000000000000004860', '00000000000000005230', '1', 'no');
INSERT INTO `t_kucun` VALUES ('52', 'G2019100986540', '50', '00000000000000003690', '00000000000000004100', '2', 'no');
INSERT INTO `t_kucun` VALUES ('53', 'G2019100941778', '15', '00000000000000005340', '00000000000000005530', '2', 'no');
INSERT INTO `t_kucun` VALUES ('54', 'G2019100910742', '5', '00000000000000005000', '00000000000000006200', '2', 'no');

-- ----------------------------
-- Table structure for `t_ruku`
-- ----------------------------
DROP TABLE IF EXISTS `t_ruku`;
CREATE TABLE `t_ruku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gongyingshang_id` int(11) NOT NULL,
  `danjuhao` varchar(255) DEFAULT NULL,
  `shijian` date DEFAULT NULL,
  `jingshouren` varchar(50) DEFAULT NULL,
  `beizhu` varchar(50) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gongyingshang_id` (`gongyingshang_id`),
  KEY `shijian` (`shijian`),
  CONSTRAINT `t_ruku_ibfk_1` FOREIGN KEY (`gongyingshang_id`) REFERENCES `t_gongyingshang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ruku
-- ----------------------------
INSERT INTO `t_ruku` VALUES ('38', '5', 'R20190920220581818', '2019-09-20', '葛明', '无', 'no');
INSERT INTO `t_ruku` VALUES ('40', '15', 'R20190921334599373', '2019-09-21', '李莉', '入库一批小米电脑', 'no');
INSERT INTO `t_ruku` VALUES ('42', '14', 'R20190921870383978', '2019-10-01', '洪红', '进购一批苹果笔记本电脑', 'no');
INSERT INTO `t_ruku` VALUES ('45', '6', 'R20190928996102293', '2019-11-08', '刘芳', '进购一批华硕笔记本', 'no');
INSERT INTO `t_ruku` VALUES ('46', '5', 'R201910072108877719', '2019-11-09', '洪红', '销售5台华硕笔记本电脑', 'yes');
INSERT INTO `t_ruku` VALUES ('47', '8', 'R20191009549947134', '2019-12-12', '曹明', '进购一批小米笔记本', 'no');

-- ----------------------------
-- Table structure for `t_rukumingxi`
-- ----------------------------
DROP TABLE IF EXISTS `t_rukumingxi`;
CREATE TABLE `t_rukumingxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruku_id` int(11) NOT NULL,
  `goods_id` varchar(20) NOT NULL,
  `danjia` int(11) DEFAULT NULL,
  `shuliang` int(11) DEFAULT NULL,
  `beizhu` varchar(255) DEFAULT NULL,
  `time` date NOT NULL,
  `cangku_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ruku_id` (`ruku_id`),
  KEY `goods_id` (`goods_id`),
  KEY `time` (`time`),
  KEY `cangku_id` (`cangku_id`),
  CONSTRAINT `t_rukumingxi_ibfk_1` FOREIGN KEY (`ruku_id`) REFERENCES `t_ruku` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_rukumingxi_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `t_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_rukumingxi_ibfk_3` FOREIGN KEY (`time`) REFERENCES `t_ruku` (`shijian`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_rukumingxi_ibfk_4` FOREIGN KEY (`cangku_id`) REFERENCES `t_cangku` (`cangku_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rukumingxi
-- ----------------------------
INSERT INTO `t_rukumingxi` VALUES ('26', '40', 'G2019100913924', '5900', '52', '入库成功，单价:5900元', '2019-09-21', '1');
INSERT INTO `t_rukumingxi` VALUES ('27', '40', 'G2019100914727', '6300', '10', '入库成功，单价:6300元', '2019-09-21', '1');
INSERT INTO `t_rukumingxi` VALUES ('28', '40', 'G2019100919291', '4300', '40', '入库成功，单价:4300元', '2019-09-21', '1');
INSERT INTO `t_rukumingxi` VALUES ('29', '40', 'G2019100999137', '4860', '10', '入库成功，单价:4860元', '2019-09-21', '2');
INSERT INTO `t_rukumingxi` VALUES ('30', '42', 'G2019100915566', '6400', '51', '入库成功，单价:6400元', '2019-10-01', '4');
INSERT INTO `t_rukumingxi` VALUES ('31', '42', 'G2019100967209', '7320', '80', '入库成功，单价:7320元', '2019-10-01', '4');
INSERT INTO `t_rukumingxi` VALUES ('32', '42', 'G2019100919811', '6800', '10', '入库成功，单价:6800元', '2019-10-01', '4');
INSERT INTO `t_rukumingxi` VALUES ('35', '45', 'G2019100915204', '4000', '99', '入库成功，单价:4000元', '2019-11-08', '3');
INSERT INTO `t_rukumingxi` VALUES ('36', '45', 'G2019100916157', '4500', '20', '入库成功，单价:4500元', '2019-11-08', '3');
INSERT INTO `t_rukumingxi` VALUES ('37', '47', 'G2019100999137', '4860', '9', '入库成功，单价:4860元', '2019-12-12', '1');
INSERT INTO `t_rukumingxi` VALUES ('39', '47', 'G2019100914727', '6300', '1', '入库成功，单价:6300元', '2019-12-12', '1');
INSERT INTO `t_rukumingxi` VALUES ('40', '38', 'G2019100986540', '3690', '50', '入库成功，单价:3690元', '2019-09-20', '2');
INSERT INTO `t_rukumingxi` VALUES ('41', '38', 'G2019100941778', '5340', '15', '入库成功，单价:5340元', '2019-09-20', '2');
INSERT INTO `t_rukumingxi` VALUES ('42', '38', 'G2019100910742', '5000', '5', '入库成功，单价:5000元', '2019-09-20', '2');
INSERT INTO `t_rukumingxi` VALUES ('43', '47', 'G2019100919291', '4300', '40', '入库成功，单价:4300元', '2019-12-12', '1');

-- ----------------------------
-- Table structure for `t_yuangong`
-- ----------------------------
DROP TABLE IF EXISTS `t_yuangong`;
CREATE TABLE `t_yuangong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `zhiwei` varchar(50) DEFAULT NULL,
  `quanxian` int(11) DEFAULT NULL,
  `loginName` varchar(50) DEFAULT NULL,
  `loginPw` varchar(50) DEFAULT NULL,
  `del` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_yuangong
-- ----------------------------
INSERT INTO `t_yuangong` VALUES ('2', '张亮', '男', '23', '13455985527', '江苏无锡', '员工', '1', 'zhang', '000000', 'no');
INSERT INTO `t_yuangong` VALUES ('8', '李莉', '女', '32', '15862111234', '江苏徐州', '员工', '1', 'li', '111111', 'no');
INSERT INTO `t_yuangong` VALUES ('9', '曹明', '男', '30', '13850512222', '江苏徐州', '员工', '1', 'cao', '000000', 'no');
INSERT INTO `t_yuangong` VALUES ('10', '洪红', '女', '22', '15805122345', '江苏南京', '员工', '1', 'hong', '000000', 'no');
INSERT INTO `t_yuangong` VALUES ('11', '葛明', '男', '20', '15150512222', '江苏南通', '员工', '1', 'ge', '000000', 'no');
INSERT INTO `t_yuangong` VALUES ('13', '徐明', '男', '26', '15751352345', '江苏连云港', '员工', '1', 'xu', '123', 'no');
INSERT INTO `t_yuangong` VALUES ('17', '张三', '男', '23', '18170402287', '江西农业大学南昌商学院', '员工', '1', '6kAjbtE', '000000', 'no');
INSERT INTO `t_yuangong` VALUES ('18', '刘芳', '女', '30', '1354545962', '南昌市青山湖区666号', '员工', '1', 'liufang', '000000', 'no');
INSERT INTO `t_yuangong` VALUES ('20', '李明', '男', '38', '13854680020', '江西南昌', '员工', '1', 'LiMing', '123', 'no');
INSERT INTO `t_yuangong` VALUES ('21', '赵六', '男', '29', '15339548655', '江西南昌', '员工', '0', '', '', 'no');
INSERT INTO `t_yuangong` VALUES ('22', '王芳华', '女', '25', '13640025864', '广东广州', '员工', '1', 'wangfanghua', '000000', 'no');
INSERT INTO `t_yuangong` VALUES ('23', '刘佳佳', '女', '22', '18716524865', '广东深圳', '员工', '0', '', '', 'no');
INSERT INTO `t_yuangong` VALUES ('32', 'ww', '男', '33', '18716524865', '江西南昌', '员工', '0', '', '', 'yes');
INSERT INTO `t_yuangong` VALUES ('34', '刘三', '女', '32', '13536454306', '湖南长沙', '员工', '0', '', '', 'no');
