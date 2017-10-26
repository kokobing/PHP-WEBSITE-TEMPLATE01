<?php
$c_filename = end(explode('/',$_SERVER["PHP_SELF"])); //当前文件名
?>
<table width="150" border="0" align="center" cellpadding="3" cellspacing="3" class="txt">
  <tr>
    <td><a href="intro.php" <?php if($c_filename=='intro.php'){echo 'class="link_04_1"';}else{echo 'class="link_04"';} ?> >公司介绍</a></td>
  </tr>
  <tr>
    <td><a href="aboutus.php" <?php if($c_filename=='aboutus.php'){echo 'class="link_04_1"';}else{echo 'class="link_04"';} ?>>关于我们</a></td>
  </tr>
  <tr>
    <td><a href="ceomessage.php" <?php if($c_filename=='ceomessage.php'){echo 'class="link_04_1"';}else{echo 'class="link_04"';} ?>>总经理致辞</a></td>
  </tr>
</table>