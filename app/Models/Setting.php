<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */

     protected $fillable = ['name', 'value', 'created_at', 'updated_at'];




    protected $table = 'settings';
}