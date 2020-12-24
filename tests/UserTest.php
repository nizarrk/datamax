<?php

use Laravel\Lumen\Testing\DatabaseMigrations;
use Laravel\Lumen\Testing\DatabaseTransactions;

class UserTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testShouldReturnProfile()
    {

        $token = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MDg4MTcwNjcsImV4cCI6MTYwODgyMDY2NywibmJmIjoxNjA4ODE3MDY3LCJqdGkiOiJoa0JxanRyRUx1WFNwcWM0Iiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.LC1KikaU5XTJAw-ulRfhvMWdmnUJuPL81lC48z2cfz8';

        $this->get("user/profile", ['Authorization' => $token]);
        $this->seeStatusCode(200);        
    }
}
