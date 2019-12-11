/*
SQLyog Ultimate v12.2.6 (64 bit)
MySQL - 5.5.60-log : Database - score
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`score` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `score`;

/*Table structure for table `classes` */

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classesName` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `classes` */

insert  into `classes`(`id`,`classesName`) values
(0,'无'),
(1,'软件1805'),
(2,'软件1804'),
(3,'动漫1801'),
(4,'新闻1801');

/*Table structure for table `classmenu` */

DROP TABLE IF EXISTS `classmenu`;

CREATE TABLE `classmenu` (
  `classid` int(11) DEFAULT NULL,
  `menuid` bigint(222) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `classmenu` */

insert  into `classmenu`(`classid`,`menuid`) values
(1,2),
(1,3),
(2,3),
(2,1575855609792),
(1,1575856311650),
(1,1576034578027),
(1,1576035332842);

/*Table structure for table `exam` */

DROP TABLE IF EXISTS `exam`;

CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `info` varchar(1000) DEFAULT NULL,
  `answer` varchar(2) DEFAULT NULL,
  `mid` bigint(22) DEFAULT NULL,
  `imgUrl` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

/*Data for the table `exam` */

insert  into `exam`(`id`,`title`,`info`,`answer`,`mid`,`imgUrl`) values
(18,'关于继承与接口实现如下选项不正确的是','A  public class a extends Eat{…}~B  public class a implements Eat{…}~C  public class a extends Eat,drink{…}~D  public class a implements Eat,drink{…}','3',3,NULL),
(19,'有一个类A，以下为其构造方法的声明，其中正确的是','A)public A(int x){...}~B)static A(int x){...}~C)public a(int x){...}~D)void A(int x){...}','1',3,NULL),
(20,'以下关于Java语言继承的说法正确的是','A)Java中的类可以有多个直接父类~B)抽象类不能有子类~C)Java中的接口支持多继承~D)最终类可以作为其它类的父类','3',3,NULL),
(21,'下列选项中，哪个是java语言所有类的父类','A）String~B) Vector~C) Object~D) KeyEvent','3',3,NULL),
(22,'关于spring依赖注入错误的是','A:依赖注入使Bean与Bean之间以配置文件的形式组织在一起，而不是以硬编码的方式耦合在一起~B:Spring提供了一个依赖注入的容器，该容器相当于工厂模式中的对象工厂~依赖注入又叫控制反转，其核心思想是把获取对象的代码封装到类内部的方法中，体现了高内聚的思想~D:通过依赖注入，Spring可以与Struts 2等框架实现集成','3',5,NULL),
(23,'关于spring说法错误的是','A:Spring是非侵入式的轻量级框架，开发应用时能够尽量少的依赖框架的API~B:Spring封装了大量的企业级服务~C:Spring提供了一个IoC容器~D:Spring对应用中的每个方面都提供了实现，所以无需和其他框架集成使用','4',5,NULL),
(24,'spring AOP说法错误的是','A:AOP可以从系统中分离出切面，然后可以独立编写切面代码~B:AOP是“面向对象编程”的有益补充，而不是“面向对象编程”的替代技术~C:AOP可以使系统更好维护~D:AOP是“依赖注入”的简写','4',5,NULL),
(25,'mybatis主配置文件根节点是','A:<sqlMapConfig>~B:<configuration>~C:<setting>~D:<environments>','2',5,NULL),
(26,'mybatis描述错误的是','A:MyBatis是一个开源的数据持久层框架~B:MyBatis内部封装了JDBC访问数据库的操作，支持普通的SQL查询和高级映射，不支持存储过程~C:MyBatis主要思想是将程序中的大量SQL语句剥离出来，配置在配置文件中，实现SQL的灵活配置~D:MyBatis在对象模型和关系数据库的表之间建立了一座桥梁。','2',5,NULL),
(27,'resultMap与resultType说法错误的是','A:MyBatis在查询中进行select映射的时候，返回类型可以用resultType，也可以用resultMap~B:resultType是直接表示返回类型的，而resultMap则是对外部resultMap定义的引用~C:在一个select映射中resultType跟resultMap可以同时存在~D:resultType就是类型，包括了，int,string,以及类似model这样的Object类型','3',5,NULL),
(28,'mybatis描述错误的是','A:configuration标签是MyBatis配置文件的根标签~B:typeAliases标签的作用是定义全局的类别名~C:settings标签的用来指定全局性的配置~D:mappers标签用来指定MyBatis的中所有对象的生命周期','4',5,NULL),
(29,'mybatis关于parameterType说法错误的是','A:当把一个List实例或者数组作为参数对象传给MyBatis的时候，MyBatis会自动将它包装在一个Map中，List实例将会以“list”作为键，而数组实例将会以“array”作为键。那么在配置文件中的parameterType是可以不配置~B:MyBatis的传入参数如果是一个List或数组，可以使用mapper配置文件中的foreach语句~C:MyBatis的传入参数可以是各种Java的基本数据类型，基本数据类型作为参数，可以传多个。通过#{参数名} 即可获取传入的值~D:MyBatis的传入参数也可是复杂数据类型：包含Java实体类、Map。通过#{属性名}或#{Map的key}即可获取传入的值','3',5,NULL),
(30,'resultType当返回一个集合时，应该设置为','A:集合类型~B:字符串类型~C:整型~D:集合中所包含元素的类型','4',5,NULL),
(31,'mybatis与hibernate区别描述错误的是','A:MyBatis可以进行更加细致的SQL优化，可以减少查询字段~B:MyBatis入门相对简单并且延续了SQL的使用经验~C:HiBernate功能强大，数据无关性更有优势，程序员可以更专心进行业务处理~D:Hibernate支持二级缓存而MyBatis不支持','4',5,NULL),
(54,'spring中的哪个标签是实体类标签','A:&lt;xxx&gt;~B:&lt;haha&gt;~C:&lt;bean&gt;~D:&lt;property&gt;','C',1575855609792,NULL),
(55,'Mybatis中的sqlsession干啥的','A:打酱油~B:创建实体类~C:创建工厂对象~D:执行sql','D',1575855609792,NULL),
(56,'java中的哪些是基本数据类型','A:int~B:String~C:集合~D:数组','A',1575855609792,NULL),
(57,'spring中的哪个标签是实体类标签','A:&lt;xxx&gt;~B:&lt;haha&gt;~C:&lt;bean&gt;~D:&lt;property&gt;','C',1575856311650,NULL),
(58,'Mybatis中的sqlsession干啥的','A:打酱油~B:创建实体类~C:创建工厂对象~D:执行sql','D',1575856311650,NULL),
(59,'java中的哪些是基本数据类型','A:int~B:String~C:集合~D:数组','A',1575856311650,NULL),
(60,'java中 哪些属于集合','A:String~B:int~C:List~D:Array','C',1576035332842,NULL),
(61,'下列选项中，哪个是ArrayList的父类','A:String~B:double~C:Map~D:List','D',1576035332842,NULL),
(62,'java中的哪些是引用数据类型','A:int~B:String~C:char~D:double','B',1576035332842,NULL),
(63,'jsp中的内置对象','A:servlet~B:int~C:session~D:cookie','C',1576035332842,NULL),
(64,'spring中的AOP是什么','A:面向对象~B:依赖注入~C:控制反转~D:面向切面','D',1576035332842,NULL),
(65,'哪些类型不属于mysql','A:long~B:bigint~C:int~D:varchar','A',1576035332842,NULL),
(66,'mybatis中哪些表示返回的类型','A:column~B:property~C:result~D:resultType','D',1576035332842,NULL),
(67,'不属于springMVC的注解','A:@Controller~B:@Autowired~C:@ResponseBody~D:@RequestMapping','B',1576035332842,NULL),
(68,'java基本数据类型有几个','A:6~B:7~C:8~D:9','C',1576035332842,NULL),
(69,'那个数据类型是最长的','A:int~B:char~C:double~D:long','C',1576035332842,NULL);

/*Table structure for table `history` */

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `time` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

/*Data for the table `history` */

insert  into `history`(`id`,`uid`,`mid`,`score`,`time`) values
(87,1,5,0,'2017-12-27 15:22:58'),
(88,1,5,20,'2017-12-27 15:24:08'),
(89,19,5,60,'2017-12-28 17:46:27'),
(90,28,5,40,'2017-12-28 17:46:27'),
(91,29,5,70,'2017-12-28 17:46:48'),
(92,23,5,80,'2017-12-28 17:48:00'),
(93,13,5,80,'2017-12-28 17:48:28'),
(94,22,5,90,'2017-12-28 17:48:37'),
(95,25,5,100,'2017-12-28 17:49:02'),
(96,5,5,80,'2017-12-28 17:49:10'),
(97,11,5,60,'2017-12-28 17:49:30'),
(98,36,5,70,'2017-12-28 17:49:32'),
(99,35,5,80,'2017-12-28 17:49:35'),
(100,4,5,80,'2017-12-28 17:49:37'),
(101,16,5,60,'2017-12-28 17:49:45'),
(102,17,5,60,'2017-12-28 17:49:48'),
(103,14,5,80,'2017-12-28 17:49:57'),
(104,32,5,50,'2017-12-28 17:50:01'),
(105,34,5,50,'2017-12-28 17:50:11'),
(106,18,5,50,'2017-12-28 17:50:26'),
(107,6,5,50,'2017-12-28 17:50:31'),
(108,26,5,70,'2017-12-28 17:50:43'),
(109,20,5,60,'2017-12-28 17:50:46'),
(110,30,5,40,'2017-12-28 17:51:01'),
(111,61,5,70,'2017-12-28 17:51:07'),
(112,12,5,80,'2017-12-28 17:51:17'),
(113,7,5,100,'2017-12-28 17:52:04'),
(114,21,5,90,'2017-12-28 17:52:16'),
(115,31,5,100,'2017-12-28 17:52:42'),
(116,27,5,80,'2017-12-28 17:52:52'),
(117,3,5,100,'2017-12-28 17:55:00'),
(118,10,5,100,'2017-12-28 17:55:05'),
(119,82,2,90,'2018-03-30 17:40:57'),
(120,95,3,50,'2018-03-30 17:41:43'),
(121,92,3,100,'2018-03-30 17:42:28'),
(122,78,3,0,'2018-03-30 17:43:49'),
(123,90,3,80,'2018-03-30 17:44:20'),
(124,91,3,90,'2018-03-30 17:44:38'),
(125,84,3,80,'2018-03-30 17:45:38'),
(126,74,3,70,'2018-03-30 17:45:54'),
(127,77,3,100,'2018-03-30 17:47:20'),
(128,82,3,60,'2018-03-30 17:47:37'),
(129,87,3,60,'2018-03-30 17:47:41'),
(130,94,3,100,'2018-03-30 17:49:11'),
(131,68,3,90,'2018-03-30 17:49:53'),
(132,65,3,80,'2018-03-30 17:49:55'),
(133,102,3,90,'2018-03-30 17:50:30'),
(134,88,3,60,'2018-03-30 17:51:22'),
(135,63,3,80,'2018-03-30 17:52:11'),
(136,81,3,80,'2018-03-30 17:52:17'),
(137,86,3,60,'2018-03-30 17:52:33'),
(138,69,3,30,'2018-03-30 17:53:06'),
(139,65,3,90,'2018-03-30 17:53:14'),
(140,77,2,40,'2018-03-30 17:53:35'),
(141,79,3,40,'2018-03-30 17:53:45'),
(142,80,3,90,'2018-03-30 17:53:46'),
(143,72,3,90,'2018-03-30 17:53:53'),
(144,73,3,90,'2018-03-30 17:54:30'),
(145,85,3,70,'2018-03-30 17:54:33'),
(146,16,3,80,'2018-03-30 17:54:47'),
(147,83,3,100,'2018-03-30 17:54:55'),
(148,103,3,80,'2018-03-30 17:55:06'),
(149,105,3,100,'2018-03-30 17:55:20'),
(150,65,3,100,'2018-03-30 17:55:39'),
(151,104,3,70,'2018-03-30 17:55:51'),
(152,101,3,80,'2018-03-30 17:56:01'),
(153,68,2,80,'2018-03-30 17:56:19'),
(154,93,3,30,'2018-03-30 17:56:50'),
(155,100,3,30,'2018-03-30 17:57:11'),
(156,74,2,50,'2018-03-30 17:57:59'),
(157,64,2,60,'2018-03-30 17:58:14'),
(158,84,2,90,'2018-03-30 17:58:30'),
(159,78,3,10,'2018-03-30 17:59:00'),
(160,63,2,70,'2018-03-30 17:59:25'),
(161,96,3,80,'2018-03-30 17:59:29'),
(162,76,3,100,'2018-03-30 18:00:04'),
(163,71,3,70,'2018-03-30 18:00:15'),
(164,67,3,50,'2018-03-30 18:00:27'),
(165,70,3,70,'2018-03-30 18:00:31'),
(166,75,3,50,'2018-03-30 18:00:40'),
(167,98,3,80,'2018-03-30 18:00:49'),
(168,64,3,60,'2018-03-30 18:02:31'),
(169,89,3,90,'2018-03-30 18:03:07'),
(170,90,2,70,'2018-03-30 18:04:23'),
(171,97,3,60,'2018-03-30 18:06:01'),
(172,81,2,0,'2018-03-30 18:11:50');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` bigint(222) NOT NULL AUTO_INCREMENT,
  `title` varchar(222) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL COMMENT '试题路径',
  `type` varchar(200) DEFAULT NULL COMMENT '试题类型',
  `opentime` datetime DEFAULT NULL COMMENT '发布时间',
  `ispublic` int(11) DEFAULT NULL COMMENT '是否公布,1是立即0定时',
  `istop` int(11) DEFAULT NULL COMMENT '是否置顶',
  `scoreTime` int(11) DEFAULT NULL COMMENT '考试时间分钟',
  `sumScore` int(11) DEFAULT NULL COMMENT '总分',
  `isprivate` int(11) DEFAULT NULL COMMENT '是否是私密考题 0是私密1公开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1576035332843 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`title`,`author`,`status`,`url`,`type`,`opentime`,`ispublic`,`istop`,`scoreTime`,`sumScore`,`isprivate`) values
