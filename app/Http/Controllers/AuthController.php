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
                        "name" => "OK",
                        "status"  => 200,
                        "message" => "Success insert data!",
                        "data" => $data
                    ];
                } else {
                    $out  = [
                        "name" => "ERR",
                        "status"   => 400,
                        "message" => "Failed insert data!",
                        "data" => $data
                    ];
                }
            } else {
                $out  = [
                    "name" => "ERR",
                    "status"   => 400,
                    "message" => "Duplicate Email!",
                    "data" => []
                ];
            }
 
 
            return response()->json($out, $out['status']);
        }
    }

    public function login(Request $request) 
    {
          //validate incoming request 
          $this->validate($request, [
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        // Get some user from somewhere
        $user = User::firstwhere('email', $request->input('email'));

        if (!$user) {
            // You wil probably have some sort of helpers or whatever
            // to make sure that you have the same response format for
            // differents kind of responses. But let's return the 
            // below respose for now.
            return response()->json([
                'error' => 'Email does not exist.'
            ], 400);
        }
        // Verify the password and generate the token
        if (Hash::check($request->input('password'), $user->password)) {
            // Get the token
            $token = Auth::login($user);

            return response()->json([
                'data' => $token
            ], 200);
        }
                
        // Bad Request response
        return response()->json([
            'error' => 'Email or password is wrong.'
        ], 400);

        // Get the token
        $token = Auth::login($user);

        $credentials = $request->only(['email', 'password']);

        if (! $token = Auth::attempt($credentials)) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        return response()->json([
            'token' => $token,
            'token_type' => 'bearer',
            'expires_in' => Auth::factory()->getTTL() * 60
        ], 200);
    }

    public function logout() 
    {
        // Get JWT Token from the request header key "Authorization"
        // Invalidate the token
        try {
            JWTAuth::invalidate(JWTAuth::getToken());
            return response()->json([
                "status" => "success", 
                "message"=> "User successfully logged out."
            ]);
        } catch (JWTException $e) {
            // something went wrong whilst attempting to encode the token
            return response()->json([
            "status" => "error", 
            "message" => "Failed to logout, please try again."
            ], 500);
        }
}
}
