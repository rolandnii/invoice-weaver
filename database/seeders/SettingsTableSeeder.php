<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Seeder;

class SettingsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $imageUrl = 'images/white-logo.png';


        Setting::create(['key' => 'app_name', 'value' => 'Invoice Weaver']);
        Setting::create(['key' => 'app_logo', 'value' => $imageUrl]);
        Setting::create(['key' => 'company_name', 'value' => 'Cyclux']);
        Setting::create(['key' => 'company_logo', 'value' => $imageUrl]);
        Setting::create(['key' => 'date_format', 'value' => 'Y-m-d']);
        Setting::create(['key' => 'time_format', 'value' => '0']);
        Setting::create(['key' => 'time_zone', 'value' => 'GMT']);
        Setting::create(['key' => 'current_currency', 'value' => '2']);
        Setting::create(['key' => 'decimal_separator', 'value' => '.']);
        Setting::create(['key' => 'thousand_separator', 'value' => ',']);
        Setting::create(['key' => 'paypal_enabled', 'value' => '0']);
        Setting::create(['key' => 'razorpay_enabled', 'value' => '0']);
        Setting::create(['key' => 'stripe_enabled', 'value' => '0']);
        Setting::create(['key' => 'stripe_key', 'value' => '0']);
    }
}
