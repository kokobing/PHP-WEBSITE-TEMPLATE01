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

  $newstitle=$_POST[newstitle];//信息标题
  $select2=$_POST[select2]; //二级信息目录
  $newscontent=$_POST[newscontent]; //信息内容
  $url=$_POST[url]; //信息链接
  $fbtime=$_POST[fbtime]; //发布时间
  $newsintro=$_POST[intro]; //产品简介
  $newstag=$_POST[tag];//tag
  
  
  $keywords=$_REQUEST[keywords];
  $searchdate=$_REQUEST[searchdate];
  $searchselect=$_REQUEST[searchselect];
  
  $arrParam[0][name]="searchselect";
  $arrParam[0][value]=$searchselect;
  
  $arrParam[1][name]="searchdate";
  $arrParam[1][value]=$searchdate;
  
  $arrParam[2][name]="keywords";
  $arrParam[2][value]=$keywords;
  
  if($searchselect!=""){
  $str=" and newsdir.id_newsdir=".$_REQUEST[searchselect]." ";
  }else{
  $str="";
  }
  
  if($searchdate!=""){
  $str.=" and newsinfo.newsdate like '%".$_REQUEST[searchdate]."%' ";
  }else{
  $str.="";
  }
  
  if($keywords!=""){
  $str.=" and newsinfo.title like '%".$_REQUEST[keywords]."%' ";
  }else{
  $str.="";
  }

//输出一级目录  
  $strSQL="SELECT id_newsdir,name FROM newsdir where dele='1' and level='1'";
  $objDB->Execute($strSQL);
  $arr1dir=$objDB->GetRows();

//取出信息信息 start
if(isset($action) && ($action=="" || substr($action,0,14)=='&searchselect=')){
if(isset($_REQUEST["page"]) ){$intCurPage=$_REQUEST["page"];}else{$intCurPage=1;}
$intRows = 10;
$strSQLNum = "SELECT COUNT(*) as num from newsinfo left join newsdir on newsinfo.id_newsdir=newsdir.id_newsdir WHERE newsinfo.dele='1' $str";   
$rs = $objDB->Execute($strSQLNum);
$arrNum = $objDB->fields();
$intTotalNum=$arrNum["num"];

$objPage = new PageNav($intCurPage,$intTotalNum,$intRows);

$objPage->setvar($arrParam);
$objPage->init_page($intRows ,$intTotalNum);
$strNavigate = $objPage->output(1);
$intStartNum=$objPage->StartNum(); 

$strSQL = "SELECT newsinfo.id_newsinfo,newsdir.name,newsinfo.newsdate,newsinfo.title,newsinfo.content FROM newsinfo left join newsdir on newsinfo.id_newsdir=newsdir.id_newsdir WHERE newsinfo.dele='1' $str order by newsinfo.indate DESC" ;
$objDB->SelectLimit($strSQL,$intRows,$intStartNum);
$arrnewsinfos=$objDB->GetRows();
$intNews=sizeof($arrnewsinfos);
}//取出信息信息 end

//初始化搜索下拉列表
  $strSQL="SELECT id_newsdir,name FROM newsdir WHERE dele='1' and level='2'";
  $objDB->Execute($strSQL);
  $arr2dirsearch=$objDB->GetRows();

if(isset($action) && $action=="01" && $onuserperm_addprem=='1'){//添加动作存在时初始目录

  $gselect1dir='<select name="select1" class="input_01" id="select1">';
  for($i=0;$i<sizeof($arr1dir);$i++){
  if($arr1dir[$i][id_newsdir]=='1'){
     $gselect1dir.='<option value="'.$arr1dir[$i][id_newsdir].'"selected"'.'">'.$arr1dir[$i][name].'</option>';
    }else{$gselect1dir.='<option value="'.$arr1dir[$i][id_newsdir].'">'.$arr1dir[$i][name].'</option>';}
  }
  $gselect1dir.='</select>';

//初始二级目录  
  $strSQL="SELECT id_newsdir,name FROM newsdir WHERE fatherid='1' and dele='1' and level='2'";
  $objDB->Execute($strSQL);
  $arr2dir=$objDB->GetRows();

  $gselect2dir='<select name="select2" class="input_01" id="select2">';
  for($i=0;$i<sizeof($arr2dir);$i++){
  $gselect2dir.='<option value="'.$arr2dir[$i][id_newsdir].'">'.$arr2dir[$i][name].'</option>';
  }
  $gselect2dir.='</select>';

}	

