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
                'mobile' => 'required|mobile',
                'code' => 'required'
            ],
            [
                'mobile.required' => '请输入手机号',
                'mobile.mobile' => '手机号格式错误',
                'code.required' => '请输入验证码',
            ]
        );

        $user = User::where('mobile', $data['mobile'])->first();

        if(!$user){
            return $this->setStatusCode(422)->responseError('未注册');
        }

        //查询用户是否有生效中的验证码
        $verificationCode = VerificationCode::where([
            'type' => 1, //短信登录验证码
            'mobile' => $data['mobile'],
            'is_used' => false,
        ])->where('updated_at', '>=', Carbon::now()->subMinutes(5))
            ->orderBy('id', 'DESC')
            ->first();

        //数据库是否存在验证码
        //数据库中的验证码是否和用户输入的一致
        if(!$verificationCode || $verificationCode->code != $data['code']){
            return $this->setStatusCode(422)->responseError('验证码错误！');
        }

//        $user = User::firstOrCreate(
//            ['mobile' => $data['mobile']],
//            [
//                'mobile' => $data['mobile'],
//                'password' => bcrypt(randStr(20)),
//                'name' => substr($data['mobile'], -4)
//            ]
//        );

        $response = $this->getBearerTokenByUser($user, 2);
        $token = json_decode((string) $response->getBody(), true);

        $verificationCode->is_used = true;
        $verificationCode->save();

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
