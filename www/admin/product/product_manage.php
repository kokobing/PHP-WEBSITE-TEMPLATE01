<?php 

/*

add 增加空界面 :01表示

add_s 提交入库：02表示

edit 编辑抽取：03表示

edit_s 编辑提交：04表示

del 删除：05表示

action 空动作：06表示

*/

require_once("../inc/config_admin.php");

require_once("../inc/config_perm.php");

require_once("../inc/navipage.php");

require_once("../inc/function.class.php");

require_once("../inc/js/fckeditor/fckeditor.php");//引用fck

	$oFCKeditor = new FCKeditor('newscontent'); 

	$oFCKeditor->BasePath = "../inc/js/fckeditor/" ; 

	$oFCKeditor->ToolbarSet = 'Default' ; 

	$oFCKeditor->Width = '100%' ; 

	$oFCKeditor->Height = '280' ;

$action=$_SERVER["QUERY_STRING"];



  $newstitle=$_POST[newstitle];//产品标题

  $select2=$_POST[select2]; //二级产品目录

  $newscontent=$_POST[newscontent]; //产品内容

  $newsintro=$_POST[intro]; //产品简介

  $newstag=$_POST[tag];

  

  $keywords=$_REQUEST[keywords];

  $searchselect=$_REQUEST[searchselect];

  

  $arrParam[0][name]="searchselect";

  $arrParam[0][value]=$searchselect;

  

  $arrParam[1][name]="keywords";

  $arrParam[1][value]=$keywords;

  

  if($searchselect!=""){

  $str=" and productdir.id_proddir=".$_REQUEST[searchselect]." ";

  }else{

  $str="";

  }

  

  if($keywords!=""){

  $str.=" and productinfo.title like '%".$_REQUEST[keywords]."%' ";

  }else{

  $str.="";

  }





//输出一级目录  

  $strSQL="SELECT id_proddir,name FROM productdir where dele='1' and level='1'";

  $objDB->Execute($strSQL);

  $arr1dir=$objDB->GetRows();



//取出产品产品 start

if(isset($action) && ($action=="" || substr($action,0,14)=='&searchselect=')){

if(isset($_REQUEST["page"]) ){$intCurPage=$_REQUEST["page"];}else{$intCurPage=1;}

$intRows = 15;

$strSQLNum = "SELECT COUNT(*) as num from productinfo left join productdir on productinfo.id_proddir=productdir.id_proddir WHERE productinfo.dele='1' $str";   

$rs = $objDB->Execute($strSQLNum);

$arrNum = $objDB->fields();

$intTotalNum=$arrNum["num"];



$objPage = new PageNav($intCurPage,$intTotalNum,$intRows);



$objPage->setvar($arrParam);

$objPage->init_page($intRows ,$intTotalNum);

$strNavigate = $objPage->output(1);

$intStartNum=$objPage->StartNum(); 



$strSQL = "SELECT productinfo.id_prodinfo,productdir.name,productinfo.title,productinfo.content FROM productinfo left join productdir on productinfo.id_proddir=productdir.id_proddir WHERE productinfo.dele='1' $str order by productinfo.indate DESC" ;

$objDB->SelectLimit($strSQL,$intRows,$intStartNum);

$arrproductinfos=$objDB->GetRows();

$intNews=sizeof($arrproductinfos);

}//取出产品产品 end



//初始化搜索下拉列表

  $strSQL="SELECT id_proddir,name FROM productdir WHERE dele='1' and level='2'";

  $objDB->Execute($strSQL);

  $arr2dirsearch=$objDB->GetRows();



