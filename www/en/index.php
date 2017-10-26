<?php
require "../inc/config.php";
require "../inc/function.class.php";

//首页三栏广告
$strSQL = "select a.intro,b.opicname as pic from layout as a left join layoutpic as b
 on a.id_layout=b.id_layout  where a.id_layout='1' order by b.id_layoutpic desc limit 3" ;
$objDB->Execute($strSQL);
$adv_A1=$objDB->GetRows();
$adv_A1_title=explode("|",$adv_A1[0][intro]);     //分割出标题

//首页通栏栏广告
$strSQL = "select opicname as pic from  layoutpic where id_layout='2' order by id_layoutpic desc limit 1" ;
$objDB->Execute($strSQL);
$adv_A2=$objDB->fields();

//首页左下角广告
$strSQL = "select a.intro,a.url,b.opicname as pic from layout as a left join layoutpic as b
 on a.id_layout=b.id_layout  where a.id_layout='3' order by b.id_layoutpic desc limit 1" ;
$objDB->Execute($strSQL);
$adv_A3=$objDB->fields();

//首页下居中广告A
$strSQL = "select a.content,a.url,b.opicname as pic from layout as a left join layoutpic as b
 on a.id_layout=b.id_layout  where a.id_layout='4' order by b.id_layoutpic desc limit 1" ;
$objDB->Execute($strSQL);
$adv_A4=$objDB->fields();

//首页下居中广告B
$strSQL = "select a.content,a.url,b.opicname as pic from layout as a left join layoutpic as b
 on a.id_layout=b.id_layout  where a.id_layout='5' order by b.id_layoutpic desc limit 1" ;
$objDB->Execute($strSQL);
$adv_A5=$objDB->fields();

//首页右下NEWS图片
$strSQL = "select opicname as pic from  layoutpic 
  where id_layout='6' order by id_layoutpic desc limit 1" ;
$objDB->Execute($strSQL);
$adv_A6=$objDB->fields();

//取最后一条新闻，放入首页右下NEWS中
$strSQL = "select title,newsdate,id_newsdir,id_newsinfo from newsinfo where id_newsdir='3' or id_newsdir='4' order by newsdate desc limit 1" ;
$objDB->Execute($strSQL);
$adv_A7=$objDB->fields();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="<?php echo $setinfo[keywords];?>" />
<meta name="description" content="<?php echo $setinfo[description];?>" />
<title><?php echo $setinfo[title];?></title>
<link href="../inc/css/css1.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../inc/js/stmenu.js"></script>
<script src="../inc/js/jquery.js" type="text/javascript"></script>

<script type="text/javascript">
function changetopstyle(tag){
		var tag = tag; 
		var mypic=new Array();
		mypic[1]='<?php echo $adv_A1[0][pic];?>';
		mypic[2]='<?php echo $adv_A1[1][pic];?>';
		mypic[3]='<?php echo $adv_A1[2][pic];?>';
		for(i=1;i<4;i++){
			if(i==tag){
				$("#content_right"+i).css({"background-image":"url(../inc/pics/<?=$stylebg4;?>)","background-repeat":"no-repeat","border-bottom":"none"}); 
				$("#content_righttxt"+i).css({"font-size":"10pt","color":"#FC7A0C"}); 
				$("#content_left").html('<img src="/upload/layout/'+mypic[i]+'" />');  
			}else{
				$("#content_right"+i).css({"background-image":"none","border-bottom":"1px solid #ccc"});
				$("#content_righttxt"+i).css({"font-size":"8pt","color":"#949494"}); 
			}
		}
 }
 
</script>
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
#content_right1{ margin-left:15px;float: left;width:150px;height:77px;border-bottom:1px solid #ccc; background-image:url(/inc/pics/<?=$stylebg4;?>);background-repeat:no-repeat;  }
-->
</style>
</head>
<body>

<? require "header.php"; ?>

<div id="contain">
<div id="mainbg">

<!--box!-->
<div class="RoundedCorner" style="width:965px; margin-top:-3px"> 
<b class="rtop"><b class="r3"></b></b> 
<!--box content!-->
<div id="content">
<div id="content_left"><img src="/upload/layout/<?php echo $adv_A1[0][pic];?>" /></div>

<div id="content_right">
<div id="content_right1"  style="cursor:pointer" onclick="changetopstyle(1);"><div id="content_righttxt1"><?php echo $adv_A1_title[0];?></div></div>
<div id="content_right2"  style="cursor:pointer" onclick="changetopstyle(2);"><div id="content_righttxt2"><?php echo $adv_A1_title[1];?></div></div>
<div id="content_right3"  style="cursor:pointer" onclick="changetopstyle(3);"><div id="content_righttxt3"><?php echo $adv_A1_title[2];?></div></div>
</div>

<div id="content2"><img src="/upload/layout/<?php echo $adv_A2[pic];?>" width="960" height="105" /></div>

<div id="content3">
  <div id="content3_l">
  <div id="content3_l1">
  <div id="content3_l1l"><img src="/upload/layout/<?php echo $adv_A3[pic];?>" width="171" height="150" /></div>
  <div id="content3_l1r" class='txt_01'><img src="/inc/pics/icon001.gif" /><br /><br />
<?php echo $adv_A3[intro];?>  <a href="<?php echo $adv_A3[url];?>" class="link_noline"><img src="/inc/pics/icon002.gif" border="0"/></a>
  </div>
  </div>
   <div id="content3_l2">
   <div id="content3_l2u"><table width="310" border="0" cellpadding="2" cellspacing="2" class="txt_01">
  <tr>
    <td width="61" height="61"><img src="/upload/layout/<?php echo $adv_A4[pic];?>" width="61" height="61" /></td>
    <td align="left" valign="top">
	<?php if ($adv_A4[url]=="") {echo $adv_A4[content]; }else{?>
	<a href="<?php echo $adv_A4[url];?>" class="link_noline"><?php echo $adv_A4[content];?></a>
	 <?php }?></td>
  </tr>
</table>
</div>
   <div id="content3_l2d"><table width="310" border="0" cellpadding="2" cellspacing="2" class="txt_01">
  <tr>
    <td width="61" height="61"><img src="/upload/layout/<?php echo $adv_A5[pic];?>" width="61" height="61" /></td>
    <td align="left" valign="top"><?php if ($adv_A5[url]=="") {echo $adv_A5[content]; }else{?>
	<a href="<?php echo $adv_A5[url];?>" class="link_noline"><?php echo $adv_A5[content];?></a>
	 <?php }?></td>
  </tr>
</table>
   </div>
   </div>
  </div>
  <div id="content3_r">
  <div id="content3_r_news01"><img src="/inc/pics/news01.gif" /></div>
<div id="content3_r_news02">
<div id="content3_r_news02u" class="txt_01">
<p>

<a href="/en/news/newspage.php?id=<?=$adv_A7[id_newsdir];?>&newsid=<?php echo $adv_A7[id_newsinfo];?>" class="link_03"><?php echo cutstr($adv_A7[title],16,1);?></a><br>
<?php echo $adv_A7[newsdate];?></p>
</div>
<div id="content3_r_news02d"><img src="/upload/layout/<?php echo $adv_A6[pic];?>" width="148" height="62" /></div>
</div>
 <div id="content3_r_news03"><img src="/inc/pics/news02.gif" /></div>
 </div>
</div>

</div>



<!--box end content!-->
<b class="rbottom"><b class="r4"></b><b class="r3"></b><b class="r2"></b><b class="r1"></b></b> 
</div> 
<!--boxend!-->



</div>
</div>


<? require "footer.php"; ?>



</body>
</html>
