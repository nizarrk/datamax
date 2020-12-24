<?php

use Laravel\Lumen\Testing\DatabaseMigrations;
use Laravel\Lumen\Testing\DatabaseTransactions;

class AuthTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testShouldCreateUser()
    {
        $data = [
            'name' => 'Testing',
            'email' => 'testing1@test.com', // replace email each test so it wont return error duplicate
            'password' => '123456'
        ];

        $this->post("auth/register", $data, []);
        $this->seeStatusCode(200);        
    }

    public function testShouldLogInUser()
    {
        $data = [
            'email' => 'testing1@test.com', 
            'password' => '123456'
        ];

        $this->post("auth/login", $data, []);
        $this->seeStatusCode(200);        
    }

    public function testShouldLogOutUser()
    {
        $token = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MDg4MTc5MTcsImV4cCI6MTYwODgyMTUxNywibmJmIjoxNjA4ODE3OTE3LCJqdGkiOiJkS3hPS3NyOTJ5U0tDNUVHIiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.vzJwmLYqdlSZbJyk_8koEd_WC2LeL5CrAbHHEPtfNHk';

        $this->post("auth/login", [],['Authorization' => $token]);
        $this->seeStatusCode(200);        
    }
}
