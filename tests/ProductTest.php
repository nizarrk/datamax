<?php

use Laravel\Lumen\Testing\DatabaseMigrations;
use Laravel\Lumen\Testing\DatabaseTransactions;

class ProductTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testShouldReturnAllProducts()
    {
        $token = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MDg4MTcwNjcsImV4cCI6MTYwODgyMDY2NywibmJmIjoxNjA4ODE3MDY3LCJqdGkiOiJoa0JxanRyRUx1WFNwcWM0Iiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.LC1KikaU5XTJAw-ulRfhvMWdmnUJuPL81lC48z2cfz8';

        $this->get("products", ['Authorization' => $token]);
        $this->seeStatusCode(200);
        
    }

    /**
     * /products/id [GET]
     */
    public function testShouldReturnProduct()
    {
        $token = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MDg4MTcwNjcsImV4cCI6MTYwODgyMDY2NywibmJmIjoxNjA4ODE3MDY3LCJqdGkiOiJoa0JxanRyRUx1WFNwcWM0Iiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.LC1KikaU5XTJAw-ulRfhvMWdmnUJuPL81lC48z2cfz8';

        $this->get("products/2", ['Authorization' => $token]);
        $this->seeStatusCode(200);
        
    }

    /**
     * /products [POST]
     */
    public function testShouldCreateProduct()
    {
        $token = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MDg4MTcwNjcsImV4cCI6MTYwODgyMDY2NywibmJmIjoxNjA4ODE3MDY3LCJqdGkiOiJoa0JxanRyRUx1WFNwcWM0Iiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.LC1KikaU5XTJAw-ulRfhvMWdmnUJuPL81lC48z2cfz8';

        $data = [
            'name' => 'Infinix Hot Note',
            'price' => 200000,
            'category_id' => 8
        ];

        $this->post("products", $data, ['Authorization' => $token]);
        $this->seeStatusCode(200);
        
    }
    
    /**
     * /products/id [PUT]
     */
    public function testShouldUpdateProduct()
    {
        $token = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MDg4MTcwNjcsImV4cCI6MTYwODgyMDY2NywibmJmIjoxNjA4ODE3MDY3LCJqdGkiOiJoa0JxanRyRUx1WFNwcWM0Iiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.LC1KikaU5XTJAw-ulRfhvMWdmnUJuPL81lC48z2cfz8';

        $data = [
            'name' => 'Infinix Hot Note',
            'price' => 200000,
            'category_id' => 8,
            'id' => 2
        ];

        $this->put("products/4", $data, ['Authorization' => $token]);
        $this->seeStatusCode(200);
    }

    /**
     * /products/id [DELETE]
     */
    public function testShouldDeleteProduct()
    {
        $token = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXV0aFwvbG9naW4iLCJpYXQiOjE2MDg4MTcwNjcsImV4cCI6MTYwODgyMDY2NywibmJmIjoxNjA4ODE3MDY3LCJqdGkiOiJoa0JxanRyRUx1WFNwcWM0Iiwic3ViIjoxLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.LC1KikaU5XTJAw-ulRfhvMWdmnUJuPL81lC48z2cfz8';
        
        $this->delete("products/5", [], ['Authorization' => $token]);
        $this->seeStatusCode(200);
    }
}
