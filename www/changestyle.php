<?php
require "./inc/config.php";

if($_REQUEST["style"]==1){
$strSQL="UPDATE siteset SET isstyle='橙色' where id_siteset='1'";
$objDB->Execute($strSQL);
}

if($_REQUEST["style"]==2){
$strSQL="UPDATE siteset SET isstyle='红色' where id_siteset='1'";
$objDB->Execute($strSQL);
}

if($_REQUEST["style"]==3){
$strSQL="UPDATE siteset SET isstyle='绿色' where id_siteset='1'";
$objDB->Execute($strSQL);
}


echo '<img src="/inc/pics/ch'.$_REQUEST["style"].'.gif" border="0" />';

?>