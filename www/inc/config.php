<?php
session_start();
require_once("mysql.class.php");

$db_hostname="localhost"; 
$db_username="root";  
$db_password="123456";
$db_database="moban1"; 
$prefix="tysh_";

  

$objDB=new mysql($db_hostname,$db_username,$db_password,$db_database);
mysql_query("SET NAMES utf8"); 
mysql_query("set sql_mode=''"); 

$strSQL = "select iscopy,otherheader,title,keywords,description,icp,mapcode,statistics,isstyle from siteset where id_siteset=1" ;
$objDB->Execute($strSQL);
$setinfo=$objDB->fields();

//LOGO
$strSQL = "select opicname as pic from  layoutpic  where id_layout='20' order by id_layoutpic asc limit 3" ;
$objDB->Execute($strSQL);
$adv_logo=$objDB->getrows();

//风格
if($setinfo[isstyle]=='橙色'){$stylecolor='#FFC51A';$stylebg='menubg01.gif';$stylebg2='bg0001.gif';$stylebg3='search02.gif';$stylebg4='icon008.gif';$stylelogo=$adv_logo[0][pic];$stylebg5='#FF510C';}
if($setinfo[isstyle]=='红色'){$stylecolor='#980000';$stylebg='menubg02.gif';$stylebg2='bg0002.gif';$stylebg3='search02_2.gif';$stylebg4='icon008_2.gif';$stylelogo=$adv_logo[1][pic];$stylebg5='#C4190F';}
if($setinfo[isstyle]=='绿色'){$stylecolor='#78BC27';$stylebg='menubg03.gif';$stylebg2='bg0003.gif';$stylebg3='search02_3.gif';$stylebg4='icon008_3.gif';$stylelogo=$adv_logo[2][pic];$stylebg5='#B8CD04';}

?>