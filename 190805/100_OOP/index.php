<?php
session_start();
$prompt = "";
if(isset($_POST["btnOK"])){
    $userName =  $_POST["txtUserName"];
    if($userName == ""){
        $prompt="please";
    }else{
        $_SESSION["uid"] =$userName;
        header("Location: hello.php");
        exit();
    }
    
    
}else{
    echo "G";
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <form method="post">
        your name:
        <input type="text" name="txtUserName">
        <input type="submit" name="btnOK" value="OK" >
        <br>
        <?= $prompt ?>
    </form>

</body>
</html>