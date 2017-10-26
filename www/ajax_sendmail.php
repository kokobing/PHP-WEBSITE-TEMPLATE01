<?php  
//require "./inc/config.php";
require("./inc/phpmailer/class.phpmailer.php");
require "./inc/config.php";

//取发件箱  收件箱 
$strSQL = "select rmailbox,smailbox,smailboxpass from siteset  where id_siteset='1' " ;
$objDB->Execute($strSQL);
$arremail=$objDB->fields();


$request_email = $_REQUEST["emailcontent"];


$to_address=$arremail[rmailbox];//收信箱
$to_name='koko@ty-sh.com';
$subject="Come from website Email Feedback :".date("Y-m-d h:i:s");//主题
//内容
$body="

	   
message : ".$request_email."
	   

".date("Y")."-".date("m")."-".date("d")."";



$mail = new PHPMailer();
$mail->IsSMTP(); 
$mail->CharSet = "utf-8";
$mail->Encoding = "base64";
$mail->From = $arremail[smailbox];//发件箱
$mail->FromName = $arremail[smailboxpass];
$mail->Host ="smtp.163.com";
$mail->Mailer="smtp";
$mail->Port = 25; 
$mail->SMTPAuth = true;
$mail->Username = "njyhwebmaster@163.com";
$mail->Password = "njyh2010";
$mail->AddAddress($to_address, $to_name);
$mail->WordWrap = 50;
if (!empty($attach)){
	$mail->AddAttachment($attach);
}
$mail->IsHTML(false);
$mail->Subject = $subject;
$mail->Body = $body;
if(!$mail->Send()){
  $arr['info']="发送失败!";
  $myjson= json_encode($arr);
  echo $myjson;
}else{
  $arr['info']="发送成功!";
  $myjson= json_encode($arr);
  echo $myjson;
}


  


?>

