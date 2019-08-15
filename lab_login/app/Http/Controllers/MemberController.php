<?php

namespace App\Http\Controllers;
use session;
use Illuminate\Http\Request;

class MemberController extends Controller
{
    function login(){
        $request = (object)["txtUserName"=>""];
        return view("member.login", compact("request"));
    }
    function postLogin(Request $request){
        if($request->txtUserName == ""){
            
            return view("member.login", compact("request") );
        }
        session::put("userName",$request->txtUserName);
        return redirect("/home/index");
    }
    
    function secret(){
        return view("member.secret");
    }
}
