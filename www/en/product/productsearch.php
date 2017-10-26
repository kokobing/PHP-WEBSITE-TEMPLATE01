<?php
require "../inc/config.php";
require "../inc/function.class.php";
require "../inc/pagenav.class.php";



if($_POST[searchcontent]!=''){
//page_content 内容
$intRows = 10;
//产品
$strSQLNum = "SELECT COUNT(*) as num from productinfo  where  dele=1 and title like '%".$_POST[searchcontent]."%' ";   
$rs = $objDB->Execute($strSQLNum);
$arrNum = $objDB->fields();
$intTotalNum=$arrNum["num"];

$objPage = new PageNav($intCurPage,$intTotalNum,$intRows);

$objPage->setvar($arrParam);
$objPage->init_page($intRows ,$intTotalNum);
$strNavigate = $objPage->output(1);
$intStartNum=$objPage->StartNum(); 

$strSQL = "select * from productinfo  where dele=1 and title like '%".$_POST[searchcontent]."%'  order by id_prodinfo desc" ;
$objDB->SelectLimit($strSQL,$intRows,$intStartNum);
$arrprods=$objDB->GetRows();
}


//取最后一条新闻，放入左侧NEWS中
$strSQL = "select title,newsdate,id_newsdir,id_newsinfo from newsinfo where id_newsdir='3' or id_newsdir='4' order by newsdate desc limit 1" ;
$objDB->Execute($strSQL);
$adv_A7=$objDB->fields();

//页面右上角广告
$strSQL = "select a.intro,b.opicname as pic from layout as a left join layoutpic as b
 on a.id_layout=b.id_layout  where a.id_layout='10' order by b.id_layoutpic desc limit 1" ;
$objDB->Execute($strSQL);
$adv_B1=$objDB->fields();

//页面左侧广告A1
$strSQL = "select a.intro,b.opicname as pic from layout as a left join layoutpic as b
 on a.id_layout=b.id_layout  where a.id_layout='11' order by b.id_layoutpic desc limit 1" ;
$objDB->Execute($strSQL);
$adv_B2=$objDB->fields();

//页面左侧广告A2
$strSQL = "select a.intro,b.opicname as pic from layout as a left join layoutpic as b
 on a.id_layout=b.id_layout  where a.id_layout='12' order by b.id_layoutpic desc limit 1" ;
$objDB->Execute($strSQL);
$adv_B3=$objDB->fields();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="<?php echo $setinfo[keywords];?>" />
<meta name="description" content="<?php echo $setinfo[description];?>" />

<title><?php echo $setinfo[title];?></title>
<link href="../inc/css/css1.css" rel="stylesheet" type="text/css">
<script src="../inc/js/stmenu.js" type="text/javascript"></script>
<script src="../inc/js/jquery.js" type="text/javascript"></script>
<?php if($setinfo[iscopy]=='1'){?>
<script language="JavaScript">
document.oncontextmenu=new Function("event.returnValue=false;");
document.onselectstart=new Function("event.returnValue=false;");
</script>
<?php }?>
<?php if($setinfo[otherheader]!=''){echo $setinfo[otherheader];}?>
<style type="text/css">
<!--
#header_other{float: left;margin-top:3px;width:100%;height:5px; font-size:4px; background-image:url(/inc/pics/<?=$stylebg2;?>)} 
#inner_contenttop{margin-left:-1px;margin-top:-3px;float: left;width:965px;height:38px;position:relative; z-index:98;;background-image:url(/inc/pics/<?=$stylebg;?>) }
.txt_02 {font-size: 8pt;color:<?=$stylecolor;?>;text-decoration: underline;text-align:left;}
.link_04_1 {font-size: 10pt;font-weight: normal;;color:<?=$stylecolor;?>;text-decoration: underline;;text-align:left;}
a.link_04_1:hover {font-size: 10pt;font-weight: normal;color: <?=$stylecolor;?>;text-decoration: underline;}
.txt_03 {font-size: 8pt;color:<?=$stylecolor;?>;text-align:left;text-decoration: none; font-weight:bold}
-->
</style>
</head>
<body>

<? require "../header.php"; ?>

<div id="contain">
<div id="mainbg">

<!--box!-->
<div class="RoundedCorner" style="width:965px; margin-top:-3px"> 
<b class="rtop"><b class="r3"></b></b> 
<!--box content!-->
<div id="inner_content">

