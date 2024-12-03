<?php

namespace App\Models\Scopes;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope;
use Illuminate\Support\Facades\Schema;

class CreateByScope implements Scope
{
    /**
     * Apply the scope to a given Eloquent query builder.
     */
    public function apply(Builder $builder, Model $model): void
    {
        if (Schema::hasColumn($model->getTable(), 'user_id')) {
            $user = auth()->user();
            if ($user) {
                $builder->where($model->getTable().'.user_id', $user->id);
            }
        }
    }
}
