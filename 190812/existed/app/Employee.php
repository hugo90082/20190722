<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $table = "employees";
    protected $primaryKey = 'employeeId';

    function department() {
        return $this->hasOne(Department::class, 'departmentId');
    }
}



