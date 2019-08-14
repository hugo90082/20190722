<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class member extends Model
{
    protected $table = "member";
    protected $primaryKey = 'memberID';
    public $timestamps = false;

    function member() {
        return $this->hasOne(member::class, 'memberID');
    }

}
