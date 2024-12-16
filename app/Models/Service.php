<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'services';


    public function tax()
    {
        return $this->belongsTo('App\Models\Tax',"tax_id")->withDefault();
    }
}