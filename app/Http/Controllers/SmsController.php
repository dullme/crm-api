<?php

namespace App\Http\Controllers;

use App\VerificationCode;
use Carbon\Carbon;
use Illuminate\Http\Request;

class SmsController extends ResponseController
{

    /**
     * 发送短信
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendSms(Request $request)
    {
        $data =$request->validate([
            'mobile' => 'required|mobile'
        ]);

        $verificationCode = VerificationCode::where([
            'mobile' => $data['mobile'],
            'is_used' => false,
        ])->where('updated_at', '>=', Carbon::now()->subMinutes(5))
            ->orderBy('id', 'DESC')
            ->first();

        if($verificationCode) {
            $code = $verificationCode->code;
            //现在时间减掉一分钟还是比创建时间晚的话则说明再次发送间隔超过一分钟了
            if($verificationCode->updated_at < Carbon::now()->subMinute()){
                $verificationCode->updated_at = Carbon::now();
                $verificationCode->save();//更新过期时间
            }

            //1.调用短信发送接口
        }else{
            //保存短信验证码到数据库
            VerificationCode::create([
                'mobile' => $data['mobile'],
                'type' => '1', //短信登录验证码
                'code' => $code = randStr(4),
                'message' => "您的验证码为{$code}",
            ]);

            //1.调用短信发送接口
        }

        return $this->responseSuccess($code);
    }
}
