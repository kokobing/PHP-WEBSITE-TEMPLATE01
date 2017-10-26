<?php
$sendTo = "your@email.com";
$subject = "Elite Website Contact Form";
$message = $_GET['message'];
$email = $_GET['email'];
$name = $_GET['name'];
	//send mail
	$headers  = "From: $email\r\n";
	//$headers .= 'MIME-Version: 1.0' . "\r\n";
	//$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
    $msg = "The following information has been submited via website:\n\nName:".$name."\n\nE-mail:".$email."\n\nMessage:".$message."";
	mail($sendTo, $subject, $msg, $headers);
	echo "status=formOk";
?>