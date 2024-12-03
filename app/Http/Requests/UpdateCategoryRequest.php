<?php

namespace App\Http\Requests;

use App\Models\Category;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UpdateCategoryRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     */
    public function rules(): array
    {
        $rule = Category::$rules;
        $rule['name'] = ['required',
            Rule::unique(Category::class, 'name')
            ->where('user_id', $this->user()->id)
            ->ignore($this->route('category'))
        ];

        return $rule;
    }
}
