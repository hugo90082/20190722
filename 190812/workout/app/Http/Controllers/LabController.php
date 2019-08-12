<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class LabController extends Controller
{
    //
    function index() {
        return "Lab Controller index action";
    }
    function show($id,$data, request $request) {
        dd([$id,$data,$request]);
    }
    function param(Request $request) {
        // dd($request->all());
        // dd($request->query('data'));
        // dd($request->input());
        //dd($request->input('data'));
        dd($request->data,"ver 2");
    }    
    function getForm() {
        return view("lab.aForm");
    }
    
    function postForm(Request $request) {
        // dd($request->input());
        dd($request->input('firstName'));
    }
    function xml(){
        $content = "<book><title>ooo</title><price>500</price></book>";
        return response($content, 200, 
            [
                'Content-Type' => 'application/xml'
            ]);
    }
    function memberOnly() {
        // if (使用者尚未登入) {
            return redirect('lab/form');
        // }
        // go ahead
    }


}
