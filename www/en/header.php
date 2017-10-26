<?php
//页脚
$strSQL = "select opicname as pic from  layoutpic  where id_layout='20' order by id_layoutpic desc limit 1" ;
$objDB->Execute($strSQL);
$adv_logo=$objDB->fields();

//WEBMENU 1 级目录
$strSQL = "select id_webmenu,name,url from  webmenu  where level='1' and dele='1' order by ordernum  desc" ;
$objDB->Execute($strSQL);
$arrmenu1=$objDB->getrows();
?>
<div id="header">
<div id="header_main">
<div id="header1">
<div id="header1_left">

<script type="text/javascript">
<!--
stm_bm(["/inc/pics/menu0b0f",900,"","/inc/pics/blank.gif",0,"","",0,0,250,0,1000,1,0,0,"","815",0,0,1,2,"hand","hand","",1,25],this);
stm_bp("p0",[0,4,0,0,0,0,0,0,100,"",-2,"",-2,50,0,0,"#999999","#fff","",3,0,0,"#CCCCCC"]);
stm_ai("p0i0",[2,"","/upload/layout/<?php echo $stylelogo;?>","/upload/layout/<?php echo $stylelogo;?>",196,72,0,"/","_self","","","","",0,0,0,"","",0,0,0,1,1,"#2D5809",1,"#B5BED6",1,"/inc/pics/menu1-1.gif","/inc/pics/menu1-2.gif",3,3,0,0,"#CCCCCC","#CCCCCC","#FFFFFF","#FFFFFF","13pt 'Arial','Verdana'","13pt 'Arial','Verdana'",0,0,"","","","",0,0,0],115,74);
stm_aix("p0i1","p0i0",[0,"<? $arrmenu1_ch=explode("----",$arrmenu1[0][name]);echo $arrmenu1_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu1[0][url];?>","_self","","","","",0,0,0,"","",0,0,0,1,1,"#498E11",1,"<?=$stylecolor;?>",0,"/inc/pics/menu3-1.gif","/inc/pics/menu3-2.gif",3,3,0,0,"#CCCCCC","#CCCCCC","#6E6767","#ffffff","12pt Arial","12pt Arial"],115,74);
stm_bp("p1",[0,4,-196,2,0,0,965,0,100,"",-2,"",-2,70,0,0,"#999999","transparent","/inc/pics/<?=$stylebg;?>",0,0,0,"#034EA2"]);
stm_aix("p1i0","p0i0",[2,"","","",-1,-1,0,"","_self","","","/inc/pics/<?=$stylebg;?>","/inc/pics/<?=$stylebg;?>",965,38,0,"","",0,0,0,0,1,"#FFFFF7",1,"#DEDEDE",1,"","",3,3,0,0,"#FFFFF7","#000000","#3C1400","#3C1400","9pt Arial","9pt Arial"],965,38);
stm_ep();
stm_aix("p0i2","p0i0",[0,"|","","",-1,-1,0,"","_self","","","","",0,0,0,"","",0,0,0,1,1,"#FFFFF7",1,"#B5BED6",1,"","",3,3,0,0,"#FFFFF7","#000000","#DDDDDD","#DDDDDD","10pt Arial","10pt Arial"],10,74);
stm_aix("p0i3","p0i1",[0,"<? $arrmenu1_ch=explode("----",$arrmenu1[1][name]);echo $arrmenu1_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu1[1][url];?>"],115,74);
<?
//WEBMENU 2 级目录
$strSQL = "select id_webmenu,name,url from  webmenu  where level='2' and dele='1' and fatherid='".$arrmenu1[1][id_webmenu]."' order by ordernum  desc" ;
$objDB->Execute($strSQL);
$arrmenu2=$objDB->getrows();
?>
stm_bpx("p2","p1",[0,4,-321,2,0,0,5]);
stm_aix("p2i0","p1i0",[0,"","","",-1,-1,0,"","_self","","","","",5,5],321,38);
stm_aix("p2i1","p0i0",[0,"  <? $arrmenu2_ch=explode("----",$arrmenu2[0][name]);echo $arrmenu2_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu2[0][url];?>","_self","","","","",5,5,0,"","",0,0,0,0,1,"#FFFFF7",1,"<?=$stylebg5;?>",0,"","",3,3,0,0,"#FFFFF7","#000000","#ffffff","#FFFFFF","bold 9pt Arial","bold 9pt Arial"],84,38);
stm_aix("p2i2","p2i1",[0,"  <? $arrmenu2_ch=explode("----",$arrmenu2[1][name]);echo $arrmenu2_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu2[1][url];?>"],80,38);
stm_aix("p2i3","p2i1",[0,"<? $arrmenu2_ch=explode("----",$arrmenu2[2][name]);echo $arrmenu2_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu2[2][url];?>"],110,38);
stm_aix("p2i4","p2i0",[],370,38);
stm_ep();
<?
//WEBMENU 2 级目录
$strSQL = "select id_webmenu,name,url from  webmenu  where level='2' and dele='1' and fatherid='".$arrmenu1[2][id_webmenu]."' order by ordernum  desc" ;
$objDB->Execute($strSQL);
$arrmenu2=$objDB->getrows();
?>
stm_aix("p0i4","p0i2",[],10,74);
stm_aix("p0i5","p0i1",[0,"<? $arrmenu1_ch=explode("----",$arrmenu1[2][name]);echo $arrmenu1_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu1[2][url];?>"],115,74);
stm_bpx("p3","p2",[0,4,-446]);
stm_aix("p3i0","p2i0",[0,"","","",-1,-1,0,"#"],446,38);
stm_aix("p3i1","p2i1",[0,"     <? $arrmenu2_ch=explode("----",$arrmenu2[0][name]);echo $arrmenu2_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu2[0][url];?>"],65,38);
stm_aix("p3i2","p2i1",[0,"     <? $arrmenu2_ch=explode("----",$arrmenu2[1][name]);echo $arrmenu2_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu2[1][url];?>"],100,38);
stm_aix("p3i3","p2i1",[0," <? $arrmenu2_ch=explode("----",$arrmenu2[2][name]);echo $arrmenu2_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu2[2][url];?>"],100,38);
stm_aix("p3i4","p3i0",[],264,38);

