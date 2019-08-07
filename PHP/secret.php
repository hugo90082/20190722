<?php 
session_start();
if (!isset($_SESSION["userName"]))
{
	setcookie("lastPage", "secret.php");
	header("Location: login.php");
	exit();
	
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的購物車</title>
</head>
<body>

<table width="300" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#F2F2F2">
  <tr>
    <td align="center" bgcolor="#CCCCCC"><font color="#FFFFFF">會員系統 － 購物車</font></td>
  </tr>
  <tr></tr>
  <tr>
    <td align="center" bgcolor="#CCCCCC"><a href="index.php">回首頁</a></td>
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
      數量</td>
	</tr>
		<tr id="item_3">
		<td bgcolor="#e7e7e7"><input type="hidden"
			name="item3"
			value="3"></input> 產品名稱</td>
		<td bgcolor="#e7e7e7">100元</td>
		<td bgcolor="#e7e7e7"></td>

	</tr>

	</table>
</body>

</html>