<div id="inner_contenttop"></div>

<div id="inner_contentinner">
<div id="inner_contentinner_left">
<div id="inner_contentinner_left1"><img src="../inc/pics/products01.gif" width="203" height="87" /></div>
<div id="inner_contentinner_left2"><? require "leftmenu.php"; ?></div>
<div id="inner_contentinner_left3news01"><img src="../inc/pics/news01.gif" /></div>
<div id="inner_contentinner_left3news02">
<div id="inner_contentinner_left3news02u" class="txt_01">
<p>

<a href="/en/news/<?php 
if($adv_A7[id_newsdir]=='3')
{echo 'companynews';}
if($adv_A7[id_newsdir]=='4')
{echo 'productnews';}
?>.php?id=<?php echo $adv_A7[id_newsinfo];?>" class="link_03"><?php echo cutstr($adv_A7[title],20,1);?></a><br>
<?php echo $adv_A7[newsdate];?></p>
</div>
<div id="inner_contentinner_left3news02d"><img src="../upload/layout/<?php echo $adv_B2[pic];?>" width="148" height="62" /></div>
</div>
<div id="inner_contentinner_left3news03"><img src="../inc/pics/news02.gif" /></div>

<div id="inner_contentinner_left3news04"><img src="../upload/layout/<?php echo $adv_B3[pic];?>" width="159" height="121" /></div>
</div>

<div id="inner_contentinner_right">
<div id="#inner_contentinner_right1">
<div id="inner_contentinner_right1L">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="txt">
  <tr>
    <td height="30" align="left" class="txt_01"> Home &gt;Products &gt; <span class="txt_02">Product search</span></td>
  </tr>
  <tr>
    <td height="120"><img src="../inc/pics/productsearch.gif" width="355" height="76" /></td>
  </tr>
</table>
</div>
<div id="inner_contentinner_right1R"><img src="../upload/layout/<?php echo $adv_B1[pic];?>" /></div>
</div>

<div id="inner_contentinner_right2">
<div id="inner_contentinner_right2L"><span  style="cursor:pointer"  onclick="needsendmail();"><img src="../inc/pics/icon010.gif" /></span></div>
<div id="inner_contentinner_right2R"><span style="cursor:pointer" onclick="window.print();"><img src="../inc/pics/icon011.gif" /></span></div>
</div>

<div id="inner_contentinner_right3" class='txt'>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <?php for($i=0;$i<sizeof($arrprods);$i++){
  $strSQL = "select opicname as pic from productpic  where id_prodinfo ='".$arrprods[$i][id_prodinfo]."' order by id_prodpic asc limit 1" ;
  $objDB->Execute($strSQL);
  $arronepic=$objDB->fields();
  
  $strSQL = "select opicname as pdf from productpic  where id_prodinfo ='".$arrprods[$i][id_prodinfo]."' and type='PDF' order by id_prodpic asc limit 1" ;
  $objDB->Execute($strSQL);
  $arronepdf=$objDB->fields();
  
  ?>
    <tr>
      <td width="21%" height="140" align="center" valign="top"><a href="productsinfo.php?pid=<?php echo $arrprods[$i][id_prodinfo]?>" class="txt"><img src="../upload/product/<?php echo $arronepic[pic]?>" width="136" border="0" /></a></td>
      <td width="79%" align="left" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="txt">
        <tr>
          <td><a href="productsinfo.php?pid=<?php echo $arrprods[$i][id_prodinfo]?>" class="txt"><?php echo $arrprods[$i][title]?></a></td>
        </tr>
        <tr>
          <td class="link_03"><?php echo $arrprods[$i][intro]?></td>
        </tr>
        <tr>
          <td align="right"><a href="../upload/product/<?php echo $arronepdf[pdf]?>" target="_blank"><img src="../inc/pics/adobe.gif" width="21" height="15" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td style="padding:0; height:1px;" colspan="2" bgcolor="#F5F5F5"></td>
      </tr>
    <? }?>  
        <tr>
      <td height="30"  colspan="2" align="center" valign="middle"><?php echo $strNavigate;?></td>
      </tr>
  </table>
</div>

</div>
</div>

</div>



<!--box end content!-->
<b class="rbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b> 
</div> 
<!--boxend!-->



</div>
</div>


<? require "../footer.php"; ?>



</body>
</html>
