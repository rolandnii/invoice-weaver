<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Setting;
use Illuminate\Http\Request;
use App\Models\DatabaseBackup;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Response;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Cache; // Update this line

class UtilityController extends Controller {
    /**
     * Show the Settings Page.
     *
     * @return Response
     */

    public function __construct() {
        header('Cache-Control: no-cache');
        header('Pragma: no-cache');
        date_default_timezone_set(get_option('timezone', 'Asia/Dhaka'));
    }

   

    public function showSettingsForm()
{
    return view('backend.administration.general_settings.settings');
}

public function storeSettings(Request $request)
{
    try {
        // Define validation rules
        $validationRules = [
            'company_name' => 'sometimes|string|max:255',
            'site_title' => 'sometimes|string|max:255',
            'phone' => 'nullable|string|max:20',
            'email' => 'nullable|email',
            'timezone' => 'sometimes|string',
            'language' => 'nullable|string',
            'address' => 'nullable|string',
            'favicon' => 'sometimes|file|mimes:png|max:2048',
            'membership_system' => 'sometimes|string|in:enabled,disabled',
            'trial_period' => 'sometimes|integer|min:0|max:30',
            'monthly_cost' => 'sometimes|numeric|min:0',
            'yearly_cost' => 'sometimes|numeric|min:0',
            'backend_direction' => 'sometimes|in:ltr,rtl',
            'currency' => 'sometimes|string',
            'currency_position' => 'sometimes|in:left,right',
            'thousand_sep' => 'sometimes|string',
            'decimal_sep' => 'sometimes|string',
            'decimal_places' => 'sometimes|numeric|min:0',
            'date_format' => 'sometimes|string',
            'time_format' => 'sometimes|in:24,12',
            'allow_singup' => 'sometimes|in:yes,no',
            'email_verification' => 'sometimes|in:enabled,disabled',

           'paypal_active' => 'sometimes|in:Yes,No',
            'paypal_mode' => 'sometimes|in:sandbox,production',
            'paypal_client_id' => 'sometimes|string',
            'paypal_secret' => 'sometimes|string',
            'stripe_active' => 'sometimes|in:Yes,No',
            'stripe_secret_key' => 'sometimes|string',
            'stripe_publishable_key' => 'sometimes|string',

            'mail_type' => 'sometimes|in:smtp,sendmail',
            'from_email' => 'sometimes|email',
            'from_name' => 'sometimes|string',
            'smtp_host' => 'sometimes|string',
            'smtp_port' => 'sometimes|numeric',
            'smtp_username' => 'sometimes|string',
            'smtp_password' => 'sometimes|string',
            'smtp_encryption' => 'sometimes|in:none,ssl,tls',

            'google_login' => 'sometimes|in:enabled,disabled',
            'GOOGLE_CLIENT_ID' => 'sometimes|string',
            'GOOGLE_CLIENT_SECRET' => 'sometimes|string',
            'facebook_login' => 'sometimes|in:enabled,disabled',
            'FACEBOOK_CLIENT_ID' => 'sometimes|string',
            'FACEBOOK_CLIENT_SECRET' => 'sometimes|string',
        ];

        // Validate request data
        $validator = Validator::make($request->all(), $validationRules);

        if ($validator->fails()) {
            Log::error('Validation Errors:', $validator->errors()->all());
            return Redirect::back()->withErrors($validator)->withInput();
        }

        $validatedData = $validator->validated();

        Log::info('Validated Data:', $validatedData);

        // Begin database transaction
        DB::beginTransaction();

        try {
            foreach ($validatedData as $key => $value) {
                if ($request->hasFile($key)) {
                    $this->upload_favicon($key, $request);
                } else {
                    $data = [
                        'value' => $value,
                        'updated_at' => now(),
                    ];

                    if (Setting::where('name', $key)->exists()) {
                        Setting::where('name', $key)->update($data);
                        Cache::forget($key);
                    } else {
                        $data['name'] = $key;
                        $data['created_at'] = now();
                        Setting::insert($data);
                    }

                    Cache::put($key, $value);
                }
            }

            // Clear specific caches
            Cache::forget('currency_position');
            Cache::forget('currency');
            Cache::forget('date_format');
            Cache::forget('time_format');
            Cache::forget('language');

            // Commit transaction
            DB::commit();

            // Return response based on request type
            if (!$request->ajax()) {
                return redirect()->route('settings.show_settings_form')->with('success', _lang('Saved Successfully'));
            } else {
                return response()->json(['result' => 'success', 'action' => 'update', 'message' => _lang('Saved Successfully')]);
            }
        } catch (\Exception $e) {
            // Rollback transaction on error
            DB::rollBack();

            // Log the exception
            Log::error($e);

            // Return error response
            return back()->with('error', 'An error occurred while saving settings. Please try again.');
        }
    } catch (\Exception $e) {
        // Log unexpected exceptions
        Log::error($e);

        // Return error response
        return back()->with('error', 'An unexpected error occurred. Please contact support.');
    }
}

private function upload_favicon($file_name, Request $request)
{
    if ($request->hasFile($file_name)) {
        $file = $request->file($file_name);
        $name = $file_name . '_' . time() . "." . $file->getClientOriginalExtension();
        $destinationPath = public_path('/uploads/media');
        $file->move($destinationPath, $name);

        $data = [
            'value' => $name,
            'updated_at' => Carbon::now(),
        ];

        if (Setting::where('name', 'favicon')->exists()) {
            Setting::where('name', 'favicon')->update($data);
        } else {
            $data['name'] = 'favicon';
            $data['created_at'] = Carbon::now();
            Setting::insert($data);
        }

        Cache::put('favicon', $name);
    }
}






public function upload_logo(Request $request)
{
    $validator = Validator::make($request->all(), [
        'logo' => 'required|image|mimes:jpeg,png,jpg|max:8192',
    ]);

    if ($validator->fails()) {
        return Redirect::back()->withErrors($validator)->withInput();
    }

    if ($request->hasFile('logo')) {
        $image = $request->file('logo');
        $name = 'logo.' . $image->getClientOriginalExtension();
        $destinationPath = public_path('/uploads/media');
        $image->move($destinationPath, $name);

        $data = [
            'value' => $name,
            'updated_at' => now(),
        ];

        if (Setting::where('name', "logo")->exists()) {
            Setting::where('name', '=', "logo")->update($data);
        } else {
            $data['name'] = "logo";
            $data['created_at'] = now();
            Setting::insert($data);
        }

        Cache::put("logo", $name);

        if (!$request->ajax()) {
            return redirect()->route('settings.show_settings_form')->with('success', _lang('Saved Successfully'));
        } else {
            return Response::json(['result' => 'success', 'action' => 'update', 'message' => _lang('Logo Upload successfully')]);
        }
    }
}

