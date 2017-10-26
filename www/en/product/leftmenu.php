<?php
$c_filename = end(explode('/',$_SERVER["PHP_SELF"])); //当前文件名

//取出产品一级目录信息
$strSQL="SELECT id_proddir,name FROM productdir WHERE level='1' and dele='1' and lang='0' order by ordernum ASC";
$objDB->Execute($strSQL);
$arrnewsdir1=$objDB->GetRows();
?>
<table width="180" border="0" align="center" cellpadding="3" cellspacing="3" class="txt">
  <tr>
    <td><a href="products.php" <?php if($c_filename=='products.php'){echo 'class="link_04_1"';}else{echo 'class="link_04"';} ?> >Products</a></td>
  </tr>
  <tr>
    <td><table width="170" border="0" align="right" cellpadding="0" cellspacing="0">
    <?php for($i=0;$i<sizeof($arrnewsdir1);$i++){
	         //取出产品二级级目录信息
	        $strSQL="SELECT id_proddir,name FROM productdir WHERE level='2' and dele='1' and fatherid='".$arrnewsdir1[$i][id_proddir]."' order by ordernum ASC";
	        $objDB->Execute($strSQL);
	        $arrnewsdir2=$objDB->GetRows();
	?>
      <tr>
        <td align="left"  style="cursor:pointer;"><strong>·</strong> <a href="products.php?id1=<?php echo $arrnewsdir1[$i][id_proddir];?>"  <?php if($c_filename=='products.php' && $_GET[id1]==$arrnewsdir1[$i][id_proddir]){echo 'class="link_04_1"';}else{echo 'class="link_04"';} ?>  onClick="ChangeTab(<?php echo $i;?>);"><?php echo $arrnewsdir1[$i][name];?></a></td>
      </tr>
    
      <tr>
        <td align="left">
        <?php if($c_filename=='products.php' && $_GET[id1]==$arrnewsdir1[$i][id_proddir]){?>
        <div id="dir2form<?php echo $i;?>"  style="display:yes;">
        <?php }else{?>
        <div id="dir2form<?php echo $i;?>"  style="display:none;">
        <?php }?>
        <table width="160" border="0" align="right" cellpadding="0" cellspacing="0">
           <?php for($j=0;$j<sizeof($arrnewsdir2);$j++){?>              
          <tr>
            <td> - <a href="products.php?id1=<?php echo $arrnewsdir1[$i][id_proddir];?>&id2=<?php echo $arrnewsdir2[$j][id_proddir];?>"  <?php if($c_filename=='products.php' && $_GET[id1]==$arrnewsdir1[$i][id_proddir]  && $_GET[id2]==$arrnewsdir2[$j][id_proddir]){echo 'class="link_04_1"';}else{echo 'class="link_04"';} ?> ><?php echo $arrnewsdir2[$j][name];?></a></td>
          </tr>
          <? }?>
        </table>
        </div>
        </td>
      </tr>
     
    <?php }?>
    </table></td>
  </tr>
  <tr>
    <td><a href="productpdf.php" <?php if($c_filename=='productpdf.php'){echo 'class="link_04_1"';}else{echo 'class="link_04"';} ?>>PDF download</a></td>
  </tr>
  <tr>
    <td><a href="ourfactory.php" <?php if($c_filename=='ourfactory.php'){echo 'class="link_04_1"';}else{echo 'class="link_04"';} ?>>Our factory</a></td>
  </tr>
</table>
<script countryuage="javascript">
	function ChangeTab(tag){
		var tag = tag; 
		var c_form = "dir2form"+tag;
		for(i=0;i<6;i++){
			var tagForm = "dir2form"+i;   
			if(i==tag){
				document.getElementById(tagForm).style.display="block";
			}else{
				document.getElementById(tagForm).style.display="none";
			}
		}
 }
</script>