<?
//WEBMENU 2 级目录
$strSQL = "select id_webmenu,name,url from  webmenu  where level='2' and dele='1' and fatherid='".$arrmenu1[3][id_webmenu]."' order by ordernum  desc" ;
$objDB->Execute($strSQL);
$arrmenu2=$objDB->getrows();
?>
stm_ep();
stm_aix("p0i6","p0i2",[],10,74);
stm_aix("p0i7","p0i1",[0,"<? $arrmenu1_ch=explode("----",$arrmenu1[3][name]);echo $arrmenu1_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu1[3][url];?>"],115,74);
stm_bpx("p4","p2",[0,4,-571]);
stm_aix("p4i0","p3i0",[],571,38);
stm_aix("p4i1","p2i1",[0,"   <? $arrmenu2_ch=explode("----",$arrmenu2[0][name]);echo $arrmenu2_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu2[0][url];?>"],100,38);
stm_aix("p4i2","p2i1",[0,"   <? $arrmenu2_ch=explode("----",$arrmenu2[1][name]);echo $arrmenu2_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu2[1][url];?>"],100,38);
stm_aix("p4i3","p2i1",[0,"   <? $arrmenu2_ch=explode("----",$arrmenu2[2][name]);echo $arrmenu2_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu2[2][url];?>"],70,38);
stm_aix("p4i4","p3i0",[],124,38);
stm_ep();

stm_aix("p0i8","p0i2",[],10,74);
stm_aix("p0i9","p0i1",[0,"<? $arrmenu1_ch=explode("----",$arrmenu1[4][name]);echo $arrmenu1_ch[1];?>","","",-1,-1,0,"/en<?=$arrmenu1[4][url];?>"],115,74);
stm_bpx("p5","p1",[0,4,-696]);
stm_aix("p5i0","p1i0",[],965,38);
stm_ep();
stm_ep();
stm_em();
//-->
</script>

</div>
<div id="header1_right">
<div id="headerlang"><img src="/inc/pics/ch.gif" /> <a href="/" class="link_lang">中文</a>   <img src="/inc/pics/en.gif" /> <a href="/en/" class="link_lang">English</a></div>
<div id="search">
<div id="searchtxt" style="width:120px; height:19px; float:left">
<form action="/product/productsearch.php" method="post" name="searchform" onsubmit="">
<label>
<input type="text" class="txt" name="searchcontent" id="searchcontent"  />
</label>
</form>
</div>
<div id="btn"><a href="javascript:document.searchform.submit();"><span><img src="/inc/pics/search02.gif" style="border:0" alt="搜索一下"/></span></a></div>
</div>

</div>
</div>

</div>
</div>

<div id="header_other"></div>