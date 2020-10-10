/*
SQLyog Ultimate v11.13 (64 bit)
MySQL - 5.7.10-log : Database - qiqiim
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`qiqiim` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `qiqiim`;

/*Table structure for table `user_account` */

DROP TABLE IF EXISTS `user_account`;

CREATE TABLE `user_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(30) DEFAULT NULL COMMENT '帐号',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `disablestate` int(11) DEFAULT NULL COMMENT '禁用状态（0 启用  1 禁用）',
  `isdel` int(11) DEFAULT NULL COMMENT '是否删除（0未删除1已删除）',
  `createdate` datetime DEFAULT NULL COMMENT '创建日期',
  `updatedate` datetime DEFAULT NULL COMMENT '修改日期',
  `updateuser` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户帐号';

/*Data for the table `user_account` */

insert  into `user_account`(`id`,`account`,`password`,`disablestate`,`isdel`,`createdate`,`updatedate`,`updateuser`) values
(1,'ding','123456',NULL,NULL,'2017-11-27 15:08:37','2017-11-27 15:08:37',NULL),
(2,'yg_hb','123456',0,0,'2017-11-27 18:00:14','2017-11-27 18:00:14',NULL),
(3,'yg_hp','123456',0,0,'2017-11-27 18:06:20','2017-11-27 18:06:20',NULL),
(4,'auto','123456',0,0,'2017-11-27 18:06:20','2017-11-27 18:06:20',NULL);
/*Table structure for table `user_department` */

DROP TABLE IF EXISTS `user_department`;

CREATE TABLE `user_department` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `count` int(11) DEFAULT NULL COMMENT '部门人数',
  `level` int(11) DEFAULT NULL COMMENT '等级',
  `parentid` bigint(20) DEFAULT NULL COMMENT '上级部门ID',
  `remark` text COMMENT '备注',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `updatedate` datetime DEFAULT NULL COMMENT '修改时间',
  `updateuser` bigint(50) DEFAULT NULL COMMENT '修改人',
  `isdel` int(11) DEFAULT NULL COMMENT '是否删除（0否1是）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='部门';

/*Data for the table `user_department` */

insert  into `user_department`(`id`,`name`,`count`,`level`,`parentid`,`remark`,`createdate`,`updatedate`,`updateuser`,`isdel`)
values (1,'青岛分公司',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL)  ;

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户id',
  `deptid` bigint(11) DEFAULT NULL COMMENT '部门',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sex` int(11) DEFAULT NULL COMMENT '性别（0女 1男）',
  `birthday` varchar(50) DEFAULT NULL COMMENT '生日',
  `cardid` varchar(20) DEFAULT NULL COMMENT '身份证',
  `signature` varchar(20) DEFAULT NULL COMMENT '签名',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业院校',
  `education` int(11) DEFAULT NULL COMMENT '学历',
  `address` varchar(200) DEFAULT NULL COMMENT '现居住地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `remark` text COMMENT '备注',
  `profilephoto` varchar(256) DEFAULT NULL COMMENT '个人头像',
  `createdate` datetime DEFAULT NULL COMMENT '创建时间',
  `createuser` bigint(20) DEFAULT NULL COMMENT '创建人',
  `updatedate` datetime DEFAULT NULL COMMENT '修改时间',
  `updateuser` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

/*Data for the table `user_info` */

insert  into `user_info`(`id`,`uid`,`deptid`,`name`,`nickname`,`sex`,`birthday`,`cardid`,`signature`,`school`,`education`,`address`,`phone`,`email`,`remark`,`profilephoto`,`createdate`,`createuser`,`updatedate`,`updateuser`)
values (1,1,1,'测试',NULL,NULL,NULL,NULL,'咨询类-承保核保-疾病核保',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-11-27 15:08:41',3,'2017-11-27 15:08:41',3),
(2,2,1,'业务管理部',NULL,NULL,NULL,NULL,'核保问题咨询',NULL,NULL,NULL,NULL,NULL,NULL,'layui/images/0.jpg','2017-11-27 18:00:14',4,'2017-11-27 18:00:14',4),
(3,3,1,'业务管理部',NULL,NULL,NULL,NULL,'理赔问题咨询',NULL,NULL,NULL,NULL,NULL,NULL,'layui/images/0.jpg','2017-11-27 18:06:20',5,'2017-11-27 18:06:20',5),
(4,4,1,'自动回答机器人',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,'layui/images/0.jpg','2017-11-27 18:06:20',5,'2017-11-27 18:06:20',5);

/*Table structure for table `user_message` */

DROP TABLE IF EXISTS `user_message`;

CREATE TABLE `user_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `senduser` varchar(100) DEFAULT NULL COMMENT '发送人',
  `receiveuser` varchar(100) DEFAULT NULL COMMENT '接收人',
  `groupid` varchar(100) DEFAULT NULL COMMENT '群ID',
  `isread` int(11) DEFAULT NULL COMMENT '是否已读 0 未读  1 已读',
  `type` int(11) DEFAULT NULL COMMENT '类型 0 单聊消息  1 群消息',
  `content` text COMMENT '消息内容',
  `createuser` bigint(20) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

/*Data for the table `user_message` */


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
