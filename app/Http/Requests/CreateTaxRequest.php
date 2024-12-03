<?php

namespace App\Http\Requests;


use App\Models\Tax;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class CreateTaxRequest extends FormRequest
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
        $rules = Tax::$rules;

        $rules['name'] =  [
            'required',
            Rule::unique(Tax::class, 'name')
                ->where('user_id', $this->user()->id)
        ];
        return $rules;
    }
}
