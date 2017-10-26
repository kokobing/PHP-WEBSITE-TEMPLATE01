-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- 主机: localhost
-- 生成日期: 2017 年 10 月 26 日 07:51
-- 服务器版本: 5.0.51
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- 数据库: `moban1`
-- 

-- --------------------------------------------------------

-- 
-- 表的结构 `backmenu`
-- 

CREATE TABLE `backmenu` (
  `id_backmenu` int(11) NOT NULL auto_increment,
  `lang` int(1) NOT NULL default '1',
  `name` varchar(25) NOT NULL,
  `remark` text NOT NULL,
  `url` varchar(100) NOT NULL,
  `fatherid` int(11) NOT NULL,
  `level` int(1) NOT NULL,
  `ordernum` int(11) NOT NULL,
  `dele` int(1) NOT NULL default '1',
  PRIMARY KEY  (`id_backmenu`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

-- 
-- 导出表中的数据 `backmenu`
-- 

INSERT INTO `backmenu` VALUES (1, 1, '产品系统', '', 'product', 0, 1, 2, 1);
INSERT INTO `backmenu` VALUES (3, 1, '信息系统', '', 'news', 0, 1, 3, 1);
INSERT INTO `backmenu` VALUES (4, 1, '人事系统', '', 'hr', 0, 1, 4, 1);
INSERT INTO `backmenu` VALUES (5, 1, '权限系统', '', 'perm', 0, 1, 5, 1);
INSERT INTO `backmenu` VALUES (6, 1, '数据库备份', '', 'dbase', 0, 1, 6, 1);
INSERT INTO `backmenu` VALUES (9, 1, '产品管理', '', '/admin/product/product_manage.php', 1, 2, 9, 1);
INSERT INTO `backmenu` VALUES (8, 1, '产品目录', '', '/admin/product/product_dir.php', 1, 2, 8, 1);
INSERT INTO `backmenu` VALUES (47, 1, '区块管理', '', '/admin/siteset/layout.php', 44, 2, 47, 1);
INSERT INTO `backmenu` VALUES (15, 1, '信息分类', '', '/admin/news/news_dir.php', 3, 2, 15, 1);
INSERT INTO `backmenu` VALUES (16, 1, '信息管理', '', '/admin/news/news_manage.php', 3, 2, 16, 1);
INSERT INTO `backmenu` VALUES (17, 1, '员工档案', '', '/admin/hr/hr_staff.php', 4, 2, 17, 1);
INSERT INTO `backmenu` VALUES (18, 1, '考核统计', '', '/admin/hr/hr_exam.php', 4, 2, 18, 1);
INSERT INTO `backmenu` VALUES (19, 1, '招聘管理', '', '/admin/hr/hr_job.php', 4, 2, 19, 1);
INSERT INTO `backmenu` VALUES (20, 1, '系统菜单', '', '/admin/perm/perm_menu.php', 5, 2, 20, 1);
INSERT INTO `backmenu` VALUES (21, 1, '权限管理', '', '/admin/perm/perm_manage.php', 5, 2, 21, 1);
INSERT INTO `backmenu` VALUES (22, 1, '数据库备份', '', '/phpMyAdmin/', 6, 2, 22, 1);
INSERT INTO `backmenu` VALUES (48, 1, '版面管理', '', '/admin/siteset/pageset.php', 44, 2, 48, 1);
INSERT INTO `backmenu` VALUES (49, 1, '前台菜单', '', '/admin/siteset/webmenu.php', 44, 2, 49, 1);
INSERT INTO `backmenu` VALUES (39, 1, '信息回收站', '', '/admin/news/newsrecycle.php', 3, 2, 39, 1);
INSERT INTO `backmenu` VALUES (41, 1, '产品回收站', '', '/admin/product/productrecycle.php', 1, 2, 41, 1);
INSERT INTO `backmenu` VALUES (46, 1, '站点设定', '', '/admin/siteset/siteset.php', 44, 2, 46, 1);
INSERT INTO `backmenu` VALUES (44, 1, '站点管理', '', 'siteset', 0, 1, 1, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `dept`
-- 

CREATE TABLE `dept` (
  `id_dept` int(11) NOT NULL auto_increment,
  `dept` varchar(25) NOT NULL,
  `lang` int(1) NOT NULL default '1',
  PRIMARY KEY  (`id_dept`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

-- 
-- 导出表中的数据 `dept`
-- 

INSERT INTO `dept` VALUES (36, '111', 1);
INSERT INTO `dept` VALUES (35, 'q', 1);
INSERT INTO `dept` VALUES (37, 'aaa', 1);
INSERT INTO `dept` VALUES (38, 'wwww', 1);
INSERT INTO `dept` VALUES (39, 'eee', 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `exam`
-- 

CREATE TABLE `exam` (
  `id_exam` int(11) NOT NULL auto_increment,
  `lang` int(1) NOT NULL default '1',
  `name` varchar(25) NOT NULL,
  `level` varchar(1) NOT NULL,
  `examdate` date NOT NULL,
  PRIMARY KEY  (`id_exam`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- 
-- 导出表中的数据 `exam`
-- 

INSERT INTO `exam` VALUES (15, 1, 'dd', 'D', '2010-10-01');
INSERT INTO `exam` VALUES (16, 1, 'ww', 'D', '2010-09-01');
INSERT INTO `exam` VALUES (17, 1, 'dr', 'D', '2010-12-01');
INSERT INTO `exam` VALUES (18, 1, 'rr', 'S', '2010-12-01');
INSERT INTO `exam` VALUES (19, 1, 'tt', 'T', '2010-10-01');
INSERT INTO `exam` VALUES (20, 1, '张荣', 'F', '2010-08-01');
INSERT INTO `exam` VALUES (21, 1, '收发', 'D', '2010-06-01');
INSERT INTO `exam` VALUES (22, 1, '张荣', 'F', '2010-12-01');
INSERT INTO `exam` VALUES (23, 1, '吕品', 'U', '2010-05-01');
INSERT INTO `exam` VALUES (24, 1, '囸打开', 'G', '2010-04-01');
INSERT INTO `exam` VALUES (25, 1, 'ss', 'S', '2010-12-01');

-- --------------------------------------------------------

-- 
-- 表的结构 `hr`
-- 

CREATE TABLE `hr` (
  `id_hr` int(11) NOT NULL auto_increment,
  `lang` int(1) NOT NULL default '1',
  `name` varchar(25) NOT NULL,
  `sex` int(1) NOT NULL default '1',
  `birthday` date NOT NULL,
  `hrcode` varchar(10) NOT NULL,
  `dept` int(11) NOT NULL,
  `iswork` int(1) NOT NULL default '1',
  `idcard` varchar(28) NOT NULL,
  `ismarry` int(1) NOT NULL,
  `nation` varchar(30) NOT NULL,
  `native` varchar(30) NOT NULL,
  `register` varchar(60) NOT NULL,
  `inwork` date NOT NULL,
  `education` varchar(20) NOT NULL,
  `profession` varchar(20) NOT NULL,
  `school` varchar(40) NOT NULL,
  `political` varchar(20) NOT NULL,
  `post` int(11) NOT NULL,
  `title` int(11) NOT NULL,
  `address` varchar(60) NOT NULL,
  `hometel` varchar(20) NOT NULL,
  `mobi` varchar(20) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `hjqk` text NOT NULL,
  `cfqk` text NOT NULL,
  `gwbd` text NOT NULL,
  `ldht` text NOT NULL,
  `sbjn` text NOT NULL,
  `remark` text NOT NULL,
  `user` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `dele` int(1) NOT NULL default '1',
  `level` int(1) NOT NULL default '1',
  `indate` datetime NOT NULL,
  `modate` datetime NOT NULL,
  `deldate` datetime NOT NULL,
  `logindate` datetime NOT NULL,
  `loginip` varchar(16) NOT NULL,
  PRIMARY KEY  (`id_hr`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

-- 
-- 导出表中的数据 `hr`
-- 

INSERT INTO `hr` VALUES (1, 1, 'administrator', 1, '0000-00-00', '', 36, 1, '', 0, '', '', '', '2011-01-29', '', '', '', '', 9, 15, '', '', '', '', '', '', '', '', '', '', 'admin', 'admin888', 1, 1, '2011-01-29 18:08:13', '2011-02-25 22:22:35', '0000-00-00 00:00:00', '2014-11-18 09:39:15', '192.168.1.89');

-- --------------------------------------------------------

-- 
-- 表的结构 `layout`
-- 

CREATE TABLE `layout` (
  `id_layout` int(11) NOT NULL auto_increment,
  `lang` int(1) NOT NULL default '1',
  `title` varchar(250) NOT NULL,
  `url` text NOT NULL,
  `intro` text NOT NULL,
  `content` text NOT NULL,
  `openstat` int(1) NOT NULL default '1',
  PRIMARY KEY  (`id_layout`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

-- 
-- 导出表中的数据 `layout`
-- 

INSERT INTO `layout` VALUES (1, 1, '英文首页广告三栏图片 735 X 345  ', '首页广告三栏', '01.About us|02.Consultancy|03.Our Services', '首页广告三栏图片 735 X 345', 1);
INSERT INTO `layout` VALUES (2, 1, '英文首页通栏广告图片 960 X 105 ', '', '首页通栏广告图片', '', 1);
INSERT INTO `layout` VALUES (3, 1, '英文首页左下角广告位 171 X 150', '', 'No license fee, what noticeably decreases total cost of Content Management System implementation. \r\nTremendous number of extensions, what creates almost unlimited development possibilities. ', '', 1);
INSERT INTO `layout` VALUES (4, 1, '英文首页下侧居中广告A 61 X 61', '', '首页下侧居中广告A 61 X 61', '<font color="#ff510c" size="1"><font color="#ff790c"><strong>Modules &amp; modifications</strong></font><br />\r\n</font>If functionality of your current&nbsp;Tengyan CMS is not satisfying, you need to add new features or modify existing ones<br />', 1);
INSERT INTO `layout` VALUES (5, 1, '英文首页下侧居中广告B 61 X 61', '', '首页下侧居中广告B  61 X 61', '<strong><font color="#ff510c" size="1"><br />\r\n<font color="#ff790c">Consultancy &amp; Support<br />\r\n</font></font></strong>We believe in partnership. We&rsquo;re more than happy to serve our Clients with honest advice and knowledge.We believe in partnership.', 1);
INSERT INTO `layout` VALUES (6, 1, '首页右下角NEWS图片 148 X 62', '', '首页右下角NEWS图片 148 X 62', '首页右下角NEWS图片 148 X 62', 0);
INSERT INTO `layout` VALUES (7, 1, 'About us页面左侧广告A1', '', 'About us页面左侧广告A1', 'About us页面左侧广告A1', 1);
INSERT INTO `layout` VALUES (8, 1, 'About us页面左侧广告A2', '', 'About us页面左侧广告A2', 'About us页面左侧广告A2', 1);
INSERT INTO `layout` VALUES (9, 1, 'About us页面右上角广告', '', 'About us页面右上角广告', 'About us页面右上角广告', 1);
INSERT INTO `layout` VALUES (10, 1, 'Product页面右上角广告', '', 'Product页面右上角广告', '', 1);
INSERT INTO `layout` VALUES (11, 1, 'Products页面左侧广告A1', '', 'Products页面左侧广告A1', 'Products页面左侧广告A1', 1);
INSERT INTO `layout` VALUES (12, 1, 'Products页面左侧广告A2', '', 'Products页面左侧广告A2', 'Products页面左侧广告A2', 1);
INSERT INTO `layout` VALUES (13, 1, 'Contact us页面左侧广告A1', '', 'Contact us页面左侧广告A1', 'Contact us页面左侧广告A1', 1);
INSERT INTO `layout` VALUES (14, 1, 'Contact us页面左侧广告A2', '', 'Contact us页面左侧广告A2', 'Contact us页面左侧广告A2', 1);
INSERT INTO `layout` VALUES (15, 1, 'Contact us 页面右上角广告', '', 'Contact us 页面右上角广告', '', 1);
INSERT INTO `layout` VALUES (16, 1, 'News 页面左侧广告A1', '', 'News 页面左侧广告A1', '', 1);
INSERT INTO `layout` VALUES (17, 1, 'News页面左侧广告A2', '', 'News页面左侧广告A2', '', 1);
INSERT INTO `layout` VALUES (18, 1, 'NEWS 页面右上角广告', '', 'NEWS 页面右上角广告', '', 1);
INSERT INTO `layout` VALUES (19, 1, '英文全局页脚', '', '全局页脚', '<table border="0" cellspacing="0" cellpadding="0" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td height="20" align="left"><a class="txt_03" href="/en/about/aboutus.php">about us</a> &nbsp;<span class="txt_03">|</span>&nbsp; <a class="txt_03" href="/en/contactus/contactus.php">contact us</a> &nbsp;<span class="txt_03">|</span>&nbsp; <a class="txt_03" href="/en/news/news.php">Newsletter</a></td>\r\n        </tr>\r\n        <tr class="txt_01">\r\n            <td height="20" align="left">Copyright 2011 Shanghai TengYan co,ltd., Allright Reserved.&nbsp;&nbsp;<a class="txt_01" href="http://www.miibeian.gov.cn/"><!--p echo $setinfo[icp]--></a></td>\r\n        </tr>\r\n    </tbody>\r\n</table>', 1);
INSERT INTO `layout` VALUES (20, 1, '全局LOGO', '', '全局LOGO', '注：<br />\r\n三张图 第一张橙色 第二张红色 第三张绿色<br />\r\n<br />\r\n<br />', 1);
INSERT INTO `layout` VALUES (21, 1, '中文首页广告三栏图片 735 X 345 ', '', '01.关于我们|02.产品展厅|03.我们的服务|04.好', '首页广告三栏图片 735 X 345 中文', 1);
INSERT INTO `layout` VALUES (22, 1, '中文首页通栏广告图片 960 X 105', '', '首页通栏广告图片 ', '', 1);
INSERT INTO `layout` VALUES (23, 1, '中文首页左下角广告位 171 X 150', '', '公司拥有领先的技术和经验，目前是引领该行业的先锋企业。经过不断的试验，努力的改正错误，我们的客户在过去的几年逐步的增长。上海腾岩信息科技有限公司是一家专注互联网技术服务的高新科技公司，公司成立以来已经在众多领域取得了骄人的成绩', '', 1);
INSERT INTO `layout` VALUES (24, 1, '中文首页下侧居中广告A 61 X 61', '', '中文首页下侧居中广告A 61 X 61', '<font color="#ff510c" size="1"><font color="#ff790c"><strong>服务器租赁托管</strong></font><br />\r\n</font>拥有独立的电力变电系统，两路专用电力供电系统，具备先进的断电自动切换装置 ，UPS 组在断电时能提供可靠...<br />', 1);
INSERT INTO `layout` VALUES (25, 1, '中文首页下侧居中广告B 61 X 61', '', '首页下侧居中广告B 61 X 61', '<strong><font color="#ff510c"><font color="#ff790c" size="1">邮件群发解决方案<br />\r\n</font></font></strong><font size="1">随着互联网的深入普及，越来越多的商务往来依托于电子邮件。企业邮箱日渐被广大企事业单位所重视，它不仅便于统一</font>', 1);
INSERT INTO `layout` VALUES (26, 1, '中文全局页脚', '', '中文全局页脚', '<table border="0" cellspacing="0" cellpadding="0" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td height="20" align="left"><a class="txt_03" href="/about/aboutus.php">关于我们</a> &nbsp;<span class="txt_03">|</span>&nbsp; <a class="txt_03" href="/contactus/contactus.php">联系我们</a> &nbsp;<span class="txt_03">|</span>&nbsp; <a class="txt_03" href="/news/news.php">新闻中心</a></td>\r\n        </tr>\r\n        <tr class="txt_01">\r\n            <td height="20" align="left">Copyright 2013 Xiamen&nbsp;<font face="">JingHui Industry Co.,Ltd</font>., Allright Reserved.&nbsp;&nbsp;<a class="txt_01" href="http://www.miibeian.gov.cn/"><!--p echo $setinfo[icp]--></a></td>\r\n        </tr>\r\n    </tbody>\r\n</table>', 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `layoutpic`
-- 

CREATE TABLE `layoutpic` (
  `id_layoutpic` int(11) NOT NULL auto_increment,
  `id_layout` int(11) NOT NULL,
  `id_hr` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `intro` text NOT NULL,
  `url` varchar(250) NOT NULL,
  `opicname` varchar(250) NOT NULL,
  `spicname` varchar(250) NOT NULL,
  `dele` int(1) NOT NULL default '1',
  `type` varchar(3) NOT NULL,
  `indate` datetime NOT NULL,
  `modate` datetime NOT NULL,
  `deldate` datetime NOT NULL,
  `browsecount` int(11) NOT NULL,
  PRIMARY KEY  (`id_layoutpic`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=118 ;

-- 
-- 导出表中的数据 `layoutpic`
-- 

INSERT INTO `layoutpic` VALUES (33, 1, 57, '', '', '', '1299742433.gif', '', 1, 'GIF', '2011-03-10 15:33:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (30, 1, 57, '', '', '', '1299740184.gif', '', 1, 'GIF', '2011-03-10 14:56:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (32, 1, 57, '', '', '', '1299741638.gif', '', 1, 'GIF', '2011-03-10 15:20:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (39, 2, 57, '', '', '', '1299748259.gif', '', 1, 'GIF', '2011-03-10 17:10:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (34, 3, 57, '', '', '', '1299743203.gif', '', 1, 'GIF', '2011-03-10 15:46:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (21, 4, 57, '', '', '', '1299657781.gif', '', 1, 'GIF', '2011-03-09 16:03:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (22, 5, 57, '', '', '', '1299658843.gif', '', 1, 'GIF', '2011-03-09 16:20:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (38, 6, 57, '', '', '', '1299748149.gif', '', 1, 'GIF', '2011-03-10 17:09:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (24, 7, 57, '', '', '', '1299671081.gif', '', 1, 'GIF', '2011-03-09 19:44:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (25, 8, 57, '', '', '', '1299671107.gif', '', 1, 'GIF', '2011-03-09 19:45:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (104, 21, 1, '', '', 'www.sina.com', '1330313578.gif', '', 1, 'GIF', '2012-02-27 11:32:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (95, 13, 1, '', '', '', '1300949143.gif', '', 1, 'GIF', '2011-03-24 14:45:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (97, 15, 1, '', '', '', '1301138669.gif', '', 1, 'GIF', '2011-03-26 19:24:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (98, 18, 1, '', '', '', '1301139317.gif', '', 1, 'GIF', '2011-03-26 19:35:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (99, 17, 1, '', '', '', '1301139345.gif', '', 1, 'GIF', '2011-03-26 19:35:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (100, 16, 1, '', '', '', '1301139353.gif', '', 1, 'GIF', '2011-03-26 19:35:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (103, 20, 1, '', '', '', '1329098021.gif', '', 1, 'GIF', '2012-02-13 09:53:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (72, 10, 1, '简介文件标题简介', '简介文件标题简介文件标题简介文件标题简介文件标题简介文件标题简介文件标题简介文件''简介文件标题简介文件标题简介文件标题简介文件标题简介文件标题简介文件标题简介文件''简介文件标题简介文件标题简介文件标题简介文件标题简介文件标题简介文件标题简介文件''', 'http://www.ty-sh.111', '1300439917.gif', '', 1, 'GIF', '2011-03-18 17:18:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (93, 12, 1, '', '', '', '1300934400.gif', '', 1, 'GIF', '2011-03-24 10:40:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (96, 14, 1, '', '', '', '1300949160.gif', '', 1, 'GIF', '2011-03-24 14:46:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (102, 9, 1, '', '', '', '1301192556.gif', '', 1, 'GIF', '2011-03-27 10:22:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (105, 21, 1, '', '', '', '1330313584.gif', '', 1, 'GIF', '2012-02-27 11:33:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (106, 21, 1, '', '', '', '1330313589.gif', '', 1, 'GIF', '2012-02-27 11:33:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (107, 22, 1, '', '', '', '1330313911.gif', '', 1, 'GIF', '2012-02-27 11:38:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (108, 23, 1, '', '', '', '1330314410.gif', '', 1, 'GIF', '2012-02-27 11:46:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (109, 24, 1, '', '', '', '1330317440.gif', '', 1, 'GIF', '2012-02-27 12:37:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (110, 25, 1, '', '', '', '1330317738.gif', '', 1, 'GIF', '2012-02-27 12:42:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (111, 20, 1, '', '', '', '1330744244.gif', '', 1, 'GIF', '2012-03-03 11:10:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `layoutpic` VALUES (112, 20, 1, '', '', '', '1330745015.gif', '', 1, 'GIF', '2012-03-03 11:14:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `newsdir`
-- 

CREATE TABLE `newsdir` (
  `id_newsdir` int(11) NOT NULL auto_increment,
  `lang` int(1) NOT NULL default '1',
  `name` varchar(25) NOT NULL,
  `intro` text NOT NULL,
  `dele` int(1) NOT NULL default '1',
  `fatherid` int(11) NOT NULL,
  `level` int(1) NOT NULL,
  `ordernum` int(11) NOT NULL,
  PRIMARY KEY  (`id_newsdir`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- 
-- 导出表中的数据 `newsdir`
-- 

INSERT INTO `newsdir` VALUES (1, 0, 'News', '111111111111', 1, 0, 1, 1);
INSERT INTO `newsdir` VALUES (3, 0, 'Company News', '222222222222222', 1, 1, 2, 0);
INSERT INTO `newsdir` VALUES (4, 0, 'Product News', '222222222222', 1, 1, 2, 0);
INSERT INTO `newsdir` VALUES (5, 0, 'Hot News', '', 1, 1, 2, 0);
INSERT INTO `newsdir` VALUES (6, 0, 'Join us', '', 1, 0, 1, 6);
INSERT INTO `newsdir` VALUES (7, 0, 'Join us', '', 1, 6, 2, 0);
INSERT INTO `newsdir` VALUES (16, 1, '公司新闻', '', 1, 15, 2, 16);
INSERT INTO `newsdir` VALUES (9, 0, 'Service', '', 0, 0, 1, 9);
INSERT INTO `newsdir` VALUES (15, 1, '新闻中心', '', 1, 0, 1, 15);
INSERT INTO `newsdir` VALUES (10, 0, 'Service', '', 1, 9, 2, 0);
INSERT INTO `newsdir` VALUES (11, 0, 'Tech Service', '', 1, 9, 2, 0);
INSERT INTO `newsdir` VALUES (17, 1, '产品中心', '', 1, 15, 2, 17);
INSERT INTO `newsdir` VALUES (18, 1, '加入我们', '', 1, 15, 2, 18);

-- --------------------------------------------------------

-- 
-- 表的结构 `newsinfo`
-- 

CREATE TABLE `newsinfo` (
  `id_newsinfo` int(11) NOT NULL auto_increment,
  `id_newsdir` int(11) NOT NULL,
  `id_hr` int(11) NOT NULL,
  `lang` int(1) NOT NULL default '1',
  `title` varchar(250) NOT NULL,
  `intro` text NOT NULL,
  `content` longtext NOT NULL,
  `tag` text NOT NULL,
  `dele` int(1) NOT NULL default '1',
  `isnew` int(1) NOT NULL default '1',
  `url` varchar(255) NOT NULL,
  `newsdate` date NOT NULL,
  `indate` datetime NOT NULL,
  `modate` datetime NOT NULL,
  `deldate` datetime NOT NULL,
  `browsecount` int(11) NOT NULL,
  PRIMARY KEY  (`id_newsinfo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=61 ;

-- 
-- 导出表中的数据 `newsinfo`
-- 

INSERT INTO `newsinfo` VALUES (1, 3, 0, 1, ' This ensures a huge range of free, professional and high quality resources.', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n\r\n', '<p>Tengyan is a market leader. It&rsquo;s been awarded a CMS of the year 2007, 2008 and won a Hall of Fame Award in the 2009 being the Best Open Source PHP CMS.</p>\r\n<p>Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>', '', 1, 1, '', '2010-12-05', '2010-12-05 14:03:36', '2011-03-24 16:27:26', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (2, 3, 0, 1, 'market leader. It’s been awarded a CMS of the year 2007, 2008 and won a Hall ', 'market leader. It’s been awarded a CMS of the year 2007, 2008 and won a Hall of Fame Award in the 2009 being the Best Open Source PHP CMS.\r\n\r\n', '<p>market leader. It&rsquo;s been awarded a CMS of the year 2007, 2008 and won a Hall of Fame Award in the 2009 being the Best Open Source PHP CMS.</p>\r\n<p>Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>', '', 1, 1, '', '2010-12-05', '2010-12-05 14:03:48', '2011-03-24 16:28:02', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (3, 3, 0, 1, 'are involved in manufacturing & construction, finance, and services & leisure', 'are involved in manufacturing & construction, finance, and services & leisureare involved in manufacturing & construction, finance, and services & leisure', 'we are involved in manufacturing &amp; construction, finance, and services &amp; leisure, which includes our parent company, Hanwha Corporation. We have 50 affiliates, six of which are publicly traded, including Hanwha Chemical Corporation and Korea Life Insurance, the second largest insurance company in Korea. Hanwha Chemical Corporation recently acquired a 49.99% stake in Hanwha SolarOne, thus becoming the largest shareholder of the module manufacturer ranked 4th in the world.&nbsp;<br />\r\n<br />\r\nwe are involved in manufacturing &amp; construction, finance, and services &amp; leisure, which includes our parent company, Hanwha Corporation. We have 50 affiliates, six of which are publicly traded, including Hanwha Chemical Corporation and Korea Life Insurance, the second largest insurance company in Korea. Hanwha Chemical Corporation recently acquired a 49.99% stake in Hanwha SolarOne, thus becoming the largest shareholder of the module manufacturer ranked 4th in the world.&nbsp;<br />\r\n<br />\r\nwe are involved in manufacturing &amp; construction, finance, and services &amp; leisure, which includes our parent company, Hanwha Corporation. We have 50 affiliates, six of which are publicly traded, including Hanwha Chemical Corporation and Korea Life Insurance, the second largest insurance company in Korea. Hanwha Chemical Corporation recently acquired a 49.99% stake in Hanwha SolarOne, thus becoming the largest shareholder of the module manufacturer ranked 4th in the world.', '', 1, 1, '', '2010-12-05', '2010-12-05 14:04:03', '2011-03-24 16:41:58', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (4, 3, 0, 1, 'high-quality silicon for all its products', 'high-quality silicon for all its productshigh-quality silicon for all its productshigh-quality silicon for all its products', '&nbsp;has invested in a reliable pipeline of high-quality silicon for all its products. Through the acquisition of a highly respected silicon ingot producer and stable, worldwide partnerships that ensure a long-term ingot and wafer supply, we can leverage market fluctuations to obtain the highest quality silicon at significant savings.&nbsp;<br jquery1300955958283="132" />\r\n<br jquery1300955958283="133" />\r\nhas invested in a reliable pipeline of high-quality silicon for all its products. Through the acquisition of a highly respected silicon ingot producer and stable, worldwide partnerships that ensure a long-term ingot and wafer supply, we can leverage market fluctuations to obtain the highest quality silicon at significant savings.&nbsp;<br jquery1300955958283="132" />\r\n<br jquery1300955958283="133" />\r\nhas invested in a reliable pipeline of high-quality silicon for all its products. Through the acquisition of a highly respected silicon ingot producer and stable, worldwide partnerships that ensure a long-term ingot and wafer supply, we can leverage market fluctuations to obtain the highest quality silicon at significant savings.&nbsp;<br jquery1300955958283="132" />\r\n<br jquery1300955958283="133" />\r\nhas invested in a reliable pipeline of high-quality silicon for all its products. Through the acquisition of a highly respected silicon ingot producer and stable, worldwide partnerships that ensure a long-term ingot and wafer supply, we can leverage market fluctuations to obtain the highest quality silicon at significant savings. <br jquery1300955958283="132" />\r\n<br jquery1300955958283="133" />', '', 1, 1, '', '2010-12-05', '2010-12-05 14:04:14', '2011-03-24 16:41:01', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (5, 3, 0, 1, ' in the fabrication of integrated circuits and other micro devices', ' in the fabrication of integrated circuits and other micro devices in the fabrication of integrated circuits and other micro devices in the fabrication of integrated circuits and other micro devices', 'such as a silicon crystal, used in the fabrication of integrated circuits and other micro devices. The wafer serves as the substrate for microelectronic devices that are built in and over the wafer and undergoes many microfabrication process steps such as doping or ion implantation, etching, deposition of various materials, and photolithographic patterning. Several types of solar cells are made from such wafers. A solar wafer is a circular solar cell made from the entire wafer (rather than cutting into smaller rectangular solar cells).&nbsp;<br jquery1300955958283="124" />\r\n<br />\r\nsuch as a silicon crystal, used in the fabrication of integrated circuits and other micro devices. The wafer serves as the substrate for microelectronic devices that are built in and over the wafer and undergoes many microfabrication process steps such as doping or ion implantation, etching, deposition of various materials, and photolithographic patterning. Several types of solar cells are made from such wafers. A solar wafer is a circular solar cell made from the entire wafer (rather than cutting into smaller rectangular solar cells).&nbsp;<br jquery1300955958283="124" />\r\n<br />\r\nsuch as a silicon crystal, used in the fabrication of integrated circuits and other micro devices. The wafer serves as the substrate for microelectronic devices that are built in and over the wafer and undergoes many microfabrication process steps such as doping or ion implantation, etching, deposition of various materials, and photolithographic patterning. Several types of solar cells are made from such wafers. A solar wafer is a circular solar cell made from the entire wafer (rather than cutting into smaller rectangular solar cells). <br jquery1300955958283="124" />', '', 1, 1, '', '2010-12-05', '2010-12-05 14:04:25', '2011-03-24 16:40:25', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (6, 3, 0, 1, 'metal, that is cast into a shape that is suitable for further processing', 'An ingot is a material, usually metal, that is cast into a shape that is suitable for further processing. Non-metallic and semiconductor materials prepared in bulk may also be referred as ingots, ', 'An ingot is a material, usually metal, that is cast into a shape that is suitable for further processing. Non-metallic and semiconductor materials prepared in bulk may also be referred as ingots, particularly when they are cast by mold based methods. In the semiconductor industry, an ingot is usually a material made of silicon that is processed to produce single crystal silicon. This is then cut and polished to create wafers on which devices ranging from microprocessors to memory devices can be fabricated. <br jquery1300955958283="118" />\r\n<br jquery1300955958283="119" />\r\nAn ingot is a material, usually metal, that is cast into a shape that is suitable for further processing. Non-metallic and semiconductor materials prepared in bulk may also be referred as ingots, particularly when they are cast by mold based methods. In the semiconductor industry, an ingot is usually a material made of silicon that is processed to produce single crystal silicon. This is then cut and polished to create wafers on which devices ranging from microprocessors to memory devices can be fabricated. <br jquery1300955958283="118" />\r\n<br jquery1300955958283="119" />\r\nAn ingot is a material, usually metal, that is cast into a shape that is suitable for further processing. Non-metallic and semiconductor materials prepared in bulk may also be referred as ingots, particularly when they are cast by mold based methods. In the semiconductor industry, an ingot is usually a material made of silicon that is processed to produce single crystal silicon. This is then cut and polished to create wafers on which devices ranging from microprocessors to memory devices can be fabricated. <br jquery1300955958283="118" />\r\n<br jquery1300955958283="119" />', '', 1, 1, '', '2010-12-05', '2010-12-05 14:04:36', '2011-03-24 16:39:37', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (8, 3, 0, 1, ' in Ya’an city''s industrial district, which is in Sichuan province', ' in Ya’an city''s industrial district, which is in Sichuan province in Ya’an city''s industrial district, which is in Sichuan province', '&nbsp;in Ya&rsquo;an city''s industrial district, which is in Sichuan province, China. Its has earned $34million USD in sales volume in 2009, and is staffed by 430 employees. Ya&rsquo;an Yongwang Silicon Industry Co., Ltd. started its business in 2008, annually producing 800 tons of polysilicon. It supplies its products to major Chinese solar companies such as<br />\r\n&nbsp;<br />\r\nSolarOne. Yongwang Silicon Industry Co., Ltd. one of our affiliates that produces poly-silicon, is located in Ya&rsquo;an city''s industrial district, which is in Sichuan province, China. Its has earned $34million USD in sales volume in 2009, and is staffed by 430 employees. Ya&rsquo;an Yongwang Silicon Industry Co., Ltd. started its business in 2008, annually producing 800 tons of polysilicon. It supplies its products to major Chinese solar companies such as Hanwha SolarOne.<br />\r\n<br />\r\nSolarOne. Yongwang Silicon Industry Co., Ltd. one of our affiliates that produces poly-silicon, is located in Ya&rsquo;an city''s industrial district, which is in Sichuan province, China. Its has earned $34million USD in sales volume in 2009, and is staffed by 430 employees. Ya&rsquo;an Yongwang Silicon Industry Co., Ltd. started its business in 2008, annually producing 800 tons of polysilicon. It supplies its products to major Chinese solar companies such as Hanwha SolarOne.', '', 1, 1, '', '2010-12-05', '2010-12-05 14:04:56', '2011-03-24 16:38:15', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (9, 4, 0, 1, ' Industry Co., Ltd. one of our affiliates that produces poly-silicon', ' Industry Co., Ltd. one of our affiliates that produces poly-silicon, is located in Ya’an city''s industrial district, which is in Sichuan province, China. Its has earned $34million USD in sales volume in 2009', '&nbsp;Industry Co., Ltd. one of our affiliates that produces poly-silicon, is located in Ya&rsquo;an city''s industrial district, which is in Sichuan province, China. Its has earned $34million USD in sales volume in 2009, and is staffed by 430 employees. Ya&rsquo;an Yongwang Silicon Industry Co., Ltd. started its business in 2008, annually producing 800 tons of polysilicon. It supplies its products to major Chinese solar companies such as<br />\r\n&nbsp;<br />\r\nSolarOne. Yongwang Silicon Industry Co., Ltd. one of our affiliates that produces poly-silicon, is located in Ya&rsquo;an city''s industrial district, which is in Sichuan province, China. Its has earned $34million USD in sales volume in 2009, and is staffed by 430 employees. Ya&rsquo;an Yongwang Silicon Industry Co., Ltd. started its business in 2008, annually producing 800 tons of polysilicon. It supplies its products to major Chinese solar companies such as Hanwha SolarOne.<br />\r\n<br />\r\nSolarOne. Yongwang Silicon Industry Co., Ltd. one of our affiliates that produces poly-silicon, is located in Ya&rsquo;an city''s industrial district, which is in Sichuan province, China. Its has earned $34million USD in sales volume in 2009, and is staffed by 430 employees. Ya&rsquo;an Yongwang Silicon Industry Co., Ltd. started its business in 2008, annually producing 800 tons of polysilicon. It supplies its products to major Chinese solar companies such as Hanwha SolarOne.', '', 1, 1, '', '2010-12-05', '2010-12-05 14:05:10', '2011-03-24 16:37:55', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (10, 4, 0, 1, 'develops power plant projects by utilizing its own global networks', 'develops power plant projects by utilizing its own global networks', '&nbsp;plant projects by utilizing its own global networks, which are set up for import and export business. We are also cooperating with local developers to more efficiently expand our market share. Hanwha Corporation has 9 corporate bodies and 14 branch offices in the U.S., Europe, and Japan, and we<br />\r\n&nbsp;<br />\r\nsolutions for PV power plant project development by establishing strategic alliances with local developers and making direct investments. develops power plant projects by utilizing its own global networks, which are set up for import and export business. We are also cooperating with local developers to<br />\r\n&nbsp;<br />\r\nmore efficiently expand our market share. Hanwha Corporation has 9 corporate bodies and 14 branch offices in the U.S., Europe, and Japan, and we can provide various solutions for PV power plant project development by establishing strategic alliances with local developers and making direct investments.develops power plant projects by utilizing its own global networks, which are set up for import and export business. We are also cooperating with local developers to more efficiently expand our market share. Hanwha Corporation has 9 corporate bodies and 14 branch offices in the U.S., Europe, and Japan, and we<br />\r\n&nbsp;<br />\r\ncan provide various solutions for PV power plant project development by establishing strategic alliances with local developers and making direct investments. develops power plant projects by utilizing its own global networks, which are set up for import and export business. We are also cooperating with local developers to<br />\r\n&nbsp;<br />\r\nmore efficiently expand our market share. Hanwha Corporation has 9 corporate bodies and 14 branch offices in the U.S., Europe, and Japan, and we can provide various solutions for PV power plant project development by establishing strategic alliances with local developers and making direct investments.', '', 1, 1, '', '2010-12-05', '2010-12-05 14:05:24', '2011-03-24 16:36:17', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (11, 4, 0, 1, 'by utilizing its own global networks', ' plant projects by utilizing its own global networks, which are set up for import and export business. We are also cooperating with local developers to more efficiently expand our market share. Hanwha Corporation has 9 corporate bodies and 14 branch offices in the U.S., Europe, and Japan, and we\r\n', '&nbsp;plant projects by utilizing its own global networks, which are set up for import and export business. We are also cooperating with local developers to more efficiently expand our market share. Hanwha Corporation has 9 corporate bodies and 14 branch offices in the U.S., Europe, and Japan, and we<br />\r\n&nbsp;<br />\r\ncan provide various solutions for PV power plant project development by establishing strategic alliances with local developers and making direct investments. develops power plant projects by utilizing its own global networks, which are set up for import and export business. We are also cooperating with local developers to<br />\r\n&nbsp;<br />\r\nmore efficiently expand our market share. Hanwha Corporation has 9 corporate bodies and 14 branch offices in the U.S., Europe, and Japan, and we can provide various solutions for PV power plant project development by establishing strategic alliances with local developers and making direct investments.develops power plant projects by utilizing its own global networks, which are set up for import and export business. We are also cooperating with local developers to more efficiently expand our market share. Hanwha Corporation has 9 corporate bodies and 14 branch offices in the U.S., Europe, and Japan, and we<br />\r\n&nbsp;<br />\r\ncan provide various solutions for PV power plant project development by establishing strategic alliances with local developers and making direct investments. develops power plant projects by utilizing its own global networks, which are set up for import and export business. We are also cooperating with local developers to<br />\r\n&nbsp;<br />\r\nmore efficiently expand our market share. Hanwha Corporation has 9 corporate bodies and 14 branch offices in the U.S., Europe, and Japan, and we can provide various solutions for PV power plant project development by establishing strategic alliances with local developers and making direct investments.', '', 1, 1, '', '2010-12-05', '2010-12-05 14:05:36', '2011-03-24 16:35:56', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (13, 5, 0, 1, 'no costly licensing fees or risk of vendor lock-in.', 'no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.', 'no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>', '', 1, 1, '', '2010-12-05', '2010-12-05 14:07:54', '2011-03-24 16:34:34', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (14, 5, 0, 1, 'fees or risk of vendor lock-in. It can significantly reduce total ', 'has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\n\r\nTengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n\r\nTengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions \r\n', 'massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>', '', 1, 1, '', '2010-12-05', '2010-12-05 14:08:02', '2011-03-24 16:33:58', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (15, 5, 0, 1, 'licensing fees or risk of vendor lock-in. It can significantly reduce total ', 'licensing fees or risk of vendor lock-in. It can significantly reduce total licensing fees or risk of vendor lock-in. It can significantly reduce total ', 'licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>', '', 1, 1, '', '2010-12-05', '2010-12-05 14:08:12', '2011-03-24 16:33:24', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (16, 4, 0, 1, 'licensing fees or risk of vendor lock-in. It can significantly ', 'licensing fees or risk of vendor lock-in. It can significantly licensing fees or risk of vendor lock-in. It can significantly ', 'licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>', '', 1, 1, '', '2010-12-06', '2010-12-06 10:22:27', '2011-03-24 16:33:05', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (17, 4, 0, 1, ' Tengyan has become the most powerful, robust and extensible ', 'Tengyan has become the most powerful, robust and extensible  Tengyan has become the most powerful, robust and extensible ', 'huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>', '', 1, 1, '', '2010-12-06', '2010-12-06 10:22:36', '2011-03-24 16:32:48', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (18, 16, 0, 1, 'Tengyan has no costly licensing fees or risk of vendor lock-in.', 'Tengyan has no costly licensing fees or risk of vendor lock-in.Tengyan has no costly licensing fees or risk of vendor lock-in.', '&nbsp;developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>', '', 1, 1, '', '2010-12-06', '2010-12-06 10:22:43', '2012-02-28 16:00:30', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (19, 17, 0, 1, 'risk of vendor lock-in. It can significantly reduce total project integration costs', 'risk of vendor lock-in. It can significantly reduce total project integration costsrisk of vendor lock-in. It can significantly reduce total project integration costs', 'risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>', '', 1, 1, '', '2010-12-06', '2010-12-06 10:23:05', '2012-02-28 16:00:21', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (20, 18, 0, 1, '网站空间、数据库、服务器租用托管业务、网站建设、营运咨询、管理维护等等。', 'developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.', 'developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>', '', 1, 1, '', '2010-12-06', '2010-12-06 10:23:12', '2012-02-28 16:01:35', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (21, 17, 0, 1, '如域名注册、企业邮局、邮件群发', 'This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.', 'developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>', '', 1, 1, '', '2010-12-06', '2010-12-06 10:23:18', '2012-02-28 16:01:25', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (22, 16, 0, 1, '我们的所涉及的全部服务与技术支持', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n\r\n', '<div id="inner_contentinner_right3" class="txt">\r\n<p>Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n</div>', '', 1, 1, '', '2010-12-06', '2010-12-06 10:23:24', '2012-02-28 16:01:12', '0000-00-00 00:00:00', 0);
INSERT INTO `newsinfo` VALUES (60, 16, 0, 1, '互联网技术服务范围已经涵盖互联网', '我们的所涉及的全部服务与技术支持，如域名注册、企业邮局、邮件群发、网站空间、数据库、服务器租用托管业务、网站建设、营运咨询、管理维护等等。\r\n', '我们的互联网技术服务范围已经涵盖互联网所涉及的全部服务与技术支持，如域名注册、企业邮局、邮件群发、网站空间、数据库、服务器租用托管业务、网站建设、营运咨询、管理维护等等。<br />', '', 1, 1, '', '2012-02-27', '2012-02-27 13:41:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `newspic`
-- 

CREATE TABLE `newspic` (
  `id_newspic` int(11) NOT NULL auto_increment,
  `id_newsinfo` int(11) NOT NULL,
  `id_hr` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `intro` text NOT NULL,
  `url` varchar(250) NOT NULL,
  `opicname` varchar(250) NOT NULL,
  `spicname` varchar(250) NOT NULL,
  `dele` int(1) NOT NULL default '1',
  `type` varchar(3) NOT NULL,
  `indate` datetime NOT NULL,
  `modate` datetime NOT NULL,
  `deldate` datetime NOT NULL,
  `browsecount` int(11) NOT NULL,
  PRIMARY KEY  (`id_newspic`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- 导出表中的数据 `newspic`
-- 

INSERT INTO `newspic` VALUES (1, 59, 57, '', '', '', '1298517017.jpg', '', 1, 'JPG', '2011-02-24 11:10:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `newspic` VALUES (2, 57, 57, '', '', '', '1298526718.jpg', '', 1, 'JPG', '2011-02-24 13:51:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `newspic` VALUES (6, 53, 1, '111111', '111111111111111111', '1111111', '1300872682.jpg', '', 1, 'JPG', '2011-03-23 17:31:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `newspic` VALUES (7, 53, 1, '22', '222', '22', '1300873167.jpg', '', 1, 'JPG', '2011-03-23 17:39:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `pageset`
-- 

CREATE TABLE `pageset` (
  `id_pageset` int(11) NOT NULL auto_increment,
  `lang` int(1) NOT NULL default '1',
  `title` varchar(250) NOT NULL,
  `url` text NOT NULL,
  `pagetitle` text NOT NULL,
  `keywords` text NOT NULL,
  `description` text NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY  (`id_pageset`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- 导出表中的数据 `pageset`
-- 

INSERT INTO `pageset` VALUES (1, 1, '首页自定义搜索引擎关健词', '11', '', '', '', '首页自定义搜索引擎关健词');
INSERT INTO `pageset` VALUES (2, 1, '英文About us页面', '', '', '', '', '<table border="0" cellspacing="8" cellpadding="8" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="50%" align="left">\r\n            <p><font color="#ff530a" size="3"><strong><strike><br />\r\n            </strike></strong><strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strike><br />\r\n            About us&nbsp;</font><br />\r\n            <font color="#5e5d5d" size="3">Leading, free open-source solution</font></p>\r\n            <p>Tengyan&nbsp;is a market leader. It&rsquo;s been awarded a CMS of the year 2007, 2008 and won a Hall of Fame Award in the 2009 being the Best Open Source PHP CMS.<br />\r\n            Tengyan&nbsp;has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources</p>\r\n            <br />\r\n            <img alt="" src="/upload/layout/1299730481.gif" /><br />\r\n            <p>Tengyan&nbsp;has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions&nbsp;Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n            </td>\r\n            <td valign="top" width="50%" align="left">\r\n            <p><font color="#ff530a" size="3"><strong><strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strike><br />\r\n            </strong>Features&nbsp;</font><br />\r\n            <font color="#424242" size="3"><font color="#5e5d5d">We&nbsp; most useful and common modules.</font> </font></p>\r\n            <p>With Tengyan, we&acute;ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard.</p>\r\n            <p>Set up user roles and permissions. Assign Manager, Employee or Admin role with ease. Decide what content is available to whom.Support for multiple-language websites. Enjoy clean, user and search engine friendly URLs. Other SEO friendly features are inside too: Titles, Internal Link Structure, Meta Tags.There are absolutely no restriction on how your site looks like. Create very unique, custom theme.<br />\r\n            <img alt="" src="/upload/layout/1299750695.gif" /></p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>');
INSERT INTO `pageset` VALUES (3, 1, '英文Intro页面', '', '', '', '', '&nbsp;Tengyan is a market leader. It&rsquo;s been awarded a CMS of the year 2007, 2008 and won a Hall of Fame Award in the 2009 being the Best Open Source PHP CMS.<br />\r\n<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.<br />\r\n<br />\r\n<input style="margin-right: 10px" align="left" src="/upload/layout/1299904822.jpg" width="211" height="454" type="image" longdesc="undefined" />Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\n<br />\r\nTengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.<br />\r\n<br />\r\nTengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.<br />\r\n<br />\r\nTengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />\r\n<br />');
INSERT INTO `pageset` VALUES (4, 1, '英文CEO''s Message页面', '', '', '', '', '<p>Tengy has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>');
INSERT INTO `pageset` VALUES (5, 1, '英文Contact us页面', '', '', '', '', '<table border="0" cellspacing="0" cellpadding="0" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td><img alt="" width="697" height="357" src="/inc/pics/map.gif" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td>Shanghai TengYan<br />\r\n            IT Manager: Mr. Alex<br />\r\n            Tel: (+86) 21-8759 1678<br />\r\n            Fax: (+86) 21-8759 4888<br />\r\n            E-mail: <a class="link_03" href=" mailto:alex@ty-sh.com">alex@ty-sh.com</a><br />\r\n            Web: <span lang="EN-US"><a class="link_03" href=" http://www.ty-sh.com/">www.ty-sh.com</a></span><br />\r\n            Add: No.8, Taichang Road,Shanghai, China</td>\r\n        </tr>\r\n        <!--p if($setinfo[mapcode]!=&acute;&acute;)-->\r\n        <tr>\r\n            <td><!--p echo $setinfo[mapcode]--></td>\r\n        </tr>\r\n        <!--p -->\r\n    </tbody>\r\n</table>');
INSERT INTO `pageset` VALUES (6, 1, '英文Our factory页面', '', '', '', '', '<table border="0" cellspacing="8" cellpadding="8" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="50%" align="left">\r\n            <p><font color="#ff530a" size="3"><strong><strike><input src="/upload/layout/1301123680.jpg" type="image" longdesc="undefined" /><br />\r\n            </strike></strong><strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strike><br />\r\n            About us&nbsp;</font><br />\r\n            <font color="#5e5d5d" size="3">Leading, free open-source solution</font></p>\r\n            <p>Tengyan&nbsp;is a market leader. It&rsquo;s been awarded a CMS of the year 2007, 2008 and won a Hall of Fame Award in the 2009 being the Best Open Source PHP CMS.<br />\r\n            Tengyan&nbsp;has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources</p>\r\n            <br />\r\n            <img alt="" src="/upload/layout/1299730481.gif" /><br />\r\n            <p>Tengyan&nbsp;has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions&nbsp;Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n            </td>\r\n            <td valign="top" width="50%" align="left">\r\n            <p><font color="#ff530a" size="3"><strong><strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strike><br />\r\n            </strong>Features&nbsp;</font><br />\r\n            <font color="#424242" size="3"><font color="#5e5d5d">We&nbsp; most useful and common modules.</font> </font></p>\r\n            <p>With Tengyan, we&acute;ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard.</p>\r\n            <p>Set up user roles and permissions. Assign Manager, Employee or Admin role with ease. Decide what content is available to whom.Support for multiple-language websites. Enjoy clean, user and search engine friendly URLs. Other SEO friendly features are inside too: Titles, Internal Link Structure, Meta Tags.There are absolutely no restriction on how your site looks like. Create very unique, custom theme.<br />\r\n            <img alt="" src="/upload/layout/1301123865.jpg" /></p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>');
INSERT INTO `pageset` VALUES (7, 1, '中文Intro页面', '', '', '', '', '<p>&nbsp;公司拥有领先的技术和经验，目前是引领该行业的先锋企业。经过不断的试验，努力的改正错误，我们的客户在过去的几年逐步的增长。上海腾岩信息科技有限公司是一家专注互联网技术服务的高新科技公司，公司成立以来已经在众多领域取得了骄人的成绩，同时我们与国际、国内众多ISP服务商、软件开发商及IT服务企业结为战略联盟和合作伙伴。</p>\r\n<p>腾岩科技的服务范围包括：互联网基础应用、网站建设、企事业信息管理系统、数据库开发、B/S软件研发等。</p>\r\n<p><input style="margin-right: 10px" align="left" src="/upload/layout/1299904822.jpg" width="211" height="454" type="image" longdesc="undefined" /></p>\r\n<p>我们的互联网技术服务范围已经涵盖互联网所涉及的全部服务与技术支持，如域名注册、企业邮局、邮件群发、网站空间、数据库、服务器租用托管业务、网站建设、营运咨询、管理维护等等。</p>\r\n<p>腾岩科技专注以互联网领域的信息技术服务为公司的主要发展之路,使用户在享受信息科技发展最新成果的同时不断获得最大的收益。 一个能从别人的观念来看事情，能了解别人心灵活的人，永远不必为自己的前途担心。</p>\r\n<p>&nbsp;公司拥有领先的技术和经验，目前是引领该行业的先锋企业。经过不断的试验，努力的改正错误，我们的客户在过去的几年逐步的增长。上海腾岩信息科技有限公司是一家专注互联网技术服务的高新科技公司，公司成立以来已经在众多领域取得了骄人的成绩，同时我们与国际、国内众多ISP服务商、软件开发商及IT服务企业结为战略联盟和合作伙伴。</p>\r\n<p>腾岩科技的服务范围包括：互联网基础应用、网站建设、企事业信息管理系统、数据库开发、B/S软件研发等。</p>\r\n<p>&nbsp;公司拥有领先的技术和经验，目前是引领该行业的先锋企业。经过不断的试验，努力的改正错误，我们的客户在过去的几年逐步的增长。上海腾岩信息科技有限公司是一家专注互联网技术服务的高新科技公司，公司成立以来已经在众多领域取得了骄人的成绩，同时我们与国际、国内众多ISP服务商、软件开发商及IT服务企业结为战略联盟和合作伙伴。</p>\r\n<p>腾岩科技的服务范围包括：互联网基础应用、网站建设、企事业信息管理系统、数据库开发、B/S软件研发等。</p>\r\n<p>&nbsp;</p>');
INSERT INTO `pageset` VALUES (8, 1, '中文About us页面', '', '', '', '', '<table border="0" cellspacing="8" cellpadding="8" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="50%" align="left">\r\n            <p><font color="#ff530a" size="3"><strong><strike><br />\r\n            </strike></strong><strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strike><br />\r\n            About us&nbsp;</font><br />\r\n            <font color="#5e5d5d" size="3">Leading, free open-source solution</font></p>\r\n            <p>公司拥有领先的技术和经验，目前是引领该行业的先锋企业。经过不断的试验，努力的改正错误，我们的客户在过去的几年逐步的增长。上海腾岩信息科技有限公司是一家专注互联网技术服务的高新科技公司，公司成立以来已经在众多领域取得了骄人的成绩，同时我们与国际、国内众多ISP服务商、软件开发商及IT服务企业结为战略联盟和合作伙伴。</p>\r\n            <img alt="" src="/upload/layout/1299730481.gif" /><br />\r\n            <p>腾岩科技的服务范围包括：互联网基础应用、网站建设、企事业信息管理系统、数据库开发、B/S软件研发等。</p>\r\n            <p>我们的互联网技术服务范围已经涵盖互联网所涉及的全部服务与技术支持，如域名注册、企业邮局、邮件群发、网站空间、数据库、服务器租用托管业务、网站建设、营运咨询、管理维护等等。</p>\r\n            </td>\r\n            <td valign="top" width="50%" align="left">\r\n            <p><font color="#ff530a" size="3"><strong><strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strike><br />\r\n            </strong>Features&nbsp;</font><br />\r\n            <font color="#424242" size="3"><font color="#5e5d5d">We&nbsp; most useful and common modules.</font> </font></p>\r\n            <p>腾岩科技专注以互联网领域的信息技术服务为公司的主要发展之路,使用户在享受信息科技发展最新成果的同时不断获得最大的收益。 一个能从别人的观念来看事情，能了解别人心灵活的人，永远不必为自己的前途担心。</p>\r\n            <p>公司拥有领先的技术和经验，目前是引领该行业的先锋企业。经过不断的试验，努力的改正错误，我们的客户在过去的几年逐步的增长。上海腾岩信息科技有限公司是一家专注互联网技术服务的高新科技公司，公司成立以来已经在众多领域取得了骄人的成绩，同时我们与国际、国内众多ISP服务商、软件开发商及IT服务企业结为战略联盟和合作伙伴。</p>\r\n            <p><img alt="" src="/upload/layout/1299750695.gif" /></p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>');
INSERT INTO `pageset` VALUES (9, 1, '中文CEO''s Message页面', '', '', '', '', '公司以发展、责任为公司的核心理念，以倡导环境和谐幸福，打造最具品质的生活为不懈追求的目标。永恒的品质可以无视时间的痕迹，在品质的历程上一线之隔就可以把成功与失败更替。今天的人们，已经非常了解自我的需求，其价值不在于每天的享用，更在于永久的魅力。我们深知，只有品质才是永恒弥久的信念。<br />\r\n<br />\r\n面对激烈的市场竟争环境，始终坚持求新求变，不断发展的经营的基本思想，主动实行前瞻性的战略转变。正是凭借着一大批艰苦创业、敬业开拓、团结奋进创造出一个又一个的佳绩，形成了自己独特的文化理念和经营管理方式。专业历程，打造着中高档品牌的典范，见证了中国信息产业的发展历程，见证并推动了中国信息行业的技术成长之路。<br />\r\n<br />\r\n今天，全新的创意与永久的品质使其脱颖而出，成为时代的新偶像。品质先，创新先，共赢先。真诚希望与国内外友人依托信息科技产业, 携手共创世界的幸福明天。公司以发展、责任为公司的核心理念，以倡导环境和谐幸福，打造最具品质的生活为不懈追求的目标。永恒的品质可以无视时间的痕迹，在品质的历程上一线之隔就可以把成功与失败更替。<br />\r\n<br />');
INSERT INTO `pageset` VALUES (10, 1, '中文Contact us页面', '', '', '', '', '<table border="0" cellspacing="0" cellpadding="0" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td><img alt="" width="697" height="357" src="/inc/pics/map.gif" /></td>\r\n        </tr>\r\n        <tr>\r\n            <td>上海腾岩信息科技有限公司 版权所有<br />\r\n            电话: (+86) 21-8759 1678<br />\r\n            传真: (+86) 21-8759 4888<br />\r\n            E-mai: <a class="link_03" href=" mailto:alex@ty-sh.com">alex@ty-sh.com</a><br />\r\n            Web: <span lang="EN-US"><a class="link_03" href=" http://www.ty-sh.com/">www.ty-sh.com</a></span><br />\r\n            Add: No.8, Taichang Road,Shanghai, China</td>\r\n        </tr>\r\n        <!--p if($setinfo[mapcode]!=&acute;&acute;)-->\r\n        <tr>\r\n            <td><!--p echo $setinfo[mapcode]--></td>\r\n        </tr>\r\n        <!--p -->\r\n    </tbody>\r\n</table>');
INSERT INTO `pageset` VALUES (11, 1, '中文Our factory页面', '', '', '', '', '<table border="0" cellspacing="8" cellpadding="8" width="100%">\r\n    <tbody>\r\n        <tr>\r\n            <td valign="top" width="50%" align="left">\r\n            <p><font color="#ff530a" size="3"><strong><strike><input src="/upload/layout/1301123680.jpg" type="image" longdesc="undefined" /><br />\r\n            </strike></strong><strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strike><br />\r\n            About us&nbsp;</font><br />\r\n            <font color="#5e5d5d" size="3">Leading, free open-source solution</font></p>\r\n            <p>Tengyan&nbsp;is a market leader. It&rsquo;s been awarded a CMS of the year 2007, 2008 and won a Hall of Fame Award in the 2009 being the Best Open Source PHP CMS.<br />\r\n            Tengyan&nbsp;has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources</p>\r\n            <br />\r\n            <img alt="" src="/upload/layout/1299730481.gif" /><br />\r\n            <p>Tengyan&nbsp;has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions&nbsp;Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n            </td>\r\n            <td valign="top" width="50%" align="left">\r\n            <p><font color="#ff530a" size="3"><strong><strike>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strike><br />\r\n            </strong>Features&nbsp;</font><br />\r\n            <font color="#424242" size="3"><font color="#5e5d5d">We&nbsp; most useful and common modules.</font> </font></p>\r\n            <p>With Tengyan, we&acute;ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard.</p>\r\n            <p>Set up user roles and permissions. Assign Manager, Employee or Admin role with ease. Decide what content is available to whom.Support for multiple-language websites. Enjoy clean, user and search engine friendly URLs. Other SEO friendly features are inside too: Titles, Internal Link Structure, Meta Tags.There are absolutely no restriction on how your site looks like. Create very unique, custom theme.<br />\r\n            <img alt="" src="/upload/layout/1301123865.jpg" /></p>\r\n            </td>\r\n        </tr>\r\n    </tbody>\r\n</table>');

-- --------------------------------------------------------

-- 
-- 表的结构 `pagesetpic`
-- 

CREATE TABLE `pagesetpic` (
  `id_pagesetpic` int(11) NOT NULL auto_increment,
  `id_pageset` int(11) NOT NULL,
  `id_hr` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `intro` text NOT NULL,
  `url` varchar(250) NOT NULL,
  `opicname` varchar(250) NOT NULL,
  `spicname` varchar(250) NOT NULL,
  `dele` int(1) NOT NULL default '1',
  `type` varchar(3) NOT NULL,
  `indate` datetime NOT NULL,
  `modate` datetime NOT NULL,
  `deldate` datetime NOT NULL,
  `browsecount` int(11) NOT NULL,
  PRIMARY KEY  (`id_pagesetpic`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- 
-- 导出表中的数据 `pagesetpic`
-- 

INSERT INTO `pagesetpic` VALUES (5, 2, 57, '', '', '', '1299750695.gif', '', 1, 'GIF', '2011-03-10 17:51:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `pagesetpic` VALUES (3, 2, 57, '', '', '', '1299730481.gif', '', 1, 'GIF', '2011-03-10 12:14:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `pagesetpic` VALUES (7, 3, 57, '', '', '', '1299904822.jpg', '', 1, 'JPG', '2011-03-12 12:40:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `pagesetpic` VALUES (13, 6, 1, '', '', '', '1301123680.jpg', '', 1, 'JPG', '2011-03-26 15:14:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `pagesetpic` VALUES (14, 6, 1, '', '', '', '1301123865.jpg', '', 1, 'JPG', '2011-03-26 15:17:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `pavy1`
-- 

CREATE TABLE `pavy1` (
  `id_pavy1` int(11) NOT NULL auto_increment,
  `id_hr` int(11) NOT NULL,
  `lang` int(1) NOT NULL default '1',
  `product_visit` int(1) NOT NULL default '0',
  `store_visit` int(1) NOT NULL default '0',
  `news_visit` int(1) NOT NULL default '0',
  `hr_visit` int(1) NOT NULL default '0',
  `pavy_visit` int(1) NOT NULL default '0',
  `data_visit` int(1) NOT NULL default '0',
  `siteset_visit` int(1) NOT NULL default '0',
  `level` int(1) NOT NULL default '0',
  `indate` datetime NOT NULL,
  `modate` datetime NOT NULL,
  `deldate` datetime NOT NULL,
  PRIMARY KEY  (`id_pavy1`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

-- 
-- 导出表中的数据 `pavy1`
-- 

INSERT INTO `pavy1` VALUES (28, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

-- 
-- 表的结构 `pavy2`
-- 

CREATE TABLE `pavy2` (
  `id_pvay2` int(11) NOT NULL auto_increment,
  `id_hr` int(11) NOT NULL,
  `id_backmenu` int(11) NOT NULL,
  `lang` int(1) NOT NULL default '1',
  `browseprem` int(1) NOT NULL default '0',
  `addprem` int(1) NOT NULL default '0',
  `editprem` int(1) NOT NULL default '0',
  `deleprem` int(1) NOT NULL default '0',
  `display` int(1) NOT NULL default '1',
  `level` int(1) NOT NULL default '0',
  `state` int(1) NOT NULL default '1',
  `indate` datetime NOT NULL,
  `modate` datetime NOT NULL,
  `deldate` datetime NOT NULL,
  PRIMARY KEY  (`id_pvay2`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=264 ;

-- 
-- 导出表中的数据 `pavy2`
-- 

INSERT INTO `pavy2` VALUES (246, 1, 46, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (245, 1, 41, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (244, 1, 39, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (243, 1, 22, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (242, 1, 21, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (241, 1, 20, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (240, 1, 19, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (239, 1, 18, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (238, 1, 17, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (237, 1, 16, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (236, 1, 15, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (235, 1, 47, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (234, 1, 8, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (233, 1, 9, 1, 1, 1, 1, 1, 1, 0, 1, '2011-01-29 18:08:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (263, 1, 49, 1, 1, 1, 1, 1, 1, 0, 1, '2012-02-26 20:27:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `pavy2` VALUES (247, 1, 48, 1, 1, 1, 1, 1, 1, 0, 1, '2011-03-09 16:42:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

-- 
-- 表的结构 `post`
-- 

CREATE TABLE `post` (
  `id_post` int(11) NOT NULL auto_increment,
  `post` varchar(25) NOT NULL,
  `lang` int(1) NOT NULL default '1',
  PRIMARY KEY  (`id_post`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- 
-- 导出表中的数据 `post`
-- 

INSERT INTO `post` VALUES (1, '普通员工', 1);
INSERT INTO `post` VALUES (2, '物料收发员', 1);
INSERT INTO `post` VALUES (3, 'IQC', 1);
INSERT INTO `post` VALUES (4, '仓库主管', 1);
INSERT INTO `post` VALUES (5, '采购主管', 1);
INSERT INTO `post` VALUES (6, '销售主管', 1);
INSERT INTO `post` VALUES (7, '副总经理', 1);
INSERT INTO `post` VALUES (8, '总经理', 1);
INSERT INTO `post` VALUES (9, '网站管理员', 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `productdir`
-- 

CREATE TABLE `productdir` (
  `id_proddir` int(11) NOT NULL auto_increment,
  `lang` int(1) NOT NULL,
  `name` varchar(50) NOT NULL default '1',
  `intro` text NOT NULL,
  `dele` int(1) NOT NULL default '1',
  `dirurl` varchar(50) NOT NULL,
  `fatherid` int(11) NOT NULL,
  `level` int(1) NOT NULL,
  `ordernum` int(11) NOT NULL,
  PRIMARY KEY  (`id_proddir`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

-- 
-- 导出表中的数据 `productdir`
-- 

INSERT INTO `productdir` VALUES (1, 0, 'Auto electronic3232', 'Tengyan, we''ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard.\n', 1, '', 0, 1, 0);
INSERT INTO `productdir` VALUES (2, 0, 'Project electronics', ' and straightforward admin dashboard. Tengyan, we''ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate', 1, '', 0, 1, 2);
INSERT INTO `productdir` VALUES (3, 0, 'Household electrical', ' that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard. Tengyan, we''ve added many', 1, '', 0, 1, 3);
INSERT INTO `productdir` VALUES (4, 0, 'Art lighting', 'straightforward admin dashboard. Tengyan, we''ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and ', 1, '', 0, 1, 4);
INSERT INTO `productdir` VALUES (5, 1, 'Air controller', ' Easy to navigate and straightforward admin dashboard. Tengyan, we&acute;ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic.', 1, '', 1, 2, 5);
INSERT INTO `productdir` VALUES (6, 0, 'Auto module', ' that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard. Tengyan, we''ve added many', 1, '', 3, 2, 6);
INSERT INTO `productdir` VALUES (7, 0, 'Auto motor', 'to navigate and straightforward admin dashboard. Tengyan, we''ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic.', 1, '', 1, 2, 7);
INSERT INTO `productdir` VALUES (8, 0, 'Brushless controllers', 'dashboard. Tengyan, we''ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin ', 1, '', 3, 2, 8);
INSERT INTO `productdir` VALUES (9, 0, 'Driver module', 'straightforward admin dashboard. Tengyan, we''ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and ', 1, '', 1, 2, 9);
INSERT INTO `productdir` VALUES (10, 0, 'Sensor', 'admin dashboard. Tengyan, we''ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and ', 1, '', 1, 2, 10);
INSERT INTO `productdir` VALUES (11, 0, 'IVIS', ' we''ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and ', 1, '', 1, 2, 11);
INSERT INTO `productdir` VALUES (12, 0, 'HVAC', '/Delete/Change  Easy to navigate and straightforward admin dashboard. Tengyan, we''ve added many that we believe are essential to build modern, usable and functional websites.Createcontent with ease. Manage page structure.Tengyan admin interface is no more problematic.', 1, '', 2, 2, 12);
INSERT INTO `productdir` VALUES (13, 0, 'Quality control', 'that we believe are essential to build modern, usable and functional websites.Cr Easy to navigate and straightforward admin dashboard. Tengyan, we''ve added many eate/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic.', 1, '', 2, 2, 13);
INSERT INTO `productdir` VALUES (14, 0, 'Humidity measure', ' usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard. Tengyan, we''ve added many that we believe are essential to build modern,', 1, '', 2, 2, 14);
INSERT INTO `productdir` VALUES (15, 0, 'DC electric machine', 'usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard. Tengyan, we''ve added many that we believe are essential to build modern, ', 1, '', 2, 2, 15);
INSERT INTO `productdir` VALUES (16, 0, 'Non-contact thermometer', 'admin dashboard. Tengyan, we''ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward ', 1, '', 3, 2, 16);
INSERT INTO `productdir` VALUES (17, 0, 'Floodlight', 'many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard. Tengyan, we''ve added ', 1, '', 4, 2, 17);
INSERT INTO `productdir` VALUES (18, 0, 'Art lighting outsite', 'added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard. Tengyan, we''ve ', 1, '', 4, 2, 18);
INSERT INTO `productdir` VALUES (19, 0, 'Art lighting inside', 'to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard. Tengyan, we''ve added many that we believe are essential ', 1, '', 4, 2, 19);
INSERT INTO `productdir` VALUES (20, 1, '机械设备', '\n网站采用的技术是PHP语言+MYSQL数据库，可在WINDOWS，LINUX，UNIX，CENTOS多种服务器上跨平台运行。\n', 1, '', 0, 1, 11);
INSERT INTO `productdir` VALUES (21, 1, '工程机械', '腾岩科技为您量身定做各类网站，会根据您的需求和您公司的特色，为您订制特色网站。\n \n', 1, '', 20, 2, 0);
INSERT INTO `productdir` VALUES (22, 1, '产品类一', '腾岩科技为您量身定做各类网站，会根据您的需求和您公司的特色，为您订制特色网站。\n\n', 1, '', 0, 1, 9);
INSERT INTO `productdir` VALUES (23, 1, '家电品牌', '网站整体结构策划及企业形象设计；\n→基础服务: 个性化主页及频道栏目设计（包含公司简介、产品介绍、用户反馈、联系我们）；\n', 1, '', 0, 1, 23);
INSERT INTO `productdir` VALUES (24, 1, '照明灯光', '→ 网站功能：新闻管理系统、产品管理系统、后台用户管理、招聘管理系统、权限系统、数据库备份、广告管理、版面管理、支持SEO优化、', 1, '', 0, 1, 24);
INSERT INTO `productdir` VALUES (27, 1, '电子灯光', '每个新闻和每个产品页面可自定义SEO搜索标签、前台邮件反馈系统、支持第三方统计代码、网站防拷贝、支持GOOGLE地图。\n', 1, '', 24, 2, 0);
INSERT INTO `productdir` VALUES (28, 1, '电子芯片', '网站采用的技术是PHP语言+MYSQL数据库，可在WINDOWS，LINUX，UNIX，CENTOS多种服务器上跨平台运行。\n', 1, '', 22, 2, 34);
INSERT INTO `productdir` VALUES (29, 1, '家电项目', '→ 精美页面10页，超出部分按100元/页收费（产品介绍页面的产品条目不得超过50）；\n', 1, '', 23, 2, 0);
INSERT INTO `productdir` VALUES (30, 1, '电子工程', '网站采用的技术是PHP语言+MYSQL数据库，可在WINDOWS，LINUX，UNIX，CENTOS多种服务器上跨平台运行。网站采用的技术是PHP语言+MYSQL数据库，可在WINDOWS，LINUX，UNIX，CENTOS多种服务器上跨平台运行。\n', 1, '', 20, 2, 30);
INSERT INTO `productdir` VALUES (31, 0, 'hhh', '', 0, '', 0, 1, 31);

-- --------------------------------------------------------

-- 
-- 表的结构 `productinfo`
-- 

CREATE TABLE `productinfo` (
  `id_prodinfo` int(11) NOT NULL auto_increment,
  `id_proddir` int(11) NOT NULL,
  `id_hr` int(11) NOT NULL,
  `lang` int(1) NOT NULL default '1',
  `title` varchar(250) NOT NULL,
  `intro` text NOT NULL,
  `content` longtext NOT NULL,
  `tag` text NOT NULL,
  `dele` int(1) NOT NULL default '1',
  `isnew` int(1) NOT NULL default '1',
  `indate` datetime NOT NULL,
  `modate` datetime NOT NULL,
  `deldate` datetime NOT NULL,
  `browsecount` int(11) NOT NULL,
  PRIMARY KEY  (`id_prodinfo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

-- 
-- 导出表中的数据 `productinfo`
-- 

INSERT INTO `productinfo` VALUES (15, 6, 0, 1, 'costly licensing fees or risk of vendor lock-in. ', 'costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.', '<p>Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>', '', 1, 1, '2011-01-19 18:55:05', '2011-03-24 10:19:13', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (16, 6, 0, 1, 'Content Management System available today.', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\n\r\n', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />', '', 1, 1, '2011-01-19 19:12:53', '2011-03-24 10:18:46', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (17, 6, 0, 1, 'Tengyan has no costly licensing fees or risk ', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\n', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />', '', 1, 1, '2011-01-19 19:17:55', '2011-03-24 10:18:20', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (18, 6, 0, 1, 'This ensures a huge range of free', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.<br />', '', 1, 1, '2011-01-19 19:22:07', '2011-03-24 10:17:58', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (19, 15, 0, 1, 'It can significantly reduce total project ', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n\r\n', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.<br />\r\n<br />', '', 1, 1, '2011-01-21 14:20:11', '2011-03-24 10:17:36', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (20, 29, 0, 1, 'Tengyan has no costly licensing fees or risk of vendor lock-in.11', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\n<br />\r\nTengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\n<br />', '', 1, 1, '2011-01-21 14:23:04', '2012-02-28 15:26:41', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (21, 28, 0, 1, 'Tengyan has a massive developers community ', 'Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n\r\n', 'Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.<br />\r\n<br />', '', 1, 1, '2011-01-21 14:30:37', '2012-02-28 15:22:44', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (22, 28, 0, 1, 'There are absolutely no restriction on how your site looks like.', 'Set up user roles and permissions. Assign Manager, Employee or Admin role with ease. Decide what content is available to whom.Support for multiple-language websites. Enjoy clean, user and search engine friendly URLs. Other SEO friendly features are inside too: Titles, Internal Link Structure, Meta Tags.There are absolutely no restriction on how your site looks like. Create very unique, custom theme.\r\n', 'Set up user roles and permissions. Assign Manager, Employee or Admin role with ease. Decide what content is available to whom.Support for multiple-language websites. Enjoy clean, user and search engine friendly URLs. Other SEO friendly features are inside too: Titles, Internal Link Structure, Meta Tags.There are absolutely no restriction on how your site looks like. Create very unique, custom theme.<br />', '', 1, 1, '2011-01-21 14:34:06', '2012-02-28 15:22:36', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (27, 21, 0, 1, '腾岩科技为您量身定做各类网站', '腾岩科技为您量身定做各类网站，会根据您的需求和您公司的特色，为您订制特色网站。\r\n\r\n网站采用的技术是PHP语言+MYSQL数据库，可在WINDOWS，LINUX，UNIX，CENTOS多种服务器上跨平台运行。\r\n', '腾岩科技为您量身定做各类网站，会根据您的需求和您公司的特色，为您订制特色网站。<br />\r\n<br />\r\n网站采用的技术是PHP语言+MYSQL数据库，可在WINDOWS，LINUX，UNIX，CENTOS多种服务器上跨平台运行。<br />\r\n<br />\r\n网站整体结构策划及企业形象设计；<br />\r\n&rarr;基础服务: 个性化主页及频道栏目设计（包含公司简介、产品介绍、用户反馈、联系我们）；<br />\r\n&rarr; 精美页面10页，超出部分按100元/页收费（产品介绍页面的产品条目不得超过50）；<br />\r\n&rarr; 网站功能：新闻管理系统、产品管理系统、后台用户管理、招聘管理系统、权限系统、数据库备份、广告管理、版面管理、支持SEO优化、每个新闻和每个产品页面可自定义SEO搜索标签、前台邮件反馈系统、支持第三方统计代码、网站防拷贝、支持GOOGLE地图。<br />\r\n<br />\r\n详细功能可参考我们的DEMO演示站点:<br />\r\n<a class="link_navi" href="http://demo-1.vicp.net:8080/">http://demo-1.vicp.net:8080/</a><br />\r\n<a class="link_navi" href="http://demo-2.vicp.net:8080/">http://demo-2.vicp.net:8080/</a>', '', 1, 1, '2012-02-28 14:14:26', '2012-02-28 14:15:31', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (24, 29, 0, 1, 'Tengyan has no costly licensing fees or risk of vendor lock-in', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\n', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.', '', 1, 1, '2011-01-21 14:42:10', '2012-02-28 15:22:28', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (25, 27, 0, 1, 'Tengyan is a market leader', 'Tengyan is a market leader. It’s been awarded a CMS of the year 2007, 2008 and won a Hall of Fame Award in the 2009 being the Best Open Source PHP CMS.\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources', 'Tengyan is a market leader. It&rsquo;s been awarded a CMS of the year 2007, 2008 and won a Hall of Fame Award in the 2009 being the Best Open Source PHP CMS. Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources', '', 1, 1, '2011-01-21 14:45:46', '2012-02-28 15:22:18', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (26, 29, 0, 1, 'Create/Delete/Change content with ease', 'With Tengyan, we''ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard.', '<p>With Tengyan, we''ve added many that we believe are essential to build modern, usable and functional websites.Create/Delete/Change content with ease. Manage page structure.Tengyan admin interface is no more problematic. Easy to navigate and straightforward admin dashboard.</p>\r\n<p>Set up user roles and permissions. Assign Manager, Employee or Admin role with ease. Decide what content is available to whom.Support for multiple-language websites. Enjoy clean, user and search engine friendly URLs. Other SEO friendly features are inside too: Titles, Internal Link Structure, Meta Tags.There are absolutely no restriction on how your site looks like. Create very unique, custom theme.</p>', '111', 1, 1, '2011-01-21 14:48:05', '2012-02-28 15:22:07', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (37, 5, 0, 1, '测试产品1', '产品介绍', '<p>产品介绍1</p>', '111111', 0, 1, '2013-04-18 16:59:54', '2013-04-18 17:01:38', '2013-04-18 17:02:23', 0);
INSERT INTO `productinfo` VALUES (38, 30, 0, 1, '石栏犀利眼品牌电动车摩托车专用LED照明灯', '', '<p><span style="font-size: 16px;"><img alt="" src="http://www.sl138.com/uploadfile/20130426/20130426015744701.jpg" /><br />\r\n<br />\r\n2013年5月新品</span></p>\r\n<p><span style="font-size: 16px;">石栏犀利眼品牌电动车摩托车专用LED照明灯</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size: 16px;">电动车摩托车灯光升级三种选择、效果分析及推荐指数：</span></p>\r\n<p><span style="font-size: 16px;">（1）安装石栏增光器或选择高瓦数的灯泡。效果及问题：已经是老式保守型的方法，而且耗电厉害，亮度提升少。价钱：50元-80元左右。</span></p>\r\n<p><span style="font-size: 16px;">&nbsp;&nbsp;&nbsp; 推荐指数：★☆ 属不推荐行列。</span></p>\r\n<p><span style="font-size: 16px;">（2）安装HID氙气灯。效果及问题：比较新潮见效的方法，电动车和个别的摩托车大灯塑料耐温性能不高，安装HID后容易导致前大灯出现老化及龟裂现象，而且耗电也不低，电瓶容量少的摩托车，特别是电动车根本用不上。市场价：100元-200元。</span></p>\r\n<p><span style="font-size: 16px;">&nbsp;&nbsp;&nbsp; 推荐指数：★★☆ 属可使用范围。</span></p>\r\n<p><span style="font-size: 16px;">（3）选择安装石栏电动车摩托车专用LED照明灯。最新科技发明，节能省电，而且LED亮度高，功效高，发热小，用电低，光线穿透能力强，整体美观，铝合金外壳实在，车用防水设计放心实用，价钱低.市场价：80元到150元。</span></p>\r\n<p><span style="font-size: 16px;">&nbsp;&nbsp;&nbsp; 推荐指数：★★★★☆ 属极度推荐系列。</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size: 16px;">市场适用范围及产品前景：</span></p>\r\n<p><span style="font-size: 16px;">&nbsp;&nbsp;&nbsp; 针对市面上电动车摩托车前大灯照明亮度极，严重影响个人自身行驶安全，适应道路照明要求，而普通国产的电动车及摩托车普遍大灯塑料质量偏差，不耐高温而研发的新产品。可替代HID氙气灯用于所有市面上的摩托车及电动车使用，市场前景广阔，适用范围广，而且产品价钱适中，适合市场大力推广使用。部分SUV越野型汽车也可固定在前保险杠上使用。</span></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size: 16px;">领先优势：</span></p>\r\n<p><span style="font-size: 16px;">&middot;全面防水设计，不怕雨淋水洗；</span></p>\r\n<p><span style="font-size: 16px;">&middot;超高亮度，最高可达1500流明；</span></p>\r\n<p><span style="font-size: 16px;">&middot;美国进口原装CREE科税U2蕊片，寿命长达20000小时以上；</span></p>\r\n<p><span style="font-size: 16px;">&middot;最新节能科技，7W相当于35W传统灯泡的数倍亮度；</span></p>\r\n<p><span style="font-size: 16px;">&middot;日光色6000K色温，射程长达500米以上；</span></p>\r\n<p><span style="font-size: 16px;">&middot;专门针对电动车宽电压设计，支持6V-60V的电压输入；</span></p>\r\n<p><span style="font-size: 16px;">&middot;全铝反光杯及全铝外壳，耐高温，全方位散热高效保障；</span></p>\r\n<p><span style="font-size: 16px;">&middot;加强加厚支架，安装极方便，长久稳定耐用；</span></p>\r\n<p><br />\r\n<span style="font-size: 16px;">电动车专用LED照明灯参数：</span></p>\r\n<p><span style="font-size: 16px;">产品型号：LED-200<br />\r\n产品尺寸：2.0寸反射灯罩<br />\r\n产品类型：内置式+超强散热座<br />\r\n输出亮度：远光1500流明，近光700流明<br />\r\n输出功率：远光15W，近光7W<br />\r\n输出色温：6000K-8000K 超白光<br />\r\n适用电压：DC8-60V</span></p>\r\n<p><span style="font-size: 16px;"><br />\r\n产品特性：<br />\r\n&middot;超高亮度设计，与原车灯光强大的对比性，极大方便晚上出行安全；<br />\r\n&middot;远射型，远近光双亮度设计，适合道路交通规则及行车习惯；<br />\r\n&middot;大灯内置式安装方式，与原车灯无缝相接；<br />\r\n&middot;内外双重散热功能，超大散热座，长时间使用无担忧；<br />\r\n&middot;防水设计，可适合于车内车外使用；<br />\r\n&middot;铝合金外壳+铝合金反光杯，可令你无忧使用10年以上。</span></p>\r\n<p><span style="font-size: 16px;">产品适用范围：</span></p>\r\n<p><span style="font-size: 16px;">&nbsp;&nbsp;&nbsp; 所有电动车、电动三轮车、电瓶差及发电不良摩托车、汽车前保险杠射灯、倒车灯、狩猎灯、工程灯、矿山灯等特种照明。</span></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size: 16px;">让电动车不再摸黑回家！</span></p>', '', 1, 1, '2013-06-13 17:16:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (29, 21, 0, 1, 'costly licensing fees or risk of vendor lock-in. ', 'costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.', '<p>Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.</p>\r\n<p>Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.</p>', '', 1, 1, '2011-01-19 18:55:05', '2012-02-28 15:21:43', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (30, 6, 0, 1, 'Content Management System available today.', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\n\r\n', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />', '', 1, 1, '2011-01-19 19:12:53', '2011-03-24 10:18:46', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (31, 6, 0, 1, 'Tengyan has no costly licensing fees or risk ', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\n', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />', '', 1, 1, '2011-01-19 19:17:55', '2011-03-24 10:18:20', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (32, 6, 0, 1, 'This ensures a huge range of free', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.<br />', '', 1, 1, '2011-01-19 19:22:07', '2011-03-24 10:17:58', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (33, 15, 0, 1, 'It can significantly reduce total project ', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n\r\n', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\nTengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.<br />\r\n<br />', '', 1, 1, '2011-01-21 14:20:11', '2011-03-24 10:17:36', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (34, 15, 0, 1, 'Tengyan has no costly licensing fees or risk of vendor lock-in.', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.', 'Tengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\n<br />\r\nTengyan has no costly licensing fees or risk of vendor lock-in. It can significantly reduce total project integration costs.Thanks to a huge library of free extensions Tengyan has become the most powerful, robust and extensible Content Management System available today.<br />\r\n<br />', '', 1, 1, '2011-01-21 14:23:04', '2011-03-24 10:17:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (35, 29, 0, 1, 'Tengyan has a massive developers community ', 'Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.\r\n\r\n', 'Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.Tengyan has a massive developers community (more than 2000 members). This ensures a huge range of free, professional and high quality resources.<br />\r\n<br />', '', 1, 1, '2011-01-21 14:30:37', '2012-02-28 15:27:11', '0000-00-00 00:00:00', 0);
INSERT INTO `productinfo` VALUES (36, 21, 0, 1, 'There are absolutely no restriction on how your site looks like.', 'Set up user roles and permissions. Assign Manager, Employee or Admin role with ease. Decide what content is available to whom.Support for multiple-language websites. Enjoy clean, user and search engine friendly URLs. Other SEO friendly features are inside too: Titles, Internal Link Structure, Meta Tags.There are absolutely no restriction on how your site looks like. Create very unique, custom theme.\r\n', 'Set up user roles and permissions. Assign Manager, Employee or Admin role with ease. Decide what content is available to whom.Support for multiple-language websites. Enjoy clean, user and search engine friendly URLs. Other SEO friendly features are inside too: Titles, Internal Link Structure, Meta Tags.There are absolutely no restriction on how your site looks like. Create very unique, custom theme.<br />', '', 1, 1, '2011-01-21 14:34:06', '2012-02-28 15:22:53', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `productpic`
-- 

CREATE TABLE `productpic` (
  `id_prodpic` int(11) NOT NULL auto_increment,
  `id_prodinfo` int(11) NOT NULL,
  `id_hr` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `intro` text NOT NULL,
  `url` varchar(250) NOT NULL,
  `opicname` varchar(250) NOT NULL,
  `spicname` varchar(250) NOT NULL,
  `dele` int(1) NOT NULL default '1',
  `type` varchar(3) NOT NULL,
  `indate` datetime NOT NULL,
  `modate` datetime NOT NULL,
  `deldate` datetime NOT NULL,
  `browsecount` int(11) NOT NULL,
  PRIMARY KEY  (`id_prodpic`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

-- 
-- 导出表中的数据 `productpic`
-- 

INSERT INTO `productpic` VALUES (9, 26, 1, '', '', '', '1300605818.jpg', '', 1, 'JPG', '2011-03-20 15:23:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (22, 26, 1, '', '', '', '1301039408.jpg', '', 1, 'JPG', '2011-03-25 15:50:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (12, 25, 1, '', '', '', '1300936450.jpg', '', 1, 'JPG', '2011-03-24 11:14:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (13, 24, 1, '', '', '', '1300936554.jpg', '', 1, 'JPG', '2011-03-24 11:15:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (14, 22, 1, '', '', '', '1300936760.jpg', '', 1, 'JPG', '2011-03-24 11:19:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (15, 21, 1, '', '', '', '1300936968.jpg', '', 1, 'JPG', '2011-03-24 11:22:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (16, 19, 1, '', '', '', '1300950669.jpg', '', 1, 'JPG', '2011-03-24 15:11:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (17, 18, 1, '', '', '', '1300950773.jpg', '', 1, 'JPG', '2011-03-24 15:12:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (18, 17, 1, '', '', '', '1300950816.jpg', '', 1, 'JPG', '2011-03-24 15:13:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (19, 16, 1, '', '', '', '1300950846.jpg', '', 1, 'JPG', '2011-03-24 15:14:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (20, 15, 1, '', '', '', '1300950883.jpg', '', 1, 'JPG', '2011-03-24 15:14:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (35, 20, 1, '', '', '', '1330413988.pdf', '', 1, 'PDF', '2012-02-28 15:26:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (23, 26, 1, '', '', '', '1301124652.pdf', '', 1, 'PDF', '2011-03-26 15:30:52', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (24, 21, 1, '', '', '', '1301124987.pdf', '', 1, 'PDF', '2011-03-26 15:36:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (25, 18, 1, '', '', '', '1301124997.pdf', '', 1, 'PDF', '2011-03-26 15:36:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (34, 20, 1, '', '', '', '1330413973.jpg', '', 1, 'JPG', '2012-02-28 15:26:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (32, 27, 1, '', '', '', '1330413842.jpg', '', 1, 'JPG', '2012-02-28 15:23:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (28, 28, 1, '', '', '', '1330409858.jpg', '', 1, 'JPG', '2012-02-28 14:17:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (29, 28, 1, '', '', '', '1330409862.jpg', '', 1, 'JPG', '2012-02-28 14:17:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (30, 29, 1, '', '', '', '1330413710.jpg', '', 1, 'JPG', '2012-02-28 15:21:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (31, 36, 1, '', '', '', '1330413794.jpg', '', 1, 'JPG', '2012-02-28 15:23:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (36, 35, 1, '', '', '', '1330414023.jpg', '', 1, 'JPG', '2012-02-28 15:27:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (37, 35, 1, '', '', '', '1330414027.pdf', '', 1, 'PDF', '2012-02-28 15:27:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (38, 34, 1, '', '', '', '1330678984.jpg', '', 1, 'JPG', '2012-03-02 17:03:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (39, 30, 1, '', '', '', '1330679003.jpg', '', 1, 'JPG', '2012-03-02 17:03:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (40, 31, 1, '', '', '', '1330679027.jpg', '', 1, 'JPG', '2012-03-02 17:03:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (41, 33, 1, '', '', '', '1330679059.jpg', '', 1, 'JPG', '2012-03-02 17:04:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (42, 32, 1, '', '', '', '1330679115.jpg', '', 1, 'JPG', '2012-03-02 17:05:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (44, 28, 1, 'g', 'gg', 'g', '1345606957.jpg', '', 1, 'JPG', '2012-08-22 11:42:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);
INSERT INTO `productpic` VALUES (45, 37, 1, '时间表', '123', '', '1366275686.pdf', '', 1, 'PDF', '2013-04-18 17:01:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `siteset`
-- 

CREATE TABLE `siteset` (
  `id_siteset` int(11) NOT NULL auto_increment,
  `lang` int(1) NOT NULL default '1',
  `title` text NOT NULL,
  `keywords` text NOT NULL,
  `description` text NOT NULL,
  `otherheader` text NOT NULL,
  `iscopy` int(1) NOT NULL default '0',
  `rmailbox` varchar(50) NOT NULL,
  `smailbox` varchar(50) NOT NULL,
  `smailboxpass` varchar(50) NOT NULL,
  `icp` varchar(25) NOT NULL,
  `mapcode` text NOT NULL,
  `statistics` text NOT NULL,
  `isstyle` varchar(8) NOT NULL,
  PRIMARY KEY  (`id_siteset`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `siteset`
-- 

INSERT INTO `siteset` VALUES (1, 1, 'Breastmilk storage bags,Heal Bruises oil, Microwave Steam Sterilizer Bags manufacturer supplier exporter in China', 'Breastmilk storage bags,Heal Bruises oil, Microwave Steam Sterilizer Bags manufacturer supplier exporter in China', 'Breastmilk storage bags,Heal Bruises oil, Microwave Steam Sterilizer Bags manufacturer supplier exporter in China', '', 0, 'arhu.wu@gmail.com', '', '', '', '', '', '绿色');

-- --------------------------------------------------------

-- 
-- 表的结构 `title`
-- 

CREATE TABLE `title` (
  `id_title` int(11) NOT NULL auto_increment,
  `title` varchar(25) NOT NULL,
  `lang` int(1) NOT NULL default '1',
  PRIMARY KEY  (`id_title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- 
-- 导出表中的数据 `title`
-- 

INSERT INTO `title` VALUES (15, 'q', 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `webmenu`
-- 

CREATE TABLE `webmenu` (
  `id_webmenu` int(11) NOT NULL auto_increment,
  `lang` int(1) NOT NULL default '1',
  `name` varchar(25) NOT NULL,
  `url` text NOT NULL,
  `dele` int(1) NOT NULL default '1',
  `fatherid` int(11) NOT NULL,
  `level` int(1) NOT NULL,
  `ordernum` int(11) NOT NULL,
  PRIMARY KEY  (`id_webmenu`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

-- 
-- 导出表中的数据 `webmenu`
-- 

INSERT INTO `webmenu` VALUES (1, 1, '网站首页----HOME', '/', 1, 0, 1, 8);
INSERT INTO `webmenu` VALUES (2, 1, '关于我们----About us', '/about/aboutus.php', 1, 0, 1, 7);
INSERT INTO `webmenu` VALUES (3, 1, '产品中心----Products', '/product/products.php', 1, 0, 1, 6);
INSERT INTO `webmenu` VALUES (4, 1, '新闻中心----News', '/news/news.php', 1, 0, 1, 5);
INSERT INTO `webmenu` VALUES (5, 1, '联系我们----Contact us', '/contactus/contactus.php', 1, 0, 1, 4);
INSERT INTO `webmenu` VALUES (11, 1, '公司介绍----Introduction', '/about/intro.php', 1, 2, 2, 0);
INSERT INTO `webmenu` VALUES (12, 1, '关于我们----About us', '/about/aboutus.php', 1, 2, 2, 0);
INSERT INTO `webmenu` VALUES (13, 1, '总经理致辞----CEO''s Message', '/about/ceomessage.php', 1, 2, 2, 0);
INSERT INTO `webmenu` VALUES (14, 1, '产品中心----Products', '/product/products.php', 1, 3, 2, 0);
INSERT INTO `webmenu` VALUES (15, 1, '资料下载----PDF download', '/product/productpdf.php', 1, 3, 2, 0);
INSERT INTO `webmenu` VALUES (16, 1, '我们的工厂----Our factory', '/product/ourfactory.php', 1, 3, 2, 0);
INSERT INTO `webmenu` VALUES (17, 1, '公司新闻----Company news', '/news/companynews.php', 1, 4, 2, 0);
INSERT INTO `webmenu` VALUES (18, 1, '产品新闻----Product news', '/news/productnews.php', 1, 4, 2, 0);
INSERT INTO `webmenu` VALUES (19, 1, '加入我们----Join us', '/news/joinus.php', 1, 4, 2, 0);
