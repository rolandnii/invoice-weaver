<?php

namespace App\Models;

use App\Models\Scopes\CreateByScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @method static create(array $transactionData)
 */
class Transaction extends Model
{
    use HasFactory;

    protected $table = 'transactions';

    public $fillable = ['transaction_id', 'amount', 'user_id', 'status', 'meta'];

    protected $casts = [
        'transaction_id' => 'string',
        'amount' => 'double',
        'user_id' => 'integer',
        'meta' => 'json',
        'status' => 'integer',
    ];


    protected static function booted(): void
    {
        static::addGlobalScope(new CreateByScope);
        static::creating(function ($model) {
            $model->user_id = auth()->id();
        });
    }
}
