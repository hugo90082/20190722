<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Session;
use App\member;
use App\message;


class homeController extends Controller
{
    public function flush(){
        Session::flush();
        return redirect()->intended('/home');
    }
    
    public function authenticate(Request $request)
    {
        $item = member::where('name',$request->ID)->where('PWD',$request->password)->first();
        if(isset($item)){
            Session::put('memberID', $request->ID );
            return redirect()->intended('/home');
        }
           
        return redirect()->intended('/login');
    }
    public function login(Request $request)
    {
        return view("home.login");
    }
    public function details($id){
        $messageList = message::find($id);
        return view('home.details', compact('messageList'));

    }

    public function show(){
        //return view('home.login');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $messageList = message::all();
        return view("home.index", compact('messageList'));
    
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view("home.create");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)//新增
    {
        $item = new message();
        if($request->okOrCancel == "OK"){
            $item->topic = $request->topic;
            $item->content = $request->content;
            $item->save();
            return redirect("/home"); 
        }
        return redirect("/home");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // public function show($id)
    // {
    // }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $item = message::find($id);
        return view('home.edit', compact('item'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $item = message::find($id);
        if($request->okOrCancel == "OK"){
            $item->topic = $request->topic;
            $item->content = $request->content;
            $item->save();
            return redirect("/home");
        }
        return redirect("/home");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $item = message::find($id);
        $item->delete();
        return redirect("/home");
    }

}
