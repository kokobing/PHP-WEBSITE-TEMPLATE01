<?php
require "../../inc/config.php";
require "../../inc/function.class.php";
require "../../inc/pagenav.class.php";

//news content
$strSQL = "select * from newsinfo where id_newsinfo='".$_GET[newsid]."'  " ;
$objDB->Execute($strSQL);
$onenews=$objDB->fields();


//news
$strSQL = "select * from newsinfo  where id_newsdir='3' and dele=1 order by id_newsinfo desc limit 4" ;
$objDB->Execute($strSQL);
$arrcompanynews=$objDB->GetRows();

$strSQL = "select * from newsinfo  where id_newsdir='4' and dele=1 order by id_newsinfo desc limit 4" ;
$objDB->Execute($strSQL);
$arrproductnews=$objDB->GetRows();

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
<link href="/inc/css/css1.css" rel="stylesheet" type="text/css">
<script src="/inc/js/stmenu.js" type="text/javascript"></script>
<script src="/inc/js/jquery.js" type="text/javascript"></script>
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
<div id="inner_contentinner_left1"><img src="/inc/pics/news03.gif" width="203" height="87" /></div>
<div id="inner_contentinner_left2"><? require "leftmenu.php"; ?></div>
<div id="inner_contentinner_left3news01"><img src="/inc/pics/news01.gif" /></div>
<div id="inner_contentinner_left3news02">
<div id="inner_contentinner_left3news02u" class="txt_01">
<p>

<a href="<?php 
if($adv_A7[id_newsdir]=='3')
{echo 'companynews';}
if($adv_A7[id_newsdir]=='4')
{echo 'productnews';}
?>.php?id=<?php echo $adv_A7[id_newsinfo];?>" class="link_03"><?php echo cutstr($adv_A7[title],20,1);?></a><br>
<?php echo $adv_A7[newsdate];?></p>
</div>
<div id="inner_contentinner_left3news02d"><img src="/upload/layout/<?php echo $adv_B2[pic];?>" width="148" height="62" /></div>
</div>
<div id="inner_contentinner_left3news03"><img src="/inc/pics/news02.gif" /></div>

<div id="inner_contentinner_left3news04"><img src="/upload/layout/<?php echo $adv_B3[pic];?>" width="159" height="121" /></div>
</div>

<div id="inner_contentinner_right">
<div id="#inner_contentinner_right1">
<div id="inner_contentinner_right1L">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="txt">
  <tr>
    <td height="30" align="left" class="txt_01"> Home &gt;News &gt; <span class="txt_02">News</span></td>
  </tr>
  <tr>
    <td height="120"><img src="/inc/pics/news04.gif" width="355" height="76" /></td>
  </tr>
</table>
</div>
<div id="inner_contentinner_right1R"><img src="/upload/layout/<?php echo $adv_B1[pic];?>" /></div>
</div>

<div id="inner_contentinner_right2">
<div id="inner_contentinner_right2L"><span  style="cursor:pointer"  onclick="needsendmail();"><img src="/inc/pics/icon010.gif" /></span></div>
<div id="inner_contentinner_right2R"><span style="cursor:pointer" onclick="window.print();"><img src="/inc/pics/icon011.gif" /></span></div>
</div>


<div id="inner_contentinner_right_news1" class='txt'>
<div id='inner_contentinner_right_news1L'>
  <table width="255" border="0" cellspacing="1" cellpadding="1" class='txt'>
  <?php for($i=0;$i<sizeof($arrproductnews);$i++){?>
    <tr>
      <td width="70%"><a href="/en/news/newspage.php?id=<?php echo $arrproductnews[$i][id_newsdir];?>&newsid=<?php echo $arrproductnews[$i][id_newsinfo];?>" class="link_04"><?php echo cutstr($arrproductnews[$i][title],30,0);?></a></td>
      <td width="30%" align="right"><?php echo substr($arrproductnews[$i][indate],0,10);?></td>
    </tr>
   <?php }?> 
  </table>
</div>
<div id='inner_contentinner_right_news1R'>
  <table width="255" border="0" cellspacing="1" cellpadding="1" class='txt'>
  <?php for($i=0;$i<sizeof($arrcompanynews);$i++){?>
    <tr>
      <td width="70%"><a href="/en/news/newspage.php?id=<?php echo $arrcompanynews[$i][id_newsdir];?>&newsid=<?php echo $arrcompanynews[$i][id_newsinfo];?>" class="link_04"><?php echo cutstr($arrcompanynews[$i][title],30,0);?></a></td>
      <td width="30%" align="right"><?php echo substr($arrcompanynews[$i][indate],0,10);?></td>
    </tr>
   <?php }?> 
  </table>
</div>
</div>

<div id="inner_contentinner_right3" class='txt'>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><?php if($_GET[id]=='7'){?><strong>JOIN US</strong><?php }else{?><strong>PRODUCT NEWS / COMPANY NEWS</strong><? }?></td>
    </tr>
    <tr>
      <td height="40" valign="bottom">
      <?php if($_GET[id]=='7'){?>
      <table width="300" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="83" align="left" valign="bottom"><img src="/inc/pics/icon0151.gif" width="83" height="30" /></td>
          <td width="83" align="left" valign="bottom">&nbsp;</td>
          <td align="left" valign="bottom">&nbsp;</td>
        </tr>
      </table>
      <?php }else{?>
            <table width="300" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="83" align="left" valign="bottom"><?php if(!isset($_GET[id])|| $_GET[id]==''){?><a href="/en/news/news.php"><img src="/inc/pics/icon012.gif" border="0" /></a><?php }else{?><a href="/en/news/news.php"><img src="/inc/pics/icon0121.gif"  border="0" /></a><?php }?></td>
          <td width="83" align="left" valign="bottom"><?php if(isset($_GET[id])&&$_GET[id]=='4'){?><a href="/en/news/news.php?id=4"><img src="/inc/pics/icon0131.gif"  border="0" /></a><?php }else{?><a href="/en/news/news.php?id=4"><img src="/inc/pics/icon013.gif"  border="0" /></a><? }?></td>
          <td align="left" valign="bottom"><?php if(isset($_GET[id])&&$_GET[id]=='3'){?><a href="/en/news/news.php?id=3"><img src="/inc/pics/icon0141.gif"  border="0" /></a><?php }else{?><a href="/en/news/news.php?id=3"><img src="/inc/pics/icon014.gif" border="0" /></a><? }?></td>
        </tr>
      </table>
      
      <? }?>
      
      </td>
    </tr>
    
    <tr>
      <td><table width="100%" border="0" cellpadding="2" cellspacing="2" class="txt">
         <tr>
           <td height="20" align="center">&nbsp;</td>
         </tr>
         <tr>
          <td height="20" align="center"><strong><?php echo $onenews[title];?></strong></td>
          </tr>
         <tr>
           <td height="20" align="left"><?php echo $onenews[content];?></td>
         </tr>
         <tr>
           <td height="20" align="right"><strong><?php echo substr($onenews[indate],0,10);?></strong></td>
         </tr>
         <tr>
           <td height="50">&nbsp;</td>
         </tr>
      </table></td>
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
