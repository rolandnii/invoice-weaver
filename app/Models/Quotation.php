<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\MultiTenant;

class Quotation extends Model
{
    use MultiTenant;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'quotations';
    
	public function quotation_items()
    {
        return $this->hasMany('App\Models\QuotationItem',"quotation_id");
    }

    public function client()
    {
        return $this->belongsTo('App\Models\Contact',"client_id")->withDefault();
    }

    public function getQuotationDateAttribute($value)
    {
		$date_format = get_date_format();
        return \Carbon\Carbon::parse($value)->format("$date_format");
    }

    public function taxes()
    {
        return $this->hasMany('App\QuotationItemTax',"quotation_id");
    }

}