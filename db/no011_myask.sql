/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50729
Source Host           : localhost:3306
Source Database       : no011_myask

Target Server Type    : MYSQL
Target Server Version : 50729
File Encoding         : 65001

Date: 2023-10-13 21:32:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `admin_name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '用于登录的管理员账户',
  `admin_pwd` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '用于登录的密码',
  `name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员姓名',
  `sex` int(1) DEFAULT NULL COMMENT '0女，1男',
  `age` int(3) DEFAULT NULL COMMENT '管理员年龄',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员电话',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员电子邮件',
  `is_active` int(1) DEFAULT NULL COMMENT '管理员账户状态  0停用，1激活',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('4', 'admin', '123456', 'jack', '1', '20', '15825555555', '61@qq.com', '1');

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `announcement_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `title` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '公告标题',
  `context` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '公告的内容',
  `creater_id` int(9) DEFAULT NULL COMMENT '公告的创建者id',
  `create_time` datetime DEFAULT NULL COMMENT '公告发布时间',
  `is_active` int(1) DEFAULT NULL COMMENT '0 不显示，1显示',
  PRIMARY KEY (`announcement_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='公告面板，发布通知';

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('6', '顶级咨询师入驻我台', '欢迎小明咨询师入驻我台！', '4', '2023-10-13 20:48:51', '1');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `client_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '来访者的id主键',
  `client_name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '来访者登录的普通账户',
  `client_pwd` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '来访者登录的密码',
  `name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '来访者姓名',
  `sex` int(1) DEFAULT NULL COMMENT '0女，1男',
  `age` int(3) DEFAULT NULL COMMENT '来访者年龄',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '来访者电话',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '来访者电子邮件',
  `is_active` int(1) DEFAULT NULL COMMENT '来访者账户状态  0停用，1激活',
  `region_time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='来访者，普通需要咨询的人';

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('4', '18000000000', '123456', '王五', null, null, '18000000000', '605@qq.com', '1', '2023-10-13 20:53:25');

