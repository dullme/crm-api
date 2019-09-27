<?php

namespace App\Http\Controllers;

use App\Http\Proxy\TokenProxy;
use App\Traits\PassportToken;
use App\User;
use App\VerificationCode;
use Carbon\Carbon;
use Illuminate\Http\Request;

class LoginController extends ResponseController {
    use PassportToken;

    protected $proxy;

    /**
     * LoginController constructor.
     * @param TokenProxy $proxy
     */
    public function __construct(TokenProxy $proxy) {
        $this->proxy = $proxy;
    }

    /**
     * 用户登录
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request)
    {
        $data = $request->validate(
            [
                'username' => 'required',
                'password' => 'required',
                'code' => 'required'
            ],
            [
                'username.required' => '请输入用户名',
                'password.required' => '请输入密码',
                'code.required' => '请输入验证码',
            ]
        );

        $user = User::where('username', $data['username'])->first();

        if(!$user){
            return $this->setStatusCode(422)->responseError('未注册');
        }


        $response = $this->getBearerTokenByUser($user, 2);
        $token = json_decode((string) $response->getBody(), true);

        return response()->json([
            'code' => 200,
            'data' => [
                'token'      => 'Bearer '.$token['access_token'],
                'auth_id'    => md5($token['refresh_token']),
                'expires_in' => $token['expires_in'],
            ],
            'message' => 'success'
        ], 200)->cookie('refreshToken', $token['refresh_token'], 14400, null, null, false, true);
    }

    /**
     * 用户注销
     * @return \Illuminate\Http\JsonResponse
     */
    public function userLogout() {

        return $this->proxy->logout();
    }

    /**
     * 重置 Token
     * @return mixed
     */
    public function refresh() {

        return $this->proxy->refresh();
    }

}
