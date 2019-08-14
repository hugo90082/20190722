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
  
    @if (Session::has('memberID'))
        <h2>公告訊息管理系統 -- 已登入  
        <a href="/flush" class="btn btn-md btn-success pull-right">
            登出</a></h2>
        <a href="/home/create" class="btn btn-md btn-success pull-right">
        <span class="glyphicon glyphicon-plus"></span> 新增</a>
    @else
        <h2>公告訊息管理系統    
        <a href="/login" class="btn btn-md btn-success pull-right">
            網管人員登入</a></h2>
    @endif



  <table class="table table-hover">
    <thead>
      <tr>
        <th>標題</th>
        <th>內容</th>
        <th>&nbsp;</th>
      </tr>
    </thead>
    <tbody>
    @foreach ($messageList as $item)
        <tr>
            <td><a href="/details/{{$item->ID}}">{{$item->topic}}</a></td>
            <td>{{$item->content}}</td>
            <td>
                <span class="pull-right">
            @if (Session::has('memberID'))


                    <form method="post" action="/home/{{$item->ID}}"> 
                        <a href="/details/{{$item->ID}}" class="btn btn-primary btn-xs"> 詳細內容</a> |
                        <a href="/home/{{$item->ID}}/edit" class="btn btn-xs btn-info"><span class="glyphicon glyphicon-pencil"></span> 修改</a> | 
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-xs btn-danger"><span class="glyphicon glyphicon-remove"></span> 刪除</button>
                    </form>
            @endif   
                  
                </span>
            </td>
        </tr>
    @endforeach

 

    </tbody>
  </table>
</div>

</body>
</html>