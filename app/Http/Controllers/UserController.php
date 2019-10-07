<?php

namespace App\Http\Controllers;

use App\Complaint;
use App\Deposit;
use App\User;
use App\Withdraw;
use Log;
use App\Customer;
use App\CustomerIndustry;
use App\CustomerSource;
use App\Follow;
use Carbon\Carbon;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Webpatser\Uuid\Uuid;

class UserController extends ResponseController
{

    public function uploadImage(Request $request)
    {
        $file = $request->file('file');
        $fileUploaded = upload($file);
        if (!$fileUploaded['status']){
            return $this->responseError($fileUploaded['message']);
        }

        return $this->responseSuccess(url($fileUploaded['path']), '上传成功');
    }

    /**
     * 用户信息
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function userInfo(Request $request)
    {
        return $this->responseSuccess(array_merge([
            'bankname_list' => [
                '中国建设银行',
                '中国农业银行',
                '中国银行',
                '中国工商银行',
                '中国邮政储蓄银行'
            ],
            'admin_name' => config('name'),
            'admin_bankname' => config('bankname'),
            'admin_bankcard' => config('bankcard'),
            'admin_handling_fee' => config('handling_fee'),
        ], $request->user()->toArray()));
    }

    /**
     * 更新用户姓名
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateName(Request $request)
    {
        $data = $request->validate(
            ['name'     => 'required'],
            ['name.required'   => '姓名不能为空']
        );

        $user = User::find(Auth()->user()->id);
        $user->name = $data['name'];
        $user->save();

        return $this->responseSuccess(true, '姓名修改成功');
    }

    public function updatePassword(Request $request)
    {
        $data = $request->validate(
            ['password'     => 'required|min:6'],
            ['password.required'   => '密码不能为空','password.min'   => '密码过短']
        );

        $user = User::find(Auth()->user()->id);
        $user->password = bcrypt($data['password']);
        $user->save();

        return $this->responseSuccess(true, '密码修改成功');
    }

    public function updateBankname(Request $request)
    {
        $data = $request->validate(
            ['bankname'     => 'required'],
            ['bankname.required'   => '开户行不能为空']
        );

        $user = User::find(Auth()->user()->id);
        $user->bank_name = $data['bankname'];
        $user->save();

        return $this->responseSuccess(true, '开户行更新成功');
    }

    public function updateBankcard(Request $request)
    {
        $data = $request->validate(
            ['bankcard'     => 'required'],
            ['bankcard.required'   => '银行卡不能为空']
        );

        $user = User::find(Auth()->user()->id);
        $user->bank_card = $data['bankcard'];
        $user->save();

        return $this->responseSuccess(true, '银行卡更新成功');
    }

    public function saveDeposit(Request $request)
    {
        $data = $request->validate(
            [
                'amount'     => 'required|integer|min:1',
                'images'     => 'required',
            ],
            [
                'amount.required'   => '金额不能为空',
                'amount.integer'   => '金额必须为整数',
                'amount.min'   => '金额最小为1',
                'images.required'   => '请上传图片',
            ]
        );

        $deposit = Deposit::where([
            'user_id' => Auth()->user()->id,
            'status' => 0 //待审核
        ])->count();

        if($deposit){
            return $this->setStatusCode(422)->responseError('存在待审核的保证金');
        }

        Deposit::create([
            'user_id' => Auth()->user()->id,
            'amount' => $data['amount'],
            'name' => config('name'),
            'bankname' => config('bankname'),
            'bankcard' => config('bankcard'),
            'images' => implode(';', $data['images']),
        ]);

        return $this->responseSuccess($data, '提交成功');
    }

    public function withdrawList()
    {
        $withdraw_list = Withdraw::where('user_id', Auth()->user()->id)->orderBy('created_at', 'DESC')->get();

        return $this->responseSuccess($withdraw_list);
    }

    public function withdraw(Request $request)
    {
        $data = $request->validate(
            [
                'withdraw_amount'     => 'required|integer|min:1',
            ],
            [
                'withdraw_amount.required'   => '金额不能为空',
                'withdraw_amount.integer'   => '金额必须为整数',
                'withdraw_amount.min'   => '金额最小为1',
            ]
        );

        $user = User::find(Auth()->user()->id);
        $user_amount = $user->amount;

        $handing_fee = round(config('handling_fee') / 100 * $data['withdraw_amount'], 2);

        $withdraw_big_number = bigNumber($data['withdraw_amount']);
        $withdraw_amount = $withdraw_big_number->add($handing_fee);

        if($withdraw_amount > $user_amount){
            return $this->setStatusCode(422)->responseError('金额不足');
        }

        $user_big_number = bigNumber($user_amount);
        $amount = $user_big_number->subtract($withdraw_amount)->getValue();
        $user->amount =$amount;
        $user->save();

        Withdraw::create([
            'user_id' => $user->id,
            'order_no' => time().randStr(6),
            'amount' => $user_amount, //未扣除前余额
            'withdraw_amount' => $data['withdraw_amount'],//提现金额（不包括手续费）
            'handing_fee' => $handing_fee, //手续费
            'name' => Auth()->user()->name,
            'bankname' => Auth()->user()->bank_name,
            'bankcard' => Auth()->user()->bank_card,
        ]);

        return $this->responseSuccess($amount, '提交成功');
    }

    public function withdrawConform($id)
    {
        $withdraw = Withdraw::find($id);

        if(!$withdraw || $withdraw->user_id != Auth()->user()->id || $withdraw->status != 2){
            return $this->setStatusCode(422)->responseError('确认失败');
        }

        $withdraw->status = 3;
        $withdraw->save();

        return $this->responseSuccess($withdraw, '操作成功');
    }

    public function complaintList()
    {
        $withdraw_list = Complaint::with('withdraw:id,order_no')->where('user_id', Auth()->user()->id)->orderBy('created_at', 'DESC')->get();

        return $this->responseSuccess($withdraw_list);
    }

    public function complaint(Request $request)
    {
        $data = $request->validate(
            [
                'id'     => 'required|integer',
                'content' => 'required',
            ],
            [
                'id.required'   => '缺少参数',
                'id.integer'   => '缺少参数',
                'content.required'   => '内容不能为空',
            ]
        );

        $withdraw = Withdraw::find($data['id']);

        if(!$withdraw || $withdraw->user_id != Auth()->user()->id || !in_array($withdraw->status, [1, 2])){
            return $this->setStatusCode(422)->responseError('投诉失败');
        }

        Complaint::updateOrCreate(
            ['user_id' => $withdraw->user_id, 'withdraw_id' => $withdraw->id],
            ['content' => $data['content']]
        );

        return $this->responseSuccess(true, '投诉成功');
    }
}
