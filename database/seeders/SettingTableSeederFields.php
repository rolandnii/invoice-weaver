<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Seeder;

class SettingTableSeederFields extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Setting::create([
            'key' => 'company_address',
            'value' => fake()->address(),
        ]);
        Setting::create(['key' => 'company_phone', 'value' => '05505000']);
    }
}
