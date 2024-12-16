<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\MultiTenant;

class Stock extends Model
{
    use MultiTenant;
    
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'current_stocks';


    public function product()
    {
        return $this->belongsTo('App\Models\Product',"product_id")->withDefault();
    }

}