if(isset($action) && $action=="01" && $onuserperm_addprem=='1'){//添加动作存在时初始目录



  $gselect1dir='<select name="select1" class="input_01" id="select1">';

  for($i=0;$i<sizeof($arr1dir);$i++){

  if($arr1dir[$i][id_proddir]=='1'){

     $gselect1dir.='<option value="'.$arr1dir[$i][id_proddir].'"selected"'.'">'.$arr1dir[$i][name].'</option>';

    }else{$gselect1dir.='<option value="'.$arr1dir[$i][id_proddir].'">'.$arr1dir[$i][name].'</option>';}

  }

  $gselect1dir.='</select>';



//初始二级目录  

  $strSQL="SELECT id_proddir,name FROM productdir WHERE fatherid='1' and dele='1' and level='2'";

  $objDB->Execute($strSQL);

  $arr2dir=$objDB->GetRows();



  $gselect2dir='<select name="select2" class="input_01" id="select2">';

  for($i=0;$i<sizeof($arr2dir);$i++){

  $gselect2dir.='<option value="'.$arr2dir[$i][id_proddir].'">'.$arr2dir[$i][name].'</option>';

  }

  $gselect2dir.='</select>';



}	



//添加产品入库

if(isset($action) && $action=="02" && $onuserperm_addprem=='1'){



	$strSQL="INSERT INTO productinfo(title,content,id_proddir,indate,intro,tag) 

	                     values('$newstitle','$newscontent','$select2',now(),'$newsintro','$newstag')";

	$objDB->Execute($strSQL);

    header('Location:product_manage.php'); exit();

}	

//编辑产品入库

if(isset($action) && substr($action,0,2)=="04" && $onuserperm_editprem=='1'){

    $exaction=explode('&',$action);

	$oneproductinfoid=substr($exaction[0],2);

    $strSQL="UPDATE productinfo SET title='$newstitle',content='$newscontent',id_proddir='$select2',modate=now(),intro='$newsintro',tag='$newstag' where id_prodinfo=$oneproductinfoid";

	$objDB->Execute($strSQL);

	header('Location:product_manage.php?03'.$oneproductinfoid.'&searchselect='.$searchselect.'&keywords='.$keywords.'&modify=1'); exit();

}	



?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<title><?php echo $companytitle;?></title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="../inc/style_admin.css" rel="stylesheet" type="text/css">

<script src="../inc/js/jquery.js" type="text/javascript"></script>

<script src="../inc/js/ajaxfileupload.js" type="text/javascript"></script>

<script language="javascript">

$(function(){$("#select1").change(function(){$("#select2").load("dir2select.php?select1="+$("#select1").val());});});

</script>

<?php if($onuserperm_deleprem=='1'){?>

<script type="text/javascript">

function delenews(val1) {//val1产品id

				var delenews=val1;

					popprompt_del('确认删除产品:', '', delenews, function(isdel) {

						  if (isdel) {$.post('ajax_delenews.php',{val1:val1,isdel:isdel},function(data){

                             var myjson = '';eval('myjson=' + data + ';');

                             popmessage(myjson.info, '友情提醒!',function() {window.location.reload();}); });

                          };

					});

}



function needupfile(upid,upfilepath,upfiletype,indatafile){

 popneedupfile('','文件上传!',upid,upfilepath,upfiletype,indatafile,function() {});

}



function neededitupfile(getfilename){

 $.post('/admin/inc/ajax_getfiles.php',{getfilename:getfilename,datasheet:'productpic'},function(data){

                            var myjson = '';eval('myjson=' + data + ';');

                            popneededitupfile('','文件编辑',myjson.datasheet,myjson.getfileid,myjson.getfiletype,myjson.getfiletitle,myjson.getfileintro,myjson.getfileurl,myjson.getfilename,function() {});

							

							});



}





function delpic(picid){

					pop_confirm_m('确认删除图片:', '', picid, function(picid) {

						  $.post('ajax_delenewpic.php',{picid:picid},function(data){

                            var myjson = '';eval('myjson=' + data + ';');

                            popmessage(myjson.info, '友情提醒!');

							$("#pickuang").html(myjson.str);

							});

					});

}

</script>

<?php }?>



</head>

<body>

