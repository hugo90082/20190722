<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    //
    function index() {
        return view('home.index');
    }
    // function sayHello(Request $request) {
    //      dd($request);
    //      dd($request->input("userName"));
    //      抓到HTML那格子的資料
    //      dd($request->userName);
    //     return "Hello! " . $request->userName;
    // }

    function sayHello(Request $request) {
        return view("home.hello", 
            [ "who" => $request->userName,
            "hugo" => "HHHH"
            ]);
        return view("home.hello")->withWho($request->userName);
    }
}
