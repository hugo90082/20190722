<?php
	$contents = file_get_contents('data.txt');//檔案讀取內容
	echo (str_replace("\r\n", "<br />", $contents));
?>