<?php require "../header.php"; ?>

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="87.9%">

  <tr> 

    <td width="15%" align="left" valign="top" bgcolor="#E7F1F8">

	<?php require "../leftmenu.php"; ?>

      </td>

    <td width="75%" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">

      <tr>

        <td height="30" align="right">

        <?php if($onuserperm_addprem=='1'){?>

        <a href="product_manage.php?01" class="txt_addnews" >添加产品</a>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <?php }?>

        </td>

      </tr>

    </table>

    <?php if(isset($action)  && ($action=="" || substr($action,0,14)=='&searchselect=')){?>

	<div id="lineout">

      <table width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>

          <td height="36" align="left" background="../inc/pics/lanmubg.gif"><table width="200" border="0" cellspacing="0" cellpadding="0">

            <tr>

              <td width="32">&nbsp;</td>

              <td width="15"><img src="../inc/pics/lm_icon.gif" width="10" height="7"></td>

              <td width="153" class="txt_lanmu">产品管理</td>

            </tr>

          </table></td>

        </tr>

        <tr>

          <td align="center">

            <form action="product_manage.php" method="post" name="form" id="form" >

            <table width="93%" border="0" cellspacing="0" cellpadding="0">

              <tr>

                <td width="24%" align="left">

				  <select name="searchselect" id="searchselect" class="input_01">

                  <option value="" >请选择</option>

                  <?php for($i=0;$i<sizeof($arr2dirsearch);$i++){?>

				    <option value="<?php echo $arr2dirsearch[$i][id_proddir];?>" <?php if($searchselect==$arr2dirsearch[$i][id_proddir]){echo 'selected';}?>><?php echo $arr2dirsearch[$i][name];?></option>

                  <?php }?>  

				    </select></td>

                <td width="17%" align="left"><input type="text" name="keywords" id="keywords" class="input_01" value="<?php echo $keywords;?>"/></td>

                <td width="12%" align="left" class="txt_leftmenu">输入关键字</td>

                <td width="47%" align="left"><input class="btn" type="submit" name="search_ok" id="search_ok" value="搜索" /></td>

              </tr>

                                <tr>

                    <td colspan="6" align="left" valign="middle" bgcolor="#EBF3F9"  style="padding:0; height:1px;"></td>

                    </tr>

            </table>

           </form>

           </td>

        </tr>

        <tr>

          <td align="center"><table width="95%" border="0" cellspacing="0" cellpadding="0">

		   <?php for($i=0;$i<$intNews;$i++) {?>

            <tr>

              <td height="30" align="left" valign="bottom" class="txt_leftmenu">

              <table width="100%" border="0" cellspacing="5" cellpadding="3">

                  <tr>

                    <td align="left" width="21%" class="txt_leftmenu">[ <?php echo $arrproductinfos[$i][name]?> ]</td>

                    <td width="68%" align="left"><a href="product_manage.php?03<?php echo $arrproductinfos[$i][id_prodinfo]?>&searchselect=<?php echo $searchselect;?>&keywords=<?php echo $keywords;?>"  class="txt_leftmenu"><?php echo cutstr($arrproductinfos[$i][title],60,1);?></a></td>

                    <td width="11%" align="left">

        <?php if($onuserperm_deleprem=='1'){?>

        <span class="txt_addnews" style="cursor:pointer" onclick=delenews(<?php echo $arrproductinfos[$i][id_prodinfo];?>);>删除</span><?php }?></td>

                  </tr>

                   <tr>

                    <td colspan="3" align="left" valign="middle" bgcolor="#EBF3F9"  style="padding:0; height:1px;"></td>

                    </tr>

              </table></td>

            </tr>

			<?php }?>

          </table></td>

        </tr>

        <tr>

          <td align="center"><?php echo $strNavigate;?></td>

        </tr>

        <tr>

          <td>&nbsp;</td>

        </tr>

      </table>

	</div>  

<?php }?>

