<?
//此文件用于抽出对应表中文件(图片 PDF)信息 layout.php 等调用
require "config_admin.php";
 //file_put_contents('aa.txt', $upnewsid); 
if(isset($_SESSION["user_id"])){

   $getfilename = end(explode('/',$_REQUEST["getfilename"])); //文件名
   
   $strSQL="select * from ".$_REQUEST["datasheet"]." where opicname= '".$getfilename."'";
   $objDB->Execute($strSQL);
   $getfileinfo=$objDB->fields();
	$arr['getfilename']=$getfilename;//文件名
	$arr['datasheet']=$_REQUEST["datasheet"];//文件所在数据库哪张表
	
	if($_REQUEST["datasheet"]=='layoutpic'){$arr['getfileid']=$getfileinfo[id_layoutpic];}//文件ID
	if($_REQUEST["datasheet"]=='pagesetpic'){$arr['getfileid']=$getfileinfo[id_pagesetpic];}//文件ID
	if($_REQUEST["datasheet"]=='productpic'){$arr['getfileid']=$getfileinfo[id_prodpic];}//文件ID
	if($_REQUEST["datasheet"]=='newspic'){$arr['getfileid']=$getfileinfo[id_newspic];}//文件ID
	
	$arr['getfiletype']=$getfileinfo[type];//文件类型
	$arr['getfiletitle']=$getfileinfo[title];//文件标题
	$arr['getfileintro']=$getfileinfo[intro];//文件简介
	$arr['getfileurl']=$getfileinfo[url];//文件URL
	
	
    $myjson= json_encode($arr);
    echo $myjson;
}

?>