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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `classes` */

insert  into `classes`(`id`,`classesName`) values
(1,'软件1805'),
(2,'软件1804'),
(3,'动漫1801'),
(4,'新闻1801');

/*Table structure for table `classmenu` */

DROP TABLE IF EXISTS `classmenu`;

CREATE TABLE `classmenu` (
  `classid` int(11) DEFAULT NULL,
  `menuid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `classmenu` */

insert  into `classmenu`(`classid`,`menuid`) values
(1,1),
(1,2),
(1,3);

/*Table structure for table `exam` */

DROP TABLE IF EXISTS `exam`;

CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `info` varchar(1000) DEFAULT NULL,
  `answer` varchar(2) DEFAULT NULL,
  `mid` int(22) DEFAULT NULL,
  `imgUrl` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `exam` */

insert  into `exam`(`id`,`title`,`info`,`answer`,`mid`,`imgUrl`) values
(1,'Java源文件和编译后的文件扩展名分别是___ ___','A.class 和 .java~B.class 和 .class~C.java 和 .class~D.java 和 .java','3',2,NULL),
(2,'判断两个字符串s1,s2是否同一个字符串，需要使用___ ____。','A`if`(s1=s2)~B`if`(s1==s2)~C`if`(`equals`(s1,s2))~D`if`(s1.equals(s2))','2',2,NULL),
(3,'下列说法正确的是','A JAVA程序的main方法必须写在类里面~B JAVA程序中可以有多个main方法~C JAVA程序中类名必须与文件名一样~ D JAVA程序的main方法中如果只有一条语句，可以不用{}(大括号)括起来','1',2,NULL),
(4,'下列哪些不属于java注释','A`//`~B/**/~C/***/~D@','4',2,NULL),
(5,'变量命名规范说法正确的是','A 变量由字母、下划线、数字、$符号随意组成；~ B 变量不能以数字作为开头；~ C A和a在java中是同一个变量；~  D 不同类型的变量，可以起相同的名字','2',2,NULL),
(6,'下列javaDoc注释正确的是','A /*我爱北京天安门*/~ B //我爱北京天安门*/~ C /**我爱北京天安门*/~ D /*我爱北京天安门**/','3',2,NULL),
(7,'为一个boolean类型变量赋值时，可以使用','A boolean = 1;~B boolean a = (9 >= 10);~ C boolean a=\"真\";~ D boolean a = = false;','2',2,NULL),
(8,'表达式(11+3*8)/4%3的值是','A 31~ B 0~ C 1~ D 2','4',2,NULL),
(9,'下列值不为true的表达式有','A \"john\" = = \"john\"~ B \"john\".equals(\"john\")~ C \"john\" = \"john\" ~ D、 \"john\".equals(new String(\"john\"))','3',2,NULL),
(10,'在java中下列关于自动类型转换说法正确的是','A 基本数据类型和String相加结果一定是字符串型~ B char类型和int类型相加结果一定是字符~ C double类型可以自动转换为int~  D char + int + double +\"\" 结果一定是double','1',2,NULL),
(11,'声明公用的abstract方法的正确格式是','A、public abstract void add() {}~B、public abstract add();~C、public abstract void add();~D、public virtual add();','3',3,NULL),
(13,'方法methodA定义如下: \n则返回值returnType为','A、byte~B、double~C、short~D、int','2',3,'13.png'),
(14,'在switch（表达式）语句中，表达式的类型不能为','A、byte~B、char~C、long~D、int','3',3,NULL),
(15,'下列程序结果正确的是','A、11,12~B、11,13~C、11,11~D、12,12','2',3,'15.png'),
(16,'下列不属于面向对象的特征','A、封装~B、多态~C、继承~D、接口','4',3,NULL),
(17,'接口与抽象类说法错误的是','A、都不可以被实例化~B、接口不能有普通方法~C、接口的变量是静态的~D、抽象类可以有普通方法','3',3,NULL),
(18,'关于继承与接口实现如下选项不正确的是','A  public class a extends Eat{…}~B  public class a implements Eat{…}~C  public class a extends Eat,drink{…}~D  public class a implements Eat,drink{…}','3',3,NULL),
(19,'有一个类A，以下为其构造方法的声明，其中正确的是','A)public A(int x){...}~B)static A(int x){...}~C)public a(int x){...}~D)void A(int x){...}','1',3,NULL),
(20,'以下关于Java语言继承的说法正确的是','A)Java中的类可以有多个直接父类~B)抽象类不能有子类~C)Java中的接口支持多继承~D)最终类可以作为其它类的父类','3',3,NULL),
(21,'下列选项中，哪个是java语言所有类的父类','A）String~B) Vector~C) Object~D) KeyEvent','3',3,NULL),
(22,'关于spring依赖注入错误的是','A:依赖注入使Bean与Bean之间以配置文件的形式组织在一起，而不是以硬编码的方式耦合在一起~B:Spring提供了一个依赖注入的容器，该容器相当于工厂模式中的对象工厂~依赖注入又叫控制反转，其核心思想是把获取对象的代码封装到类内部的方法中，体现了高内聚的思想~D:通过依赖注入，Spring可以与Struts 2等框架实现集成','3',5,NULL),
(23,'关于spring说法错误的是','A:Spring是非侵入式的轻量级框架，开发应用时能够尽量少的依赖框架的API~B:Spring封装了大量的企业级服务~C:Spring提供了一个IoC容器~D:Spring对应用中的每个方面都提供了实现，所以无需和其他框架集成使用','4',5,NULL),
(24,'spring AOP说法错误的是','A:AOP可以从系统中分离出切面，然后可以独立编写切面代码~B:AOP是“面向对象编程”的有益补充，而不是“面向对象编程”的替代技术~C:AOP可以使系统更好维护~D:AOP是“依赖注入”的简写','4',5,NULL),
(25,'mybatis主配置文件根节点是','A:<sqlMapConfig>~B:<configuration>~C:<setting>~D:<environments>','2',5,NULL),
(26,'mybatis描述错误的是','A:MyBatis是一个开源的数据持久层框架~B:MyBatis内部封装了JDBC访问数据库的操作，支持普通的SQL查询和高级映射，不支持存储过程~C:MyBatis主要思想是将程序中的大量SQL语句剥离出来，配置在配置文件中，实现SQL的灵活配置~D:MyBatis在对象模型和关系数据库的表之间建立了一座桥梁。','2',5,NULL),
(27,'resultMap与resultType说法错误的是','A:MyBatis在查询中进行select映射的时候，返回类型可以用resultType，也可以用resultMap~B:resultType是直接表示返回类型的，而resultMap则是对外部resultMap定义的引用~C:在一个select映射中resultType跟resultMap可以同时存在~D:resultType就是类型，包括了，int,string,以及类似model这样的Object类型','3',5,NULL),
(28,'mybatis描述错误的是','A:configuration标签是MyBatis配置文件的根标签~B:typeAliases标签的作用是定义全局的类别名~C:settings标签的用来指定全局性的配置~D:mappers标签用来指定MyBatis的中所有对象的生命周期','4',5,NULL),
(29,'mybatis关于parameterType说法错误的是','A:当把一个List实例或者数组作为参数对象传给MyBatis的时候，MyBatis会自动将它包装在一个Map中，List实例将会以“list”作为键，而数组实例将会以“array”作为键。那么在配置文件中的parameterType是可以不配置~B:MyBatis的传入参数如果是一个List或数组，可以使用mapper配置文件中的foreach语句~C:MyBatis的传入参数可以是各种Java的基本数据类型，基本数据类型作为参数，可以传多个。通过#{参数名} 即可获取传入的值~D:MyBatis的传入参数也可是复杂数据类型：包含Java实体类、Map。通过#{属性名}或#{Map的key}即可获取传入的值','3',5,NULL),
(30,'resultType当返回一个集合时，应该设置为','A:集合类型~B:字符串类型~C:整型~D:集合中所包含元素的类型','4',5,NULL),
(31,'mybatis与hibernate区别描述错误的是','A:MyBatis可以进行更加细致的SQL优化，可以减少查询字段~B:MyBatis入门相对简单并且延续了SQL的使用经验~C:HiBernate功能强大，数据无关性更有优势，程序员可以更专心进行业务处理~D:Hibernate支持二级缓存而MyBatis不支持','4',5,NULL);

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
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `title` varchar(222) DEFAULT NULL,
  `author` varchar(222) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL COMMENT '试题路径',
  `type` varchar(200) DEFAULT NULL COMMENT '试题类型',
  `opentime` datetime DEFAULT NULL COMMENT '发布时间',
  `ispublic` int(11) DEFAULT NULL COMMENT '是否公布',
  `istop` int(11) DEFAULT NULL COMMENT '是否置顶',
  `scoreTime` int(11) DEFAULT NULL COMMENT '考试时间分钟',
  `sumScore` int(11) DEFAULT NULL COMMENT '总分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `menu` */

insert  into `menu`(`id`,`title`,`author`,`status`,`url`,`type`,`opentime`,`ispublic`,`istop`,`scoreTime`,`sumScore`) values
(1,'java基础',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2,'循环',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(3,'面向对象',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'SSM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(5,'SSM整合',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `result` int(11) DEFAULT NULL,
  `time` varchar(22) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `info` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

/*Data for the table `result` */

insert  into `result`(`id`,`uid`,`title`,`result`,`time`,`mid`,`info`) values
(88,1,NULL,20,'2017-12-27 15:24:08',5,'2222222222'),
(89,19,NULL,60,'2017-12-28 17:46:27',5,'3442243424'),
(90,28,NULL,40,'2017-12-28 17:46:27',5,'4422212243'),
(91,29,NULL,70,'2017-12-28 17:46:48',5,'2442234143'),
(92,23,NULL,80,'2017-12-28 17:48:00',5,'3442232444'),
(93,13,NULL,80,'2017-12-28 17:48:28',5,'3442232342'),
(94,22,NULL,90,'2017-12-28 17:48:37',5,'3442234244'),
(95,25,NULL,100,'2017-12-28 17:49:02',5,'3442234344'),
(96,5,NULL,80,'2017-12-28 17:49:10',5,'3442234114'),
(97,11,NULL,60,'2017-12-28 17:49:30',5,'3242233241'),
(98,36,NULL,70,'2017-12-28 17:49:32',5,'34422334'),
(99,35,NULL,80,'2017-12-28 17:49:35',5,'344223344'),
(100,4,NULL,80,'2017-12-28 17:49:37',5,'344223334'),
(101,16,NULL,60,'2017-12-28 17:49:45',5,'2422234311'),
(102,17,NULL,60,'2017-12-28 17:49:48',5,'442344'),
(103,14,NULL,80,'2017-12-28 17:49:57',5,'3242234314'),
(104,32,NULL,50,'2017-12-28 17:50:01',5,'2422223314'),
(105,34,NULL,50,'2017-12-28 17:50:11',5,'2342433144'),
(106,18,NULL,50,'2017-12-28 17:50:26',5,'4422143'),
(107,6,NULL,50,'2017-12-28 17:50:31',5,'2142214313'),
(108,26,NULL,70,'2017-12-28 17:50:43',5,'3442234213'),
(109,20,NULL,60,'2017-12-28 17:50:46',5,'1442233214'),
(110,30,NULL,40,'2017-12-28 17:51:01',5,'2422324243'),
(111,61,NULL,70,'2017-12-28 17:51:07',5,'2412234144'),
(112,12,NULL,80,'2017-12-28 17:51:17',5,'3442334343'),
(113,7,NULL,100,'2017-12-28 17:52:04',5,'3442234344'),
(114,21,NULL,90,'2017-12-28 17:52:16',5,'3442234244'),
(115,31,NULL,100,'2017-12-28 17:52:42',5,'3442234344'),
(116,27,NULL,80,'2017-12-28 17:52:52',5,'3442234243'),
(117,3,NULL,100,'2017-12-28 17:55:00',5,'3442234344'),
(118,10,NULL,100,'2017-12-28 17:55:05',5,'3442234344'),
(119,82,NULL,90,'2018-03-30 17:40:57',2,'3414232431'),
(120,95,NULL,50,'2018-03-30 17:41:43',3,'1221413133'),
(121,92,NULL,100,'2018-03-30 17:42:28',3,'3332433133'),
(122,90,NULL,80,'2018-03-30 17:44:20',3,'2331433133'),
(123,91,NULL,90,'2018-03-30 17:44:38',3,'3332423133'),
(124,84,NULL,80,'2018-03-30 17:45:38',3,'3232413133'),
(125,74,NULL,70,'2018-03-30 17:45:54',3,'3322413143'),
(126,77,NULL,100,'2018-03-30 17:47:20',3,'3332433133'),
(127,82,NULL,60,'2018-03-30 17:47:37',3,'2233423133'),
(128,87,NULL,60,'2018-03-30 17:47:41',3,'2322413143'),
(129,94,NULL,100,'2018-03-30 17:49:11',3,'3332433133'),
(130,68,NULL,90,'2018-03-30 17:49:53',3,'3332433333'),
(131,65,NULL,80,'2018-03-30 17:49:55',3,'3331433433'),
(132,102,NULL,90,'2018-03-30 17:50:30',3,'2332433133'),
(133,88,NULL,60,'2018-03-30 17:51:22',3,'2322414133'),
(134,63,NULL,80,'2018-03-30 17:52:11',3,'3312413133'),
(135,81,NULL,80,'2018-03-30 17:52:17',3,'3322413133'),
(136,86,NULL,60,'2018-03-30 17:52:33',3,'2321423133'),
(137,69,NULL,30,'2018-03-30 17:53:06',3,'1221411143'),
(138,65,NULL,90,'2018-03-30 17:53:14',3,'3332433433'),
(139,77,NULL,40,'2018-03-30 17:53:35',2,'144234311'),
(140,79,NULL,40,'2018-03-30 17:53:45',3,'2321443443'),
(141,80,NULL,90,'2018-03-30 17:53:46',3,'3332433433'),
(142,72,NULL,90,'2018-03-30 17:53:53',3,'3331433133'),
(143,73,NULL,90,'2018-03-30 17:54:30',3,'3333433133'),
(144,85,NULL,70,'2018-03-30 17:54:33',3,'321433133'),
(145,16,NULL,80,'2018-03-30 17:54:47',3,'3232433143'),
(146,83,NULL,100,'2018-03-30 17:54:55',3,'3332433133'),
(147,103,NULL,80,'2018-03-30 17:55:06',3,'3232433143'),
(148,105,NULL,100,'2018-03-30 17:55:20',3,'3332433133'),
(149,65,NULL,100,'2018-03-30 17:55:39',3,'3332433133'),
(150,104,NULL,70,'2018-03-30 17:55:51',3,'3131433143'),
(151,101,NULL,80,'2018-03-30 17:56:01',3,'1332423133'),
(152,68,NULL,80,'2018-03-30 17:56:19',2,'3414242431'),
(153,93,NULL,30,'2018-03-30 17:56:50',3,'3221424213'),
(154,100,NULL,30,'2018-03-30 17:57:11',3,'121142131'),
(155,74,NULL,50,'2018-03-30 17:57:59',2,'3434244231'),
(156,64,NULL,60,'2018-03-30 17:58:14',2,'3414244421'),
(157,84,NULL,90,'2018-03-30 17:58:30',2,'3414232431'),
(158,78,NULL,10,'2018-03-30 17:59:00',3,'1424'),
(159,63,NULL,70,'2018-03-30 17:59:25',2,'3414134431'),
(160,96,NULL,80,'2018-03-30 17:59:29',3,'3311433133'),
(161,76,NULL,100,'2018-03-30 18:00:04',3,'3332433133'),
(162,71,NULL,70,'2018-03-30 18:00:15',3,'1331133133'),
(163,67,NULL,50,'2018-03-30 18:00:27',3,'1313423233'),
(164,70,NULL,70,'2018-03-30 18:00:31',3,'3312423123'),
(165,75,NULL,50,'2018-03-30 18:00:40',3,'1313423143'),
(166,98,NULL,80,'2018-03-30 18:00:48',3,'3312443133'),
(167,64,NULL,60,'2018-03-30 18:02:31',3,'2212413133'),
(168,89,NULL,90,'2018-03-30 18:03:07',3,'3333433133'),
(169,90,NULL,70,'2018-03-30 18:04:23',2,'1434232431'),
(170,97,NULL,60,'2018-03-30 18:06:01',3,'3221433143');

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
  `pwd` varchar(22) DEFAULT NULL,
  `typeclass` int(22) DEFAULT NULL,
  `url` varchar(222) DEFAULT NULL COMMENT '头像',
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`uname`,`pwd`,`typeclass`,`url`,`rid`) values
(3,'傅忠','123',0,NULL,NULL),
(4,'戚志龙','123',0,NULL,NULL),
(5,'李昊宸','123',0,NULL,NULL),
(6,'余先宝','123',0,NULL,NULL),
(7,'高瑞春','123',0,NULL,NULL),
(8,'田腾','123',3,NULL,2),
(9,'周冉','123',0,NULL,NULL),
(10,'路亚伟','123',0,NULL,NULL),
(11,'李瑞峰','123',0,NULL,NULL),
(12,'徐广杰','123',1,'img.jpg',2),
(13,'佘明亮','123',0,NULL,NULL),
(14,'任超','123',0,NULL,NULL),
(15,'孙艺伟','123',0,NULL,NULL),
(16,'姜宏','123',0,NULL,NULL),
(17,'宁营营','123',0,NULL,NULL),
(18,'范文荣','123',0,NULL,NULL),
(19,'侯楠','123',0,NULL,NULL),
(20,'王佐','123',0,NULL,NULL),
(21,'岳一鸣','123',0,NULL,NULL),
(22,'党兴','123456789123456789',0,NULL,NULL),
(23,'余明轩','123',0,NULL,NULL),
(24,'安程辉','123',0,NULL,NULL),
(25,'李赴成','123',0,NULL,NULL),
(26,'乔彦雄','123',0,NULL,NULL),
(27,'寇苗','123',0,NULL,NULL),
(28,'常宇祥','123',0,NULL,NULL),
(29,'张航','123',0,NULL,NULL),
(30,'王子威','123',0,NULL,NULL),
(31,'张文韬','123',0,NULL,NULL),
(32,'母志强','123',0,NULL,NULL),
(34,'李帅','123',0,NULL,NULL),
(35,'赵连义','123',0,NULL,NULL),
(36,'陈品超','123',0,NULL,NULL),
(38,'穆鹏辉','123',0,NULL,NULL),
(39,'王利锋','123',0,NULL,NULL),
(40,'董宝宝','123',0,NULL,NULL),
(41,'张玉特','123',0,NULL,NULL),
(42,'杨锐','123',0,NULL,NULL),
(43,'杨仁杰','123',0,NULL,NULL),
(44,'蔡茂','123',0,NULL,NULL),
(45,'董鹏飞','123',0,NULL,NULL),
(46,'李峰','123',0,NULL,NULL),
(47,'李涛涛','123',0,NULL,NULL),
(48,'任欢','123',0,NULL,NULL),
(49,'王晨','123',0,NULL,NULL),
(50,'李少博','123',0,NULL,NULL),
(51,'袁小平','123',0,NULL,NULL),
(52,'雷秉泽','123',0,NULL,NULL),
(53,'王龙飞','123',0,NULL,NULL),
(54,'高磊','123',0,NULL,NULL),
(55,'王世雄','123',0,NULL,NULL),
(56,'侯富兴','123',0,NULL,NULL),
(57,'肖李俊','123',0,NULL,NULL),
(58,'贾涛','123',0,NULL,NULL),
(59,'朱浩博','123',0,NULL,NULL),
(60,'宋智洋','123',0,NULL,NULL),
(61,'张戴海','123',0,NULL,NULL),
(63,'赵田力','123',0,NULL,NULL),
(64,'胡强','123',0,NULL,NULL),
(65,'王傢学','123',0,NULL,NULL),
(66,'段冶','123',0,NULL,NULL),
(67,'张雷','123',0,NULL,NULL),
(68,'申培兴','123',0,NULL,NULL),
(69,'张勇博','123',0,NULL,NULL),
(70,'孟亦铂','123',0,NULL,NULL),
(71,'贺琳','123',0,NULL,NULL),
(72,'李思康','123',0,NULL,NULL),
(73,'李晓君','123',0,NULL,NULL),
(74,'缪郁恒','123',0,NULL,NULL),
(75,'袁博','123',0,NULL,NULL),
(76,'岳超','123',0,NULL,NULL),
(77,'张志军','123',0,NULL,NULL),
(78,'杨帆','123',0,NULL,NULL),
(79,'谢军','123',0,NULL,NULL),
(80,'刘红震','123',0,NULL,NULL),
(81,'彭彬胤','123',0,NULL,NULL),
(82,'侯立高','123',0,NULL,NULL),
(83,'侯飞','123',0,NULL,NULL),
(84,'解洲启','123',0,NULL,NULL),
(85,'邵威宇','123',0,NULL,NULL),
(86,'田阿龙','123',0,NULL,NULL),
(87,'梁思童','123',0,NULL,NULL),
(88,'武冲','123',0,NULL,NULL),
(89,'贺佩','123',0,NULL,NULL),
(90,'兰增强','123',0,NULL,NULL),
(91,'胡丹丹','123',0,NULL,NULL),
(92,'王鹏山','123',0,NULL,NULL),
(93,'周智华','123',0,NULL,NULL),
(94,'张东升','123',0,NULL,NULL),
(95,'刘超','147258',0,NULL,NULL),
(96,'贺小锐','123',0,NULL,NULL),
(97,'鲁雷','123',0,NULL,NULL),
(98,'汤亚斌','123',0,NULL,NULL),
(99,'闫徐涛','123',0,NULL,NULL),
(100,'秦彤','123',0,NULL,NULL),
(101,'方卓','123',0,NULL,NULL),
(102,'侯丹峰','123',0,NULL,NULL),
(103,'刘凯特','123',0,NULL,NULL),
(104,'李俊鹤','123',0,NULL,NULL),
(105,'范敏杰','123',0,NULL,NULL),
(106,'姜宏','123',0,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
