<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->post(
    'auth/login', 
    [
       'uses' => 'AuthController@login'
    ]
);

$router->post(
    'auth/register', 
    [
       'uses' => 'AuthController@register'
    ]
);

$router->group(
    ['middleware' => 'auth'], 
    function() use ($router) {
        $router->post('auth/logout', 
            [
                'uses' => 'AuthController@logout'
            ]
        );

        $router->get('user/profile', 
            [
                'uses' => 'UserController@profile'
            ]
        );

        $router->put('user/profile', 
            [
                'uses' => 'UserController@editProfile'
            ]
        );

        $router->put('user/profile/password', 
            [
                'uses' => 'UserController@changePassword'
            ]
        );

        /* CATEGORY ROUTES*/
        $router->get('category', 
            [
                'uses' => 'CategoryController@show'
            ]
        );

        $router->post('category', 
            [
                'uses' => 'CategoryController@store'
            ]
        );

        $router->put('category', 
            [
                'uses' => 'CategoryController@update'
            ]
        );  

        $router->delete('category/{id}', 
            [
                'uses' => 'CategoryController@destroy'
            ]
        );

        /* PRODUCT ROUTES*/
        $router->get('product', 
            [
                'uses' => 'ProductController@show'
            ]
        );

        $router->get('product/{id}', 
            [
                'uses' => 'ProductController@showById'
            ]
        );

        $router->post('product', 
            [
                'uses' => 'ProductController@store'
            ]
        );

        $router->put('product', 
            [
                'uses' => 'ProductController@update'
            ]
        );  

        $router->delete('product/{id}', 
            [
                'uses' => 'ProductController@destroy'
            ]
        );
    }
);