-- ----------------------------
-- Table structure for client_archive
-- ----------------------------
DROP TABLE IF EXISTS `client_archive`;
CREATE TABLE `client_archive` (
  `archives_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '咨询者的一次咨询记录',
  `client_id` int(9) NOT NULL COMMENT '本次咨询的，来访者的id',
  `doctor_id` int(9) NOT NULL COMMENT '本次咨询的，咨询师的id',
  `client_description` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '无' COMMENT '申请人的主观描述',
  `question_context` varchar(5000) COLLATE utf8_bin NOT NULL DEFAULT '未填写' COMMENT '申请人做的问卷 内容 ',
  `level` int(3) NOT NULL DEFAULT '0' COMMENT '等级分数',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `expect_place` varchar(200) COLLATE utf8_bin NOT NULL DEFAULT '未填写' COMMENT '申请人期望的咨询地点，最终只是一个参考',
  `expect_time` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '未填写' COMMENT '申请人期望的咨询时间，最终只是一个参考',
  `start_datetime` datetime DEFAULT NULL COMMENT '咨询开始时间，几月几日几时',
  `end_datetime` datetime DEFAULT NULL COMMENT '咨询结束时间，几月几日几时',
  `sub_place` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '未填写' COMMENT '咨询具体地点',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '-1 失败，0 申请中，1 通过申请但未完成，2完成咨询但未完善资料,3全部完成',
  `doc_path` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '一次咨询的记录文档，命名：日期_来访者id_咨询师id.xxx',
  `second_question_context` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '未回访' COMMENT '回访记录内容',
  `is_second_do` int(1) NOT NULL DEFAULT '0' COMMENT '是否回访,0否，1是',
  PRIMARY KEY (`archives_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='来访者的一次咨询的档案';

-- ----------------------------
-- Records of client_archive
-- ----------------------------
INSERT INTO `client_archive` VALUES ('34', '4', '27', '心理不顺畅，感觉很压抑', '{\"question11\":{\"context\":\"1.你最近感觉很快乐？\",\"answer_yes_score\":\"3\",\"answer_no_score\":\"2\",\"clientSelected\":\"2\"}}', '2', '2023-10-13 21:04:38', '杭州', '2023年10月1日-2023年10月2日', '2023-10-13 21:07:15', '2023-10-14 21:07:15', '杭州', '1', '', '', '0');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `doctor_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `doctor_name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师登录的普通账户',
  `doctor_pwd` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '用于登录的密码',
  `name` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师姓名',
  `sex` int(1) DEFAULT NULL COMMENT '0女，1男',
  `age` int(3) DEFAULT NULL COMMENT '咨询师年龄',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师电话',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师电子邮件',
  `is_active` int(1) DEFAULT NULL COMMENT '咨询师账户状态  0停用，1激活',
  `level` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师等级（一级、二级 等）',
  `skill` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师擅长方向（家庭、亲密关系，挫折等）',
  `img` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '展示给来访者的 个人照片',
  `place` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '咨询师 的咨询地点',
  PRIMARY KEY (`doctor_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='心理咨询师用户表';

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('27', 'gY6mKOqpw', '123456', '小明', '1', '25', '15825555555', '60@qq.com', '1', '一级咨询师', '心理咨询', null, '浙江省杭州市');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(9) NOT NULL AUTO_INCREMENT,
  `sender` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '发送者身份，admin 管理员，doctor 咨询师，client 咨询者',
  `sender_id` int(9) NOT NULL COMMENT '发送者的id',
  `sender_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '发送者名字',
  `receiver` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '接受者身份，admin 管理员，doctor 咨询师，client 咨询者',
  `receiver_id` int(9) NOT NULL COMMENT '接受者id',
  `receiver_name` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '接受者名字',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `is_read` int(1) DEFAULT NULL COMMENT '是否已经读过了，0 未读，1 已读',
  `context` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '消息内容',
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('76', 'admin', '4', 'jack', 'doctor', '27', '小明', '2023-10-13 20:50:51', '1', '欢迎，小明老师');
INSERT INTO `message` VALUES ('77', 'admin', '4', 'jack', 'doctor', '27', '小明', '2023-10-13 20:51:07', '1', '谢谢你的欢迎，我们一起努力');
INSERT INTO `message` VALUES ('78', 'doctor', '27', '小明', 'doctor', '27', '小明', '2023-10-13 21:04:50', '1', '你好老师，希望能早日排到我');
INSERT INTO `message` VALUES ('79', 'doctor', '27', '小明', 'client', '4', '王五', '2023-10-13 21:07:08', '0', '请问明天上午有空吗');
INSERT INTO `message` VALUES ('80', 'admin', '3', '系统(请勿回复)', 'client', '4', '接受系统消息方', '2023-10-13 21:07:24', '0', '咨询师：小明，为您安排了咨询，请在\"我的预约\"中查看详情，如有疑问请与其联系;(邮箱:60@qq.com,电话：15825555555)');
INSERT INTO `message` VALUES ('81', 'doctor', '27', '小明', 'doctor', '27', '小明', '2023-10-13 21:07:52', '0', '好的');

-- ----------------------------
-- Table structure for message_board
-- ----------------------------
DROP TABLE IF EXISTS `message_board`;
CREATE TABLE `message_board` (
  `board_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '留言主键id',
  `context` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '留言的内容',
  `creater_id` int(9) DEFAULT NULL COMMENT '留言的创建者id',
  `create_time` datetime DEFAULT NULL COMMENT '留言时间',
  `is_active` int(1) DEFAULT NULL COMMENT '0 不显示，1显示',
  PRIMARY KEY (`board_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of message_board
-- ----------------------------
INSERT INTO `message_board` VALUES ('7', '系统还挺好的', '4', '2023-10-13 20:54:10', '1');
INSERT INTO `message_board` VALUES ('8', '系统看着挺不错的呀', '4', '2023-10-13 21:05:13', '1');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(9) NOT NULL AUTO_INCREMENT COMMENT '一个问卷题目id',
  `question_num` int(5) NOT NULL COMMENT '题目题号，按照题号排列题目',
  `context` varchar(1000) COLLATE utf8_bin NOT NULL COMMENT '题目内容',
  `answer_yes_score` int(1) NOT NULL COMMENT '回答是的分值',
  `answer_no_score` int(1) NOT NULL COMMENT '回答否的分值',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('11', '1', '你最近感觉很快乐？', '3', '2');
