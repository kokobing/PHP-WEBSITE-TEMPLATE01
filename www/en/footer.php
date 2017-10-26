<?php
//页脚
$strSQL = "select content from layout  where id_layout='19'" ;
$objDB->Execute($strSQL);
$adv_fotter=$objDB->fields();
?>
<div id="footer">
<div id="footer_txt"><?php echo $adv_fotter[content];?></div>
<div id=footer_style><a href="javascript:void(0)" onclick='$(this).load("/changestyle.php?style=1", function() { window.location.reload();});'><img src="/inc/pics/ch1.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)"  onclick='$(this).load("/changestyle.php?style=2", function() { window.location.reload();});'><img src="/inc/pics/ch2.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)"   onclick='$(this).load("/changestyle.php?style=3", function() { window.location.reload();});'><img src="/inc/pics/ch3.gif" border="0" /></a> </div>
</div>
<?php echo $setinfo[statistics];?>

              <!-- JiaThis Button BEGIN -->
<script type="text/javascript" src="http://v2.jiathis.com/code/jiathis_r.js?move=0&amp;btn=r4.gif" charset="utf-8"></script>
<!-- JiaThis Button END -->
             
