<?php
function ShowStar($num ,$star){
	$result = "";
	for ( $i = 0;$i<$num;$i++){

		$result.= $star;
	}

	return $result;
}

echo ShowStar(3,"0");
?>