    public function upload_file($file_name, Request $request) {

        if ($request->hasFile($file_name)) {
            $file            = $request->file($file_name);
            $name            = 'file_' . time() . "." . $file->getClientOriginalExtension();
            $destinationPath = public_path('/uploads/media');
            $file->move($destinationPath, $name);

            $data               = array();
            $data['value']      = $name;
            $data['updated_at'] = Carbon::now();

            if (Setting::where('name', $file_name)->exists()) {
                Setting::where('name', '=', $file_name)->update($data);
            } else {
                $data['name']       = $file_name;
                $data['created_at'] = Carbon::now();
                Setting::insert($data);
            }
            Cache::put($file_name, $name);
        }
    }

    public function theme_option($store = '', Request $request) {
        if ($store == '') {
            $theme = get_option('active_theme', 'default');
            return view("theme.$theme.theme_option.theme_option");
        } else {
            foreach ($_POST as $key => $value) {
                if ($key == "_token") {
                    continue;
                }

                $data               = array();
                $data['value']      = is_array($value) ? serialize($value) : $value;
                $data['updated_at'] = Carbon::now();
                if (Setting::where('name', $key)->exists()) {
                    Setting::where('name', '=', $key)->update($data);
                } else {
                    $data['name']       = $key;
                    $data['created_at'] = Carbon::now();
                    Setting::insert($data);
                }

            } //End $_POST Loop

            //Upload File
            foreach ($_FILES as $key => $value) {
                $this->upload_file($key, $request);
            }

            if (!$request->ajax()) {
                return back()->with('success', _lang('Saved sucessfully'));
            } else {
                return response()->json(['result' => 'success', 'action' => 'update', 'message' => _lang('Saved sucessfully')]);
            }
        }
    }

    /**
     * Display a list of database backup
     *
     * @return \Illuminate\Http\Response
     */
    public function database_backup_list() {
        $databasebackups = \App\Models\DatabaseBackup::all()->sortByDesc("id");
        return view('backend.administration.database_backup.list', compact('databasebackups'));
    }

    public function create_database_backup() {
        @ini_set('max_execution_time', 0);
        @set_time_limit(0);

        $return   = "";
        $database = 'Tables_in_' . DB::getDatabaseName();
        $tables   = array();
        $result   = DB::select("SHOW TABLES");

        foreach ($result as $table) {
            $tables[] = $table->$database;
        }

        //loop through the tables
        foreach ($tables as $table) {
            $return .= "DROP TABLE IF EXISTS $table;";

            $result2 = DB::select("SHOW CREATE TABLE $table");
            $row2    = $result2[0]->{'Create Table'};

            $return .= "\n\n" . $row2 . ";\n\n";

            $result = DB::select("SELECT * FROM $table");

            foreach ($result as $row) {
                $return .= "INSERT INTO $table VALUES(";
                foreach ($row as $key => $val) {
                    $return .= "'" . addslashes($val) . "',";
                }
                $return = substr_replace($return, "", -1);
                $return .= ");\n";
            }

            $return .= "\n\n\n";
        }

        //save file
        $file_name = 'DB-BACKUP-' . time() . '.sql';
        $file      = 'backup/DB-BACKUP-' . $file_name;
        $handle    = fopen($file, 'w+');
        fwrite($handle, $return);
        fclose($handle);

        $databasebackup          = new \App\Models\DatabaseBackup();
        $databasebackup->file    = $file_name;
        $databasebackup->user_id = Auth::id();

        $databasebackup->save();

        return back()->with('success', _lang('Backup Created Sucessfully'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function download_database_backup($id) {
        $databasebackup = \App\Models\DatabaseBackup::find($id);
        $file           = '/backup/DB-BACKUP-' . $databasebackup->file;
        return response()->download($file);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy_database_backup($id) {
        $databasebackup = DatabaseBackup::find($id);
        $file           = 'backup/DB-BACKUP-' . $databasebackup->file;
        $databasebackup->delete();
        unlink($file);

        return redirect()->route('database_backups.list')->with('success', _lang('Deleted Sucessfully'));
    }

    public function remove_cache(Request $request) {
        $this->validate($request, [
            'cache' => 'required',
        ]);

        if (isset($_POST['cache']['view_cache'])) {
            Artisan::call('view:clear');
        }

        if (isset($_POST['cache']['application_cache'])) {
            Artisan::call('cache:clear');
        }

        return back()->with('success', _lang('Cache Removed Sucessfully'));
    }

}