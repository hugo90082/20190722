<!DOCTYPE html>
<html lang="en">
<head>
  <title>Management</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
    <form method="post" action="/authenticate" class="form-horizontal">
        @csrf

    <fieldset>
    
    <!-- Form Name -->
    <legend>網管人員登入</legend>
    
    <!-- Text input-->
    <div class="form-group">
      <label class="col-md-4 control-label" for="ID">帳號</label>  
      <div class="col-md-4">
      <input id="ID" name="ID" type="text" placeholder="" class="form-control input-md">
        
      </div>
    </div>
    
    <!-- Password input-->
    <div class="form-group">
      <label class="col-md-4 control-label" for="password">密碼</label>
      <div class="col-md-4">
        <input id="password" name="password" type="password" placeholder="" class="form-control input-md">
        
      </div>
    </div>
    
    <!-- Button (Double) -->
    <div class="form-group">
      <label class="col-md-4 control-label" for="button1id"></label>
      <div class="col-md-8">
        <button type="submit" id="login" name="login" class="btn btn-primary" value="OK">登入</button>
        <button type="submit" id="login" name="login" class="btn btn-danger" value="cancel">回首頁</button>
      </div>
    </div>
    
    </fieldset>
    </form>

</div>

</body>
</html>