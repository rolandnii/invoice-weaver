<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\MultiTenant;

class RepeatTransaction extends Model
{
    use MultiTenant;
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'repeating_transactions';
	
	public function account()
    {
        return $this->belongsTo('App\Models\Account')->withDefault();
    }
	
	public function income_type()
    {
        return $this->belongsTo('App\Models\ChartOfAccount',"chart_id")->withDefault();
    }
	
	public function payer()
    {
        return $this->belongsTo('App\Models\Contact',"payer_payee_id")->withDefault();
    }
	
	public function expense_type()
    {
        return $this->belongsTo('App\ChartOfAccount',"chart_id")->withDefault();
    }
	
	public function payee()
    {
        return $this->belongsTo('App\Models\Contact',"payer_payee_id")->withDefault();
    }
	
	public function payment_method()
    {
        return $this->belongsTo('App\Models\PaymentMethod',"payment_method_id")->withDefault();
    }

    public function getTransDateAttribute($value)
    {
		$date_format = get_date_format();
        return \Carbon\Carbon::parse($value)->format("$date_format");
    }
	
}