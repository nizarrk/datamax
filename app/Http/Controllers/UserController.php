<?php

namespace App\Http\Controllers;

use App\Http\Helper\ResponseBuilder;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Facades\JWTAuth;

class UserController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    
    private $payload;

    public function __construct()
    {
        $token = JWTAuth::getToken();
        $this->payload = JWTAuth::getPayload($token)->toArray();
    }

    public function profile(Request $request) 
    {
        // $token = JWTAuth::getToken();
        // $payload = JWTAuth::getPayload($token)->toArray();

        $out = [
            'status' => 200,
            'data'   => User::find($this->payload['sub'])
        ];
        
        return ResponseBuilder::result($out);
    }

    public function editProfile(Request $request)
    {
        $this->validate($request, [
            'name'  => 'required',
            'email' => 'required|email'
        ]);

        $check = User::firstWhere('email', $request->input('email'));

        if (!$check || ($check && $check->id == $this->payload['sub'])) {
            $data = [
                'name'  => $request->input('name'),
                'email' => $request->input('email')
            ];
    
            $user = User::find($this->payload['sub']);
            $update = $user->update($data);
     
            if ($update) {
                $out  = [
                    "status"    => 200,
                    "message"   => "Profile updated!",
                    "data"      => $update
                ];
            } else {
                $out  = [
                    "status"    => 400,
                    "message"   => "Failed updating profile!",
                    "data"      => $update,
                ];
            }
    
            return ResponseBuilder::result($out);
        } else {
            $out  = [
                "status"   => 400,
                "message"  => "Email already in use!"
            ];
        }

        return ResponseBuilder::result($out);
    }

    public function changePassword(Request $request)
    {
        $this->validate($request, [
            'password'  => 'required'
        ]);

        $user = User::find($this->payload['sub']);

        // Verify the password and generate the token
        if (Hash::check($request->input('password'), $user->password)) {
            $out  = [
                "status"  => 400,
                "message" => "New password cannot be same as previous password!"
            ];

            return ResponseBuilder::result($out);
        } else {
            $update = $user->update(['password' => password_hash($request->input('password'), PASSWORD_BCRYPT)]);
     
            if ($update) {
                $out  = [
                    "status"    => 200,
                    "message"   => "Profile updated!",
                    "data"      => $update
                ];
            } else {
                $out  = [
                    "status"    => 400,
                    "message"   => "Failed updating profile!",
                    "data"      => $update,
                ];
            }

            return ResponseBuilder::result($out);
        }
        
    }
}
