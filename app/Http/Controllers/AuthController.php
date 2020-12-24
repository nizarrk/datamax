<?php

namespace App\Http\Controllers;
use Validator;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Laravel\Lumen\Routing\Controller as BaseController;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Http\Helper\ResponseBuilder;

class AuthController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */

    public function __construct()
    {

    }

    public function register(Request $request)
    {
        if ($request->isMethod('post')) {
 
            $this->validate($request, [
                'name'      => 'required',
                'email'     => 'required|email',
                'password'  => 'required'
            ]);

            $check = User::firstWhere('email', $request->input('email'));

            if (!$check) {
                $data = [
                    'name'      => $request->input('name'),
                    'email'     => $request->input('email'),
                    'password'  => password_hash($request->input('password'), PASSWORD_BCRYPT)
                ];
     
                $insert = User::create($data);
     
                if ($insert) {
                    $out  = [
                        "status"  => 200,
                        "message" => "Success insert data!",
                        "data"    => $data
                    ];
                } else {
                    $out  = [
                        "status"   => 400,
                        "message"  => "Failed insert data!",
                        "data"     => $data
                    ];
                }
            } else {
                $out  = [
                    "status"   => 400,
                    "message"  => "Duplicate Email!"
                ];
            }

            return ResponseBuilder::result($out);
        }
    }

    public function login(Request $request) 
    {
          //validate incoming request 
          $this->validate($request, [
            'email'    => 'required|string|email',
            'password' => 'required|string',
        ]);

        // Get some user from somewhere
        $user = User::firstwhere('email', $request->input('email'));

        if (!$user) {
            $out  = [
                "status"  => 404,
                "message" => "Email does not exist!",
            ];

            return ResponseBuilder::result($out);
        }
        // Verify the password and generate the token
        if (Hash::check($request->input('password'), $user->password)) {
            // Get the token
            $token = Auth::login($user);

            $out  = [
                "status"  => 200,
                "data"    => [
                    "token"      => $token,
                    'token_type' => 'bearer',
                    'expires_in' => Auth::factory()->getTTL() * 60
                ]
            ];

            return ResponseBuilder::result($out);
        } else {
            $out  = [
                "status"  => 400,
                "message" => "Email or password is wrong!",
            ];

            return ResponseBuilder::result($out);
        }
    }

    public function logout() 
    {
        // Get JWT Token from the request header key "Authorization"
        // Invalidate the token
        try {
            JWTAuth::invalidate(JWTAuth::getToken());
            $out  = [
                "status"  => 200,
                "message" => "User successfully logged out!",
            ];

            return ResponseBuilder::result($out);
        } catch (JWTException $e) {
            // something went wrong whilst attempting to encode the token
            $out  = [
                "status"  => 500,
                "message" => "Failed to logout, please try again.",
                "data"    => $e
            ];

            return ResponseBuilder::result($out);
        }
}
}
