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
    <form method="post" action="/home" class="form-horizontal">
        @csrf

    <fieldset>
    
    <!-- Form Name -->
    <legend><h2>詳細公告內容</h2></legend>
    <table>
    <!-- Text input-->
    <tr>
    <h2><div class="form-group">
    <p class="bg-success">
            主題:{{$messageList->topic}}
    </p>
    </div></h2>
    </tr>
    <tr> 
    <!-- Password input-->
    <h4> <div class="text-info">
      內容:{{$messageList->content}}

    </div></h4>
</tr>
    <!-- Button (Double) -->
    <tr>
      <div class="col-md-8">
        <button type="submit" style="padding-right" id="login" name="login" class="btn btn-danger" value="cancel">回首頁</button>
      </div>

    </tr>
    </table>
    </fieldset>
    </form>

</div>

</body>
</html>