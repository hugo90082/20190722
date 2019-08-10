<?php 
session_start();

require_once("config.php");
$link= mysqli_connect($dbhost,$dbuser,$dbpass);
$result = mysqli_query ( $link, "set names utf8" );
mysqli_select_db($link,$dbname);
$sqlCommand="select * from commodity";
$result=mysqli_query($link,$sqlCommand);
// $row=mysqli_fetch_assoc($result);


@$userID = $_SESSION["userID"];
$YesNo="";
$CommodityID="";
$x = date('Y-m-d H:i:s');//取得日期
if(isset($_GET["CommodityID"])){
  $CommodityID=$_GET["CommodityID"];
  $sqlCommand2="INSERT INTO transaction VALUES ('',$userID, $CommodityID, '1','$x')";
  $result2=mysqli_query($link,$sqlCommand2);
  $YesNo="加入成功";
}



if (isset($_SESSION["userName"]))
  $sUserName = $_SESSION["userName"];
else 
  $sUserName = "Guest";

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lab - index</title>
</head>
<body>

<table width="300" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2">
  <tr>
    <td align="center" bgcolor="#CCCCCC"><font color="#FFFFFF">會員系統 - 首頁</font></td>
  </tr>
  <tr>
  
  <?php if ($sUserName == "Guest"): ?>
    <td align="center" valign="baseline"><a href="login.php">登入</a> 
  <?php else: ?>
    <td align="center" valign="baseline"><a href="login.php?logout=1">登出</a>
  <?php endif; ?>
    
    | <a href="secret.php">會員購物車</a></td>
  </tr>
  <tr>
    <td align="center" bgcolor="#CCCCCC"><?php echo "Welcome! " . $sUserName ?> </td>
  </tr>
</table>

<table width="100%" border="0" cellpadding="6" cellspacing="0"
	id="mytable">
	<tr>
		<td width="43%" class="shopping_w1"
			style="border-right: 1px solid #d2d2d2; border-bottom: 1px solid #d2d2d2;">
      商品名稱</td>
		<td width="21%" class="shopping_w1"
			style="border-right: 1px solid #d2d2d2; border-bottom: 1px solid #d2d2d2;">
      價格</td>
		<td width="21%" class="shopping_w1"
			style="border-right: 1px solid #d2d2d2; border-bottom: 1px solid #d2d2d2;">
      </td>
    <td></td>
	</tr>

  <?php while ($row = mysqli_fetch_assoc($result)){?>
    <form method="post" id="f<?=$row['CommodityID']; ?>"> 
		<tr>
    <td bgcolor="#e7e7e7"><?=$row['commodityName']; ?></td>
		<td bgcolor="#e7e7e7"><?=$row['price'] ?></td>
    <td bgcolor="#e7e7e7">
    <input type="button" id="buy" value="加入1個至購物車" onclick="location='index.php?CommodityID=<?=$row['CommodityID']; ?>'">
    <?php if($CommodityID==$row['CommodityID'])echo $YesNo; ?></td>
		<td bgcolor="#e7e7e7">
    
    </td>

	</tr>
  </form>
  <?php } ?>
	</table>

</body>
</html>