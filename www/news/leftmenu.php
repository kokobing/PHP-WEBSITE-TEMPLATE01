<?php
$c_filename = end(explode('/',$_SERVER["PHP_SELF"])); //当前文件名
 //取出二级级目录信息
$strSQL="SELECT id_newsdir,name FROM newsdir WHERE level='2' and dele='1' and fatherid='15' order by ordernum ASC";
$objDB->Execute($strSQL);
$arrnewsdir2=$objDB->GetRows();
?>
<table width="180" border="0" align="center" cellpadding="3" cellspacing="3" class="txt">
<? for($i=0;$i<sizeof($arrnewsdir2);$i++){?>
  <tr>
    <td><a href="/news/news.php?id=<?=$arrnewsdir2[$i][id_newsdir]?>" <?php if($_GET[id]==$arrnewsdir2[$i][id_newsdir]){echo 'class="link_04_1"';}else{echo 'class="link_04"';} ?> ><?=$arrnewsdir2[$i][name]?></a></td>
  </tr>
<? }?>
</table>

