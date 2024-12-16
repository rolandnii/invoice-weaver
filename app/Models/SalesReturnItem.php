<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\MultiTenant;

class SalesReturnItem extends Model
{
    use MultiTenant;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'sales_return_items';

    public function item()
    {
        return $this->belongsTo('App\Models\Item',"product_id")->withDefault();
    }

    public function taxes()
    {
        return $this->hasMany('App\Models\SalesReturnItemTax',"sales_return_item_id");
    }
}