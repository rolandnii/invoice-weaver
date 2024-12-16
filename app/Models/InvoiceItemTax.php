<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\MultiTenant;

class InvoiceItemTax extends Model
{
    use MultiTenant;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'invoice_item_taxes';

    public function invoice_item()
    {
        return $this->belongsTo('App\Models\InvoiceItem',"invoice_item_id")->withDefault();
    }

}