(1,'java基础',NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,100,NULL),
(2,'循环',NULL,NULL,NULL,NULL,NULL,NULL,NULL,60,100,NULL),
(3,'面向对象',NULL,NULL,NULL,NULL,NULL,NULL,NULL,90,100,NULL),
(4,'SSM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'SSM整合',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1575855609792,'测试1',110,NULL,NULL,NULL,'2019-12-09 09:40:09',1,0,60,150,1),
(1575856311650,'测试2',110,NULL,NULL,NULL,'2019-12-09 09:51:51',1,1,60,150,0),
(1576035332842,'1805测试',108,NULL,NULL,NULL,'2019-12-11 11:35:32',1,1,60,100,0);

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `time` varchar(22) DEFAULT NULL,
  `mid` bigint(50) DEFAULT NULL,
  `info` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;

/*Data for the table `result` */

insert  into `result`(`id`,`uid`,`title`,`result`,`time`,`mid`,`info`) values
(171,12,NULL,20,'2019-12-11 09:26:31',1575856311650,'342'),
(172,120,NULL,80,'2019-12-11 11:48:55',1576035332842,'3423414134'),
(173,115,NULL,60,'2019-12-11 11:51:08',1576035332842,'3421414314'),
(174,140,NULL,80,'2019-12-11 11:52:16',1576035332842,'3423414434'),
(175,113,NULL,80,'2019-12-11 11:58:52',1576035332842,'3443414234'),
(176,139,NULL,90,'2019-12-11 11:59:02',1576035332842,'3443414233'),
(177,134,NULL,60,'2019-12-11 11:59:11',1576035332842,'3431212233'),
(178,135,NULL,80,'2019-12-11 11:59:24',1576035332842,'3433414333'),
(179,128,NULL,60,'2019-12-11 12:01:27',1576035332842,'3411113233'),
(180,135,NULL,20,'2019-12-11 12:02:19',1575856311650,'331'),
(181,130,NULL,20,'2019-12-11 12:04:39',1575856311650,'342'),
(182,119,NULL,80,'2019-12-11 12:04:53',1576035332842,'3423414334');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`rname`) values
(1,'管理员'),
(2,'学生'),
(3,'老师');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(22) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `typeclass` int(22) DEFAULT NULL,
  `url` varchar(222) DEFAULT NULL COMMENT '头像',
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`uname`,`pwd`,`typeclass`,`url`,`rid`) values
(3,'傅忠','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(4,'戚志龙','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(5,'李昊宸','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(6,'余先宝','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(7,'高瑞春','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(8,'田腾','202cb962ac59075b964b07152d234b70',3,NULL,2),
(9,'周冉','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(10,'路亚伟','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(11,'李瑞峰','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(12,'徐广杰','202cb962ac59075b964b07152d234b70',1,'img.jpg',2),
(13,'佘明亮','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(14,'任超','202cb962ac59075b964b07152d234b70',1,NULL,2),
(15,'孙艺伟','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(16,'姜宏','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(17,'宁营营','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(18,'范文荣','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(19,'侯楠','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(20,'王佐','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(21,'岳一鸣','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(22,'党兴','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(23,'余明轩','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(24,'安程辉','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(25,'李赴成','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(26,'乔彦雄','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(27,'寇苗','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(28,'常宇祥','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(29,'张航','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(30,'王子威','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(31,'张文韬','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(32,'母志强','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(34,'李帅','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(35,'赵连义','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(36,'陈品超','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(38,'穆鹏辉','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(39,'王利锋','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(40,'董宝宝','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(41,'张玉特','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(42,'杨锐','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(43,'杨仁杰','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(44,'蔡茂','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(45,'董鹏飞','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(46,'李峰','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(47,'李涛涛','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(48,'任欢','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(49,'王晨','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(50,'李少博','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(51,'袁小平','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(52,'雷秉泽','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(53,'王龙飞','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(54,'高磊','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(55,'王世雄','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(56,'侯富兴','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(57,'肖李俊','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(58,'贾涛','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(59,'朱浩博','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(60,'宋智洋','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(61,'张戴海','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(63,'赵田力','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(64,'胡强','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(65,'王傢学','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(66,'段冶','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(67,'张雷','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(68,'申培兴','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(69,'张勇博','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(70,'孟亦铂','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(71,'贺琳','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(72,'李思康','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(73,'李晓君','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(74,'缪郁恒','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(75,'袁博','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(76,'岳超','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(77,'张志军','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(78,'杨帆','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(79,'谢军','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(80,'刘红震','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(81,'彭彬胤','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(82,'侯立高','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(83,'侯飞','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(84,'解洲启','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(85,'邵威宇','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(86,'田阿龙','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(87,'梁思童','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(88,'武冲','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(89,'贺佩','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(90,'兰增强','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(91,'胡丹丹','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(92,'王鹏山','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(93,'周智华','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(94,'张东升','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(95,'刘超','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(96,'贺小锐','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(97,'鲁雷','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(98,'汤亚斌','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(99,'闫徐涛','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(100,'秦彤','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(101,'方卓','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(102,'侯丹峰','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(103,'刘凯特','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(104,'李俊鹤','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(105,'范敏杰','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(106,'姜宏','202cb962ac59075b964b07152d234b70',0,NULL,NULL),
(108,'admin','202cb962ac59075b964b07152d234b70',0,'/upload/992623a3-df43-45b6-bcec-3c9d59da4ac3UpsellFooterBannerDesktop.jpg',1),
(109,'张老师','202cb962ac59075b964b07152d234b70',0,NULL,3),
(110,'王老师','202cb962ac59075b964b07152d234b70',0,'/upload/39f0e82f-62e5-4abd-86c4-1b4b41cb4389UpsellFooterBannerDesktop.jpg',3),
(111,'唐国庆','202cb962ac59075b964b07152d234b70',1,NULL,2),
(112,'张佳乐','202cb962ac59075b964b07152d234b70',1,NULL,2),
(113,'翟旭东','202cb962ac59075b964b07152d234b70',1,NULL,2),
(114,'杨国栋','202cb962ac59075b964b07152d234b70',1,NULL,2),
(115,'郝海毅','202cb962ac59075b964b07152d234b70',1,NULL,2),
(116,'赵钰涛','202cb962ac59075b964b07152d234b70',1,NULL,2),
(117,'郭皓坤','202cb962ac59075b964b07152d234b70',1,NULL,2),
(118,'王佳伟','202cb962ac59075b964b07152d234b70',1,NULL,2),
(119,'邓旭辉','202cb962ac59075b964b07152d234b70',1,NULL,2),
(120,'王凯','202cb962ac59075b964b07152d234b70',1,'/upload/1f046952-9812-463c-bb6b-2f0940ef100f33b6d505c91425d75f23a0ecde95ca3.jpg',2),
(121,'高新宇','202cb962ac59075b964b07152d234b70',1,NULL,2),
(122,'王宇玲','202cb962ac59075b964b07152d234b70',1,NULL,2),
(123,'张恒','202cb962ac59075b964b07152d234b70',1,NULL,2),
(124,'师川洲','202cb962ac59075b964b07152d234b70',1,NULL,2),
(125,'杨建雄','202cb962ac59075b964b07152d234b70',1,NULL,2),
(126,'宜鑫鑫','202cb962ac59075b964b07152d234b70',1,NULL,2),
(127,'杨延','202cb962ac59075b964b07152d234b70',1,NULL,2),
(128,'任会龙','202cb962ac59075b964b07152d234b70',1,NULL,2),
(129,'杨钰泊','202cb962ac59075b964b07152d234b70',1,NULL,2),
(130,'郭一叶','202cb962ac59075b964b07152d234b70',1,NULL,2),
(131,'徐梓雄','202cb962ac59075b964b07152d234b70',1,NULL,2),
(132,'邓星星','202cb962ac59075b964b07152d234b70',1,NULL,2),
(133,'张鹏宇','202cb962ac59075b964b07152d234b70',1,NULL,2),
(134,'刘天欢','202cb962ac59075b964b07152d234b70',1,NULL,2),
(135,'王城','202cb962ac59075b964b07152d234b70',1,NULL,2),
(136,'胡周彬','202cb962ac59075b964b07152d234b70',1,NULL,2),
(137,'吴晶晶','202cb962ac59075b964b07152d234b70',1,NULL,2),
(138,'张家瑜','202cb962ac59075b964b07152d234b70',1,NULL,2),
(139,'蒋鑫','202cb962ac59075b964b07152d234b70',1,NULL,2),
(140,'王秀荣','202cb962ac59075b964b07152d234b70',1,NULL,2),
(141,'刘俐卓','202cb962ac59075b964b07152d234b70',1,NULL,2),
(142,'王瑾瑜','202cb962ac59075b964b07152d234b70',1,NULL,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
