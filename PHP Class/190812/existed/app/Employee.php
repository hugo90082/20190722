<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $table = "employees";
    protected $primaryKey = 'employeeId';
    public $timestamps = false;
    
    function department() {
        return $this->hasOne(Department::class, 'departmentId');
    }
}



