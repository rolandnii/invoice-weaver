<?php

namespace App\Models;

use App\Models\Scopes\CreateByScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tax extends Model
{
    use HasFactory;

    protected $table = 'taxes';

    protected $fillable = ['name', 'value', 'is_default'];

    protected $casts = [
        'name' => 'string',
        'value' => 'double',
        'is_default' => 'boolean',
    ];

    public static $rules = [
        'name' => 'required',
        'value' => 'required|numeric',
    ];

    protected static function booted(): void
    {
        static::addGlobalScope(new CreateByScope);
        static::creating(function ($model) {
            $model->user_id = auth()->id();
        });
    }
}
