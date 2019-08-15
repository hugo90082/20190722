<?php

namespace App\Http\Controllers;
use App\Ticket;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
//use Illuminate\Http\Request;

class TicketsController extends Controller
{


    function index() {
        $amount = Ticket::find(1)->amount;
        return view("index", compact('amount'));
    }

    function buy() {
        DB::beginTransaction();
        $ticket = Ticket::find(1)->lockForUpdate()->first();
        // $ticket = Ticket::find(1);
        $ticket->amount -= 1;
        sleep(5);
        $ticket->save();
        DB::commit();
        $amount = $ticket->amount;
        return view("index",compact('amount'));
    }


}
