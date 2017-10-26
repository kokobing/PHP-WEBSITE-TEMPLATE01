<?php
$c_filename = end(explode('/',$_SERVER["PHP_SELF"])); //当前文件名
?>
<table width="180" border="0" align="center" cellpadding="3" cellspacing="3" class="txt">
  <tr>
    <td><a href="/en/news/news.php?id=3" <?php if($_GET[id]=='3'){echo 'class="link_04_1"';}else{echo 'class="link_04"';} ?> >Company news</a></td>
  </tr>
  
  <tr>
    <td><a href="/en/news/news.php?id=4" <?php if($_GET[id]=='4'){echo 'class="link_04_1"';}else{echo 'class="link_04"';} ?>>Product news</a></td>
  </tr>
  <tr>
    <td><a href="/en/news/news.php?id=7" <?php if($_GET[id]=='7'){echo 'class="link_04_1"';}else{echo 'class="link_04"';} ?>>Join us</a></td>
  </tr>
</table>

