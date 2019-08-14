<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class message extends Model
{
    protected $table = "message";
    protected $primaryKey = 'ID';
    public $timestamps = false;

    function message() {
        return $this->hasOne(message::class, 'ID');
    }
}
