<?php
session_start();
require_once("mysql.class.php");
/*
$db_hostname="localhost"; 
$db_username="koko";  
$db_password="a0525260"; 
$db_database="koko"; 
$prefix="tysh_";




*/

$db_hostname="localhost"; 
$db_username="root";  
$db_password="a0525260"; 
$db_database="email"; 
$prefix="tysh_";

  

$objDB=new mysql($db_hostname,$db_username,$db_password,$db_database);
mysql_query("SET NAMES utf8"); 

$strSQL = "select * from sheet1 " ;
$objDB->Execute($strSQL);
$setinfo=$objDB->getrows();


for($i=0;$i<sizeof($setinfo);$i++){ 

$pathemail='D:\\MDAEMON\\Users\\hotmail.com\\'.$setinfo[$i][Abe].'\\';

echo '"'.$setinfo[$i][Abe].'@hotmail.com","'.$setinfo[$i][Abe].'","hotmail.com","'.$setinfo[$i][Abe].'","'.$pathemail.'","qwert",0,0,Y,1,1,0,0,0,0,0,0,0,"","","","25","","RFC822","","","","",0,0,0,0,0,1,1,0,0,0,"","","",1,17'.'<br>';

 }



?>