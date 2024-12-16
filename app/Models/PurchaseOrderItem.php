<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\MultiTenant;

class PurchaseOrderItem extends Model
{
    use MultiTenant;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'purchase_order_items';

    public function item()
    {
        return $this->belongsTo('App\Models\Item',"product_id")->withDefault();
    }

    public function taxes()
    {
        return $this->hasMany('App\Models\PurchaseOrderItemTax',"purchase_order_item_id");
    }
}