<?php if(isset($action) && $action=='01' && $onuserperm_addprem=='1'){?>

<div id="lineout">

      <table width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>

          <td height="36" align="left" background="../inc/pics/lanmubg.gif"><table width="200" border="0" cellspacing="0" cellpadding="0">

            <tr>

              <td width="32">&nbsp;</td>

              <td width="15"><img src="../inc/pics/lm_icon.gif" width="10" height="7"></td>

              <td width="153" class="txt_lanmu">添加产品</td>

            </tr>

          </table></td>

        </tr>

        <tr>

          <td align="center">&nbsp;</td>

        </tr>

        <tr>

          <td align="center"><table width="93%" border="0" cellspacing="0" cellpadding="0">

            <tr>

              <td height="30" align="left" valign="bottom" class="txt_leftmenu">

              <form action="product_manage.php?02" method="post" name="form" id="form"  onsubmit="return OnCheck(this);" >

              <table width="100%" border="0" cellpadding="4" cellspacing="0" class="txt">

                  <tr bgcolor="#FFFFFF">

                    <td width="91" valign="top" bgcolor="#FFFFFF">产品名称</td>

                    <td bgcolor="#FFFFFF"><input name="newstitle" type="text" class="input_01" id="newstitle" style="width:500px" value="" /></td>

                    </tr>

                  <tr bgcolor="#FFFFFF">

                    <td valign="top" bgcolor="#FFFFFF">产品类别</td>

                    <td bgcolor="#FFFFFF">

                      <table width="100%" border="0" cellspacing="0" cellpadding="0">

                        <tr>

                          <td width="16%"><?php echo $gselect1dir;?></td>

                          <td width="84%"><div id="select2"><?php echo $gselect2dir;?></div></td>

                        </tr>

                      </table>                  </tr>

                  <tr bgcolor="#FFFFFF">

                    <td valign="top" bgcolor="#FFFFFF">产品简介</td>

                    <td bgcolor="#FFFFFF"><textarea name="intro" id="intro" style="width:500px" rows="5"></textarea></td>

                  </tr>

                  <tr bgcolor="#FFFFFF">

                    <td valign="top" bgcolor="#FFFFFF">META标签</td>

                    <td bgcolor="#FFFFFF"><textarea name="tag" id="tag" style="width:500px" rows="2"></textarea>

                      *可用于页面META标签</td>

                  </tr>

                  <tr bgcolor="#FFFFFF">

                    <td valign="top" bgcolor="#FFFFFF">产品介绍</td>

                    <td bgcolor="#FFFFFF"><?php	echo $oFCKeditor->Create();?></td>

                  </tr>

                  <tr bgcolor="#FFFFFF">

                    <td valign="top" bgcolor="#FFFFFF">&nbsp;</td>

                    <td bgcolor="#FFFFFF">

                    <input class="btn" type="submit" name="button_ok" id="button_ok" value="提交" />

                    <input class="btn" type="button" name="button_back2" id="button_back2" value="返回" onclick="javascript:location.href='product_manage.php'" />                    </td>

                  </tr>

              </table>

              </form></td>

            </tr>

          </table></td>

        </tr>

        <tr>

          <td>&nbsp;</td>

        </tr>

      </table>

	</div>   

    <?php }?>

    <?php if(isset($action) && substr($action,0,2)=='03' && $onuserperm_editprem=='1'){

	//取出某条产品

   $exaction=explode('&',$action);

   $onenewsid=substr($exaction[0],2);

   $strSQL="SELECT productinfo.*,productdir.name,productdir.fatherid FROM productinfo left join productdir on productinfo.id_proddir=productdir.id_proddir WHERE id_prodinfo=$onenewsid";

   $objDB->Execute($strSQL);

   $oneproductinfo=$objDB->fields();  

   

   $strSQL="SELECT opicname,id_prodpic,type FROM productpic WHERE id_prodinfo=$onenewsid";

   $objDB->Execute($strSQL);

   $onenewspicinfo=$objDB->GetRows();



   //二级目录编辑抽取

  $strSQL="SELECT id_proddir,name FROM productdir WHERE fatherid=$oneproductinfo[fatherid] and dele='1' and level='2'";

  $objDB->Execute($strSQL);

  $arr2editdir=$objDB->GetRows();

	?>

<div id="lineout">

      <table width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>

          <td height="36" align="left" background="../inc/pics/lanmubg.gif"><table width="200" border="0" cellspacing="0" cellpadding="0">

            <tr>

              <td width="32">&nbsp;</td>

              <td width="15"><img src="../inc/pics/lm_icon.gif" width="10" height="7"></td>

              <td width="153" class="txt_lanmu">编辑产品</td>

            </tr>

          </table></td>

        </tr>

        <tr>

          <td align="center">&nbsp;</td>

        </tr>

        <tr>

          <td align="center"><table width="93%" border="0" cellspacing="0" cellpadding="0">

            <tr>

              <td height="30" align="left" valign="bottom" class="txt_leftmenu">

              <form action="product_manage.php?04<?php echo $oneproductinfo[id_prodinfo];?>&searchselect=<?php echo $searchselect;?>&keywords=<?php echo $keywords;?>" method="post" name="form" id="form"  onsubmit="return OnCheck(this);" >

              <table width="100%" border="0" cellpadding="4" cellspacing="0" class="txt">

                  <tr bgcolor="#FFFFFF">

                    <td width="91" valign="top" bgcolor="#FFFFFF">产品名称</td>

                    <td bgcolor="#FFFFFF"><input name="newstitle" type="text" class="input_01" id="newstitle" style="width:500px" value="<?php echo $oneproductinfo[title];?>" /></td>

                    </tr>

                  <tr bgcolor="#FFFFFF">

                    <td valign="top" bgcolor="#FFFFFF">产品类别</td>

                    <td bgcolor="#FFFFFF">

                      <table width="100%" border="0" cellspacing="0" cellpadding="0">

                        <tr>

                          <td width="16%">

				  <select name="select1" class="input_01" id="select1">

                   <?php for($i=0;$i<sizeof($arr1dir);$i++){?>

                   <option value="<?php echo $arr1dir[$i][id_proddir];?>" <?php if($oneproductinfo[fatherid]==$arr1dir[$i][id_proddir]){echo 'selected';}?>><?php echo $arr1dir[$i][name];?></option>

                  <?php }?>

                  </select>                          </td>

                          <td width="84%">

                          <div id="select2">

                   <select name="select2" class="input_01" id="select2">

                   <?php for($i=0;$i<sizeof($arr2editdir);$i++){?>

                   <option value="<?php echo $arr2editdir[$i][id_proddir];?>" <?php if($oneproductinfo[id_proddir]==$arr2editdir[$i][id_proddir]){echo 'selected';}?>><?php echo $arr2editdir[$i][name];?></option>

                  <?php }?>

                  </select>

                          </div></td>

                        </tr>

                      </table>                  </tr>

                  <tr bgcolor="#FFFFFF">

                    <td valign="top">产品简介</td>

                    <td ><textarea name="intro" id="intro" style="width:500px" rows="5"><?php echo $oneproductinfo[intro]; ?></textarea>                            </tr>

                  <tr bgcolor="#FFFFFF">

                    <td valign="top" bgcolor="#FFFFFF">META标签</td>

                    <td bgcolor="#FFFFFF"><textarea name="tag" id="tag" style="width:500px" rows="2"><?php echo $oneproductinfo[tag]; ?></textarea>

                      *可用于页面META标签                          </tr>

                  <tr bgcolor="#FFFFFF">

                    <td valign="top" bgcolor="#FFFFFF">产品介绍</td>

                    <td bgcolor="#FFFFFF">

					<?php $oFCKeditor->Value=$oneproductinfo[content];

						  echo $oFCKeditor->Create();?>                  </tr>

                  <tr bgcolor="#FFFFFF">

                    <td valign="top" bgcolor="#FFFFFF"></td>

                    <td bgcolor="#FFFFFF"><span onclick="needupfile(<?php echo $oneproductinfo[id_prodinfo];?>,'../../upload/product/','|jpg|jpeg|pdf|rar|doc','/admin/product/ajax_upfileindata.php');" style="cursor:pointer">文件上传...</span>

                                              <div id="pickuang">

<?php for($i=0;$i<sizeof($onenewspicinfo);$i++){

if($onenewspicinfo[$i][type]=="JPG" || $onenewspicinfo[$i][type]=="JPEG" || $onenewspicinfo[$i][type]=="GIF"){

?>

<div class="box floatLeft"><a href="javascript:void(0)" onclick='$.wholepop.dialogClass ="style_1";poppic("<?php echo $siteurl;?>/upload/product/<?php echo $onenewspicinfo[$i][opicname];?>","图片预览及地址复制");'><img src="/upload/product/<?php echo $onenewspicinfo[$i][opicname];?>" width="50" height="50" border="0" /></a><span class="txt_underpic" onclick="delpic(<?php echo $onenewspicinfo[$i][id_prodpic];?>);" style="cursor:pointer">删除</span></div>

<? }else if($onenewspicinfo[$i][type]=="PDF"){?>

<div class="box floatLeft"><a href="javascript:void(0)" onclick='$.wholepop.dialogClass ="style_1";poppic("<?php echo $siteurl;?>/upload/product/<?php echo $onenewspicinfo[$i][opicname];?>","图片预览及地址复制");'><img src="/admin/inc/pics/pdf.gif" width="50" height="50" border="0" /></a><span class="txt_underpic" onclick="delpic(<?php echo $onenewspicinfo[$i][id_prodpic];?>);" style="cursor:pointer">删除</span></div>

<? }else if($onenewspicinfo[$i][type]=="DOC"){?>

<div class="box floatLeft"><a href="javascript:void(0)" onclick='$.wholepop.dialogClass ="style_1";poppic("<?php echo $siteurl;?>/upload/product/<?php echo $onenewspicinfo[$i][opicname];?>","图片预览及地址复制");'><img src="/admin/inc/pics/doc.gif" width="50" height="50" border="0" /></a><span class="txt_underpic" onclick="delpic(<?php echo $onenewspicinfo[$i][id_prodpic];?>);" style="cursor:pointer">删除</span></div>

<? }else if($onenewspicinfo[$i][type]=="RAR"){?>

<div class="box floatLeft"><a href="javascript:void(0)" onclick='$.wholepop.dialogClass ="style_1";poppic("<?php echo $siteurl;?>/upload/product/<?php echo $onenewspicinfo[$i][opicname];?>","图片预览及地址复制");'><img src="/admin/inc/pics/rar.gif" width="50" height="50" border="0" /></a><span class="txt_underpic" onclick="delpic(<?php echo $onenewspicinfo[$i][id_prodpic];?>);" style="cursor:pointer">删除</span></div>

<?php  }}?>

</div></tr>

                  <tr bgcolor="#FFFFFF">

                    <td valign="top" bgcolor="#FFFFFF">&nbsp;</td>

                    <td bgcolor="#FFFFFF">

                    <input class="btn" type="submit" name="button_ok" id="button_ok" value="提交" />

                    <input class="btn" type="button" name="button_back2" id="button_back2" value="返回" onclick="javascript:location.href='product_manage.php?&searchselect=<?php echo $searchselect;?>&keywords=<?php echo $keywords;?>'" />                    </td>

                  </tr>

              </table>

              </form></td>

            </tr>

          </table></td>

        </tr>

        <tr>

          <td>&nbsp;</td>

        </tr>

      </table>

	</div>   

    <?php }?>

          <table width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>

          <td>&nbsp;</td>

        </tr>

      </table>

	  </td>



  </tr>

</table>



<?php if(isset($_GET[modify])){?>

<script type="text/javascript">

 popmessage('修改成功！', '友情提醒!');

</script>

<?php }?>



<?php require "../footer.php"; ?>

</body>

</html>



