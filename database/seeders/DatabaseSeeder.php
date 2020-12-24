<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use \App\Models\User;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $this->call('UsersTableSeeder');
        User::unguard();
        $this->call(UsersTableSeeder::class);
        User::reguard();
    }
}