//添加信息入库
if(isset($action) && $action=="02" && $onuserperm_addprem=='1'){

	$strSQL="INSERT INTO newsinfo(title,content,id_newsdir,url,newsdate,indate,intro,tag) 
	                     values('$newstitle','$newscontent','$select2','$url','$fbtime',now(),'$newsintro','$newstag')";
	$objDB->Execute($strSQL);
    header('Location:news_manage.php'); exit();
}	
//编辑信息入库
if(isset($action) && substr($action,0,2)=="04" && $onuserperm_editprem=='1'){
    $exaction=explode('&',$action);
	$onenewsinfoid=substr($exaction[0],2);
    $strSQL="UPDATE newsinfo SET title='$newstitle',content='$newscontent',id_newsdir='$select2',url='$url',newsdate='$fbtime',modate=now(),intro='$newsintro',tag='$newstag' where id_newsinfo=$onenewsinfoid";
	$objDB->Execute($strSQL);
	header('Location:news_manage.php?03'.$onenewsinfoid.'&searchselect='.$searchselect.'&searchdate='.$searchdate.'&keywords='.$keywords.'&modify=1'); exit();
}	

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo $companytitle;?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../inc/style_admin.css" rel="stylesheet" type="text/css">
<? //日历
require_once ("../inc/jscalendar/calendar1.php");
$calendar = new DHTML_Calendar('/admin/inc/jscalendar/', 'cn_utf8', 'calendar-system', false);
//以下是各种风格
//calendar-blue,calendar-blue2,calendar-brown,calendar-green,calendar-win2k-1,calendar-win2k-2,calendar-win2k-cold-1,calendar-win2k-cold-2,calendar-system
$calendar->load_files();
?>
<script src="../inc/js/jquery.js" type="text/javascript"></script>
<script src="../inc/js/ajaxfileupload.js" type="text/javascript"></script>
<script language="javascript">
$(function(){$("#select1").change(function(){$("#select2").load("dir2select.php?select1="+$("#select1").val());});});
</script>
<?php if($onuserperm_deleprem=='1'){?>
<script type="text/javascript">
function delenews(val1) {//val1信息id
				var delenews=val1;
					popprompt_del('确认删除信息:', '', delenews, function(isdel) {
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
 $.post('/admin/inc/ajax_getfiles.php',{getfilename:getfilename,datasheet:'newspic'},function(data){
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
        <a href="news_manage.php?01" class="txt_addnews" >添加信息</a>
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
              <td width="153" class="txt_lanmu">信息管理</td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td></td>
        </tr>
        <tr>
          <td align="center">
          <form action="news_manage.php" method="post" name="form" id="form" >
            <table width="94%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="15%" align="left">
				  <select name="searchselect" id="searchselect" class="input_01">
                  <option value="" >请选择</option>
                  <?php for($i=0;$i<sizeof($arr2dirsearch);$i++){?>
				    <option value="<?php echo $arr2dirsearch[$i][id_newsdir];?>" <?php if($searchselect==$arr2dirsearch[$i][id_newsdir]){echo 'selected';}?>><?php echo $arr2dirsearch[$i][name];?></option>
                  <?php }?>  
				    </select></td>
                <td width="15%" align="left">
                <? $calendar->make_input_field(
           // calendar options go here; see the documentation and/or calendar-setup.js
           array('firstDay'       => 1, // show Monday first
                 'showsTime'      => false,
                 'showOthers'     => true,
                 'ifFormat'       => '%Y-%m-%d',//%Y-%m-%d %I:%M %P,%Y-%m-%d %H:%M
                 'timeFormat'     => '24'),
           // field attributes go here
           array('style'       => 'width: 8em; color: #494949; background-color: #ffffff; border: 1px solid #D1D1D1; text-align: center',
                 'name'        => 'searchdate',
                 'value'       => $searchdate)); ?></td>
                <td width="17%" align="left" class="txt_leftmenu">选择日期</td>
                <td width="17%" align="left"><input type="text" name="keywords" id="keywords" class="input_01" value="<?php echo $keywords;?>"/></td>
                <td width="20%" align="left" class="txt_leftmenu">输入关键字</td>
                <td width="16%" align="left"><input class="btn" type="submit" name="search_ok" id="search_ok" value="搜索" /></td>
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
                    <td align="left" width="13%" class="txt_leftmenu">[ <?php echo $arrnewsinfos[$i][name]?> ]</td>
                    <td width="15%" align="left" class="txt_leftmenu">[ <?php echo $arrnewsinfos[$i][newsdate]?> ]</td>
                    <td width="66%" align="left"><a href="news_manage.php?03<?php echo $arrnewsinfos[$i][id_newsinfo];?>&searchselect=<?php echo $searchselect;?>&searchdate=<?php echo $searchdate;?>&keywords=<?php echo $keywords;?>"  class="txt_leftmenu"><?php echo cutstr($arrnewsinfos[$i][title],60,1);?></a></td>
                    <td width="6%" align="left">
        <?php if($onuserperm_deleprem=='1'){?>
                    <span class="txt_addnews" style="cursor:pointer" onclick=delenews(<?php echo $arrnewsinfos[$i][id_newsinfo]?>);>删除</span><?php }?></td>
                  </tr>
                 <tr>
                    <td colspan="4" align="left" valign="middle" bgcolor="#EBF3F9"  style="padding:0; height:1px;"></td>
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
              <td width="153" class="txt_lanmu">添加信息</td>
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
              <form action="news_manage.php?02" method="post" name="form" id="form"  onsubmit="return OnCheck(this);" >
              <table width="100%" border="0" cellpadding="4" cellspacing="0" class="txt">
                  <tr bgcolor="#FFFFFF">
                    <td width="91" valign="top" bgcolor="#FFFFFF">信息标题</td>
                    <td bgcolor="#FFFFFF"><input name="newstitle" type="text" class="input_01" id="newstitle" style="width:500px" value="" /></td>
                    </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">信息类别</td>
                    <td bgcolor="#FFFFFF">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="16%"><?php echo $gselect1dir;?></td>
                          <td width="84%"><div id="select2"><?php echo $gselect2dir;?></div></td>
                        </tr>
                      </table>                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">信息简介</td>
                    <td bgcolor="#FFFFFF"><textarea name="intro" id="intro" style="width:500px" rows="5"></textarea></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">META标签</td>
                    <td bgcolor="#FFFFFF"><textarea name="tag" id="tag" style="width:500px" rows="2"></textarea>
*可用于页面META标签</td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">信息内容</td>
                    <td bgcolor="#FFFFFF"><?php	echo $oFCKeditor->Create();?></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">链接地址</td>
                    <td bgcolor="#FFFFFF"><input type="text" class="input_01" name="url" id="url" style="width:300px"/></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">发布时间</td>
                    <td bgcolor="#FFFFFF"><input type="text" class="input_01" name="fbtime" value="<?php echo date("Y-m-d");?>" id="fbtime" /></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">&nbsp;</td>
                    <td bgcolor="#FFFFFF">
                    <input class="btn" type="submit" name="button_ok" id="button_ok" value="提交" />
                    <input class="btn" type="button" name="button_back2" id="button_back2" value="返回" onclick="javascript:location.href='news_manage.php'" />                    </td>
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
	//取出某条信息
   $exaction=explode('&',$action);
   $onenewsid=substr($exaction[0],2);
   $strSQL="SELECT newsinfo.*,newsdir.name,newsdir.fatherid FROM newsinfo left join newsdir on newsinfo.id_newsdir=newsdir.id_newsdir WHERE id_newsinfo=$onenewsid";
   $objDB->Execute($strSQL);
   $onenewsinfo=$objDB->fields();  
   
   $strSQL="SELECT opicname,id_newspic,type FROM newspic WHERE id_newsinfo=$onenewsid";
   $objDB->Execute($strSQL);
   $onenewspicinfo=$objDB->GetRows();

   //二级目录编辑抽取
  $strSQL="SELECT id_newsdir,name FROM newsdir WHERE fatherid=$onenewsinfo[fatherid] and dele='1' and level='2'";
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
              <td width="153" class="txt_lanmu">编辑信息</td>
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
              <form action="news_manage.php?04<?php echo $onenewsinfo[id_newsinfo];?>&searchselect=<?php echo $searchselect;?>&searchdate=<?php echo $searchdate;?>&keywords=<?php echo $keywords;?>" method="post" name="form" id="form"  onsubmit="return OnCheck(this);" >
              <table width="100%" border="0" cellpadding="4" cellspacing="0" class="txt">
                  <tr bgcolor="#FFFFFF">
                    <td width="91" valign="top" bgcolor="#FFFFFF">信息标题</td>
                    <td bgcolor="#FFFFFF"><input name="newstitle" type="text" class="input_01" id="newstitle" style="width:500px" value="<?php echo $onenewsinfo[title];?>" /></td>
                    </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">信息类别</td>
                    <td bgcolor="#FFFFFF">
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="16%">
				  <select name="select1" class="input_01" id="select1">
                   <?php for($i=0;$i<sizeof($arr1dir);$i++){?>
                   <option value="<?php echo $arr1dir[$i][id_newsdir];?>" <?php if($onenewsinfo[fatherid]==$arr1dir[$i][id_newsdir]){echo 'selected';}?>><?php echo $arr1dir[$i][name];?></option>
                  <?php }?>
                  </select>                          </td>
                          <td width="84%">
                          <div id="select2">
                   <select name="select2" class="input_01" id="select2">
                   <?php for($i=0;$i<sizeof($arr2editdir);$i++){?>
                   <option value="<?php echo $arr2editdir[$i][id_newsdir];?>" <?php if($onenewsinfo[id_newsdir]==$arr2editdir[$i][id_newsdir]){echo 'selected';}?>><?php echo $arr2editdir[$i][name];?></option>
                  <?php }?>
                  </select>
                          </div></td>
                        </tr>
                      </table>                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">信息简介</td>
                    <td bgcolor="#FFFFFF"><textarea name="intro" id="intro" style="width:500px" rows="5"><?php echo $onenewsinfo[intro];?></textarea></tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">META标签</td>
                    <td bgcolor="#FFFFFF"><textarea name="tag" id="tag" style="width:500px" rows="2"><?php echo $onenewsinfo[tag];?></textarea>
*可用于页面META标签                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">信息内容</td>
                    <td bgcolor="#FFFFFF">
					<?php $oFCKeditor->Value=$onenewsinfo[content];
						  echo $oFCKeditor->Create();?>                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF"></td>
                    <td bgcolor="#FFFFFF"><span onclick="needupfile(<?php echo $onenewsinfo[id_newsinfo];?>,'../../upload/news/','|jpg|jpeg|pdf|rar|doc','/admin/news/ajax_upfileindata.php');" style="cursor:pointer">文件上传...</span>
 <div id="pickuang">
<?php for($i=0;$i<sizeof($onenewspicinfo);$i++){
if($onenewspicinfo[$i][type]=="JPG" || $onenewspicinfo[$i][type]=="JPEG" || $onenewspicinfo[$i][type]=="GIF"){
?>
<div class="box floatLeft"><a href="javascript:void(0)" onclick='$.wholepop.dialogClass ="style_1";poppic("<?php echo $siteurl;?>/upload/news/<?php echo $onenewspicinfo[$i][opicname];?>","图片预览及地址复制");'><img src="/upload/news/<?php echo $onenewspicinfo[$i][opicname];?>" width="50" height="50" border="0" /></a><span class="txt_underpic" onclick="delpic(<?php echo $onenewspicinfo[$i][id_newspic];?>);" style="cursor:pointer">删除</span></div>
<? }else if($onenewspicinfo[$i][type]=="PDF"){?>
<div class="box floatLeft"><a href="javascript:void(0)" onclick='$.wholepop.dialogClass ="style_1";poppic("<?php echo $siteurl;?>/upload/news/<?php echo $onenewspicinfo[$i][opicname];?>","图片预览及地址复制");'><img src="/admin/inc/pics/pdf.gif" width="50" height="50" border="0" /></a><span class="txt_underpic" onclick="delpic(<?php echo $onenewspicinfo[$i][id_newspic];?>);" style="cursor:pointer">删除</span></div>
<? }else if($onenewspicinfo[$i][type]=="DOC"){?>
<div class="box floatLeft"><a href="javascript:void(0)" onclick='$.wholepop.dialogClass ="style_1";poppic("<?php echo $siteurl;?>/upload/news/<?php echo $onenewspicinfo[$i][opicname];?>","图片预览及地址复制");'><img src="/admin/inc/pics/doc.gif" width="50" height="50" border="0" /></a><span class="txt_underpic" onclick="delpic(<?php echo $onenewspicinfo[$i][id_newspic];?>);" style="cursor:pointer">删除</span></div>
<? }else if($onenewspicinfo[$i][type]=="RAR"){?>
<div class="box floatLeft"><a href="javascript:void(0)" onclick='$.wholepop.dialogClass ="style_1";poppic("<?php echo $siteurl;?>/upload/news/<?php echo $onenewspicinfo[$i][opicname];?>","图片预览及地址复制");'><img src="/admin/inc/pics/rar.gif" width="50" height="50" border="0" /></a><span class="txt_underpic" onclick="delpic(<?php echo $onenewspicinfo[$i][id_newspic];?>);" style="cursor:pointer">删除</span></div>
<?php  }}?>
</div></tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">链接地址</td>
                    <td bgcolor="#FFFFFF"><input name="url" type="text" class="input_01" id="url" style="width:300px" value="<?php echo $onenewsinfo[url];?>"/></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">发布时间</td>
                    <td bgcolor="#FFFFFF"><input type="text" class="input_01" name="fbtime" value="<?php echo $onenewsinfo[newsdate];?>" id="fbtime" /></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td valign="top" bgcolor="#FFFFFF">&nbsp;</td>
                    <td bgcolor="#FFFFFF">
                    <input class="btn" type="submit" name="button_ok" id="button_ok" value="提交" />
                    <input class="btn" type="button" name="button_back2" id="button_back2" value="返回" onclick="javascript:location.href='news_manage.php?&searchselect=<?php echo $searchselect;?>&searchdate=<?php echo $searchdate;?>&keywords=<?php echo $keywords;?>'" />                    </td>
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

