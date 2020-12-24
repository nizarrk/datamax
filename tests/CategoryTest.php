<?php

use Laravel\Lumen\Testing\DatabaseMigrations;
use Laravel\Lumen\Testing\DatabaseTransactions;

class CategoryTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testShouldReturnAllCategory()
    {
        $token = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MDg4MTcwNjcsImV4cCI6MTYwODgyMDY2NywibmJmIjoxNjA4ODE3MDY3LCJqdGkiOiJoa0JxanRyRUx1WFNwcWM0Iiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.LC1KikaU5XTJAw-ulRfhvMWdmnUJuPL81lC48z2cfz8';

        $this->get("category", ['Authorization' => $token]);
        $this->seeStatusCode(200);
        
    }

    /**
     * /products [POST]
     */
    public function testShouldCreateCategory()
    {
        $token = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MDg4MTcwNjcsImV4cCI6MTYwODgyMDY2NywibmJmIjoxNjA4ODE3MDY3LCJqdGkiOiJoa0JxanRyRUx1WFNwcWM0Iiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.LC1KikaU5XTJAw-ulRfhvMWdmnUJuPL81lC48z2cfz8';

        $data = [
            'name' => 'Furniture'
        ];

        $this->post("category", $data, ['Authorization' => $token]);
        $this->seeStatusCode(200);
        
    }
    
    /**
     * /products/id [PUT]
     */
    public function testShouldUpdateCategory()
    {
        $token = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MDg4MTcwNjcsImV4cCI6MTYwODgyMDY2NywibmJmIjoxNjA4ODE3MDY3LCJqdGkiOiJoa0JxanRyRUx1WFNwcWM0Iiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.LC1KikaU5XTJAw-ulRfhvMWdmnUJuPL81lC48z2cfz8';

        $data = [
            'name' => 'Furniture'
        ];

        $this->put("category/4", $data, ['Authorization' => $token]);
        $this->seeStatusCode(200);
    }

    /**
     * /products/id [DELETE]
     */
    public function testShouldDeleteCategory()
    {
        $token = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MDg4MTcwNjcsImV4cCI6MTYwODgyMDY2NywibmJmIjoxNjA4ODE3MDY3LCJqdGkiOiJoa0JxanRyRUx1WFNwcWM0Iiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.LC1KikaU5XTJAw-ulRfhvMWdmnUJuPL81lC48z2cfz8';
        
        $this->delete("category/5", [], ['Authorization' => $token]);
        $this->seeStatusCode(200);
    }
}
