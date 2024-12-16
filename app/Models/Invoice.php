<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\MultiTenant;

class Invoice extends Model
{
    use MultiTenant;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'invoices';
    
	public function invoice_items()
    {
        return $this->hasMany('App\Models\InvoiceItem',"invoice_id");
    }

    public function taxes()
    {
        return $this->hasMany('App\Models\InvoiceItemTax',"invoice_id");
    }

    public function client()
    {
        return $this->belongsTo('App\Models\Contact',"client_id")->withDefault();
    }

    public function getDueDateAttribute($value)
    {
		$date_format = get_date_format();
        return \Carbon\Carbon::parse($value)->format("$date_format");
    }

    public function getInvoiceDateAttribute($value)
    {
		$date_format = get_date_format();
        return \Carbon\Carbon::parse($value)->format("$date_format");
    }

}