<?php
$host = "www.phpweb.net"; //你要访问的域名
$target = "http://demo.2799.cn/1328170620/"; //你要访问的页面地址
$referer = "http://www.phpweb.net/"; //伪造来路页面
$fp = fsockopen($host, 80, $errno, $errstr, 30);
if(!$fp){
    echo "$errstr($errno)<br />\n";
}else{
    $out = "
        GET $target HTTP/1.1
        Host: $host
        Referer: $referer
        Connection: Close\r\n\r\n";

    fwrite($fp, $out);
    while(!feof($fp)){
        echo fgets($fp, 1024);
    }
    fclose($fp);
}
?>
