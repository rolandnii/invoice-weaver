<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Setting;
use Illuminate\Http\Request;
use App\Models\CompanySetting;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class CompanySettingsController extends Controller {
    public function __construct() {
        header('Cache-Control: no-cache');
        header('Pragma: no-cache');
    }

    public function settings(Request $request, $store = null) {
        try {
            if (is_null($store)) {
                return view('backend.accounting.general_settings.settings');
            } else {
                $company_id = company_id();
                
                // Extract all POST data except the _token
                $settings = $request->except('_token');
                
                foreach ($settings as $key => $value) {
                    $data = [
                        'value'      => $value,
                        'company_id' => $company_id,
                        'updated_at' => Carbon::now()
                    ];

                    if (CompanySetting::where('name', $key)->where('company_id', $company_id)->exists()) {
                        Log::info(1);
                        Log::info($data);

                        CompanySetting::where('name', $key)
                            ->where('company_id', $company_id)
                            ->update($data);

                    } else {
                        $data['name']       = $key;
                        $data['created_at'] = Carbon::now();
                        Log::info($key);
                        Log::info(2);
                        Log::info($data);

                        CompanySetting::insert($data);
                    }
                }

                return !$request->ajax()
                    ? redirect()->route('company.change_settings')->with('success', _lang('Saved Successfully'))
                    : response()->json(['result' => 'success', 'action' => 'update', 'message' => _lang('Saved Successfully')]);
            }
        } catch (\Exception $e) {
            report($e);
            Log::error('Error updating company settings: ' . $e->getMessage());
            return !$request->ajax()
                ? redirect()->route('company.change_settings')->with('error', _lang('An error occurred while saving settings.'))
                : response()->json(['result' => 'error', 'message' => _lang('An error occurred while saving settings.')]);
        }
    }

    public function upload_logo(Request $request) {
        $validator = Validator::make($request->all(), [
            'logo' => 'required|image|mimes:jpeg,png,jpg|max:8192',
        ]);

        if ($validator->fails()) {
            return !$request->ajax()
                ? redirect()->route('company.change_settings')->withErrors($validator)->withInput()
                : response()->json(['result' => 'error', 'message' => $validator->errors()->first()]);
        }

        try {
            $company_id = company_id();

            if ($request->hasFile('logo')) {
                $image = $request->file('logo');
                $name = 'company_logo_' . time() . '.' . $image->getClientOriginalExtension();
                $destinationPath = public_path('/uploads/company');
                $image->move($destinationPath, $name);

                $data = [
                    'value'      => $name,
                    'company_id' => $company_id,
                    'updated_at' => Carbon::now()
                ];

                if (CompanySetting::where('name', 'company_logo')->where('company_id', $company_id)->exists()) {
                    CompanySetting::where('name', 'company_logo')
                        ->where('company_id', $company_id)
                        ->update($data);
                } else {
                    $data['name']       = 'company_logo';
                    $data['created_at'] = Carbon::now();
                    CompanySetting::insert($data);
                }

                return !$request->ajax()
                    ? redirect()->route('company.change_settings')->with('success', _lang('Logo Uploaded Successfully'))
                    : response()->json(['result' => 'success', 'action' => 'update', 'message' => _lang('Logo Uploaded Successfully')]);
            }
        } catch (\Exception $e) {
            Log::error('Error uploading company logo: ' . $e->getMessage());
            return !$request->ajax()
                ? redirect()->route('company.change_settings')->with('error', _lang('An error occurred while uploading the logo.'))
                : response()->json(['result' => 'error', 'message' => _lang('An error occurred while uploading the logo.')]);
        }
    }

    public function upload_file($file_name, Request $request) {
        try {
            if ($request->hasFile($file_name)) {
                $file = $request->file($file_name);
                $name = 'file_' . time() . '.' . $file->getClientOriginalExtension();
                $destinationPath = public_path('/uploads/media');
                $file->move($destinationPath, $name);

                $data = [
                    'value'      => $name,
                    'company_id' => company_id(),
                    'updated_at' => Carbon::now()
                ];

                if (Setting::where('name', $file_name)->exists()) {
                    Setting::where('name', $file_name)->update($data);
                } else {
                    $data['name']       = $file_name;
                    $data['created_at'] = Carbon::now();
                    Setting::insert($data);
                }
            }
        } catch (\Exception $e) {
            Log::error('Error uploading file: ' . $e->getMessage());
            return !$request->ajax()
                ? redirect()->route('company.change_settings')->with('error', _lang('An error occurred while uploading the file.'))
                : response()->json(['result' => 'error', 'message' => _lang('An error occurred while uploading the file.')]);
        }
    }
}
