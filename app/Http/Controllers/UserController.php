<?php

namespace App\Http\Controllers;

use App\Complaint;
use App\Deposit;
use App\Message;
use App\User;
use App\Withdraw;
use Log;
use DB;
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

    /**
     * 上传图片
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
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
                '请选择',
                '中国建设银行',
                '中国农业银行',
                '中国银行',
                '中国工商银行',
                '中国邮政储蓄银行'
            ],
            'admin_name' => config('name'),
            'admin_bankname' => config('bankname'),
            'admin_bankcard' => config('bankcard'),
            'admin_operation_fee' => config('operation_fee'),
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

    /**
     * 更新密码
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
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

    /**
     * 更新银行名称
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function updateBankname(Request $request)
    {
        $data = $request->validate(
            ['bankname'     => 'required'],
            ['bankname.required'   => '开户行不能为空']
        );

        if($data['bankname'] == '请选择'){
            return $this->setStatusCode(422)->responseError('请选择开户行');
        }

        $user = User::find(Auth()->user()->id);
        $user->bank_name = $data['bankname'];
        $user->save();

        return $this->responseSuccess(true, '开户行更新成功');
    }

    /**
     * 更新银行卡
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
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

    /**
     * 提交保证金
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
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
            'user_id' => Auth()->user()->id
        ])->get();

        if($deposit->where('status', 1)->sum('amount') > config('deposit')){
            return $this->setStatusCode(422)->responseError(config('deposit_enough_message'));
        }//保证金足够

        if($deposit->where('status', 0)->count()){
            return $this->setStatusCode(422)->responseError('有待审核的保证金');
        }

        Deposit::create([
            'user_id' => Auth()->user()->id,
            'amount' => $data['amount'],
            'name' => config('name'),
            'bankname' => config('bankname'),
            'bankcard' => config('bankcard'),
            'images' => implode(';', $data['images']),
        ]);

        return $this->responseSuccess($data, config('deposit_submit_message'));
    }


    /**
     * 保存抢单
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function saveGrab(Request $request)
    {
        $data = $request->validate(
            [
                'id'     => 'required|integer',
                'images'     => 'required',
            ],
            [
                'id.required'   => '缺少参数',
                'id.integer'   => '缺少参数',
                'images.required'   => '请上传图片',
            ]
        );

        $grab = Withdraw::find($data['id']);

        if(!$grab || $grab->payer_user_id != Auth()->user()->id || $grab->status != 1){
            return $this->setStatusCode(422)->responseError('当前状态错误');
        }

        $grab->status = 2;//已付款
        $grab->images = implode(';', $data['images']);//已付款
        $grab->save();

        Message::create([
            'user_id' => $grab->user_id,
            'title' => '提现待确认',
            'content' => config('withdra_unconfirmed_message'),
        ]);

        return $this->responseSuccess($data, '提交成功');
    }

    /**
     * 提现列表
     * @return \Illuminate\Http\JsonResponse
     */
    public function withdrawList()
    {
        $withdraw_list = Withdraw::where('user_id', Auth()->user()->id)->orderBy('created_at', 'DESC')->get();

        return $this->responseSuccess($withdraw_list);
    }


    /**
     * 提现
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function withdraw(Request $request)
    {
        if(config('stop') == 'true'){
            return $this->setStatusCode(422)->responseError(config('stop_message'));
        }

        if(Auth()->user()->status == 0){
            return $this->setStatusCode(422)->responseError(config('account_freeze_message'));
        }

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

        DB::beginTransaction(); //开启事务

        $user = User::find(Auth()->user()->id);
        $user_amount = $user->amount;

        $operation_fee = round(config('operation_fee') / 100 * $data['withdraw_amount'], 2);
        $brokerage_fee = round(config('brokerage_fee') / 100 * $data['withdraw_amount'], 2);

        $withdraw_big_number = bigNumber($data['withdraw_amount']);
        $withdraw_amount = $withdraw_big_number->add($operation_fee);

        if($withdraw_amount > $user_amount){
            return $this->setStatusCode(422)->responseError('金额不足');
        }

        $user_big_number = bigNumber($user_amount);
        $amount = $user_big_number->subtract($withdraw_amount)->getValue();
        $user->amount =$amount;
        $user_saved = $user->save();

        $withdraw_saved = Withdraw::create([
            'user_id' => $user->id,
            'order_no' => time().randStr(6),
            'amount' => $user_amount, //未扣除前余额
            'withdraw_amount' => $data['withdraw_amount'],//提现金额（不包括手续费）
            'operation_fee' => $operation_fee, //平台运营手续费
            'brokerage_fee' => $brokerage_fee, //佣金
            'name' => Auth()->user()->name,
            'bankname' => Auth()->user()->bank_name,
            'bankcard' => Auth()->user()->bank_card,
        ]);

        if (!$user_saved || !$withdraw_saved) {
            DB::rollBack(); //回滚
            return $this->setStatusCode(422)->responseError('提现失败');
        }
        DB::commit();   //保存

        return $this->responseSuccess($amount, '提现成功');
    }

    /**
     * 确认提现
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function withdrawConform($id)
    {
        $withdraw = Withdraw::find($id);

        if(!$withdraw || $withdraw->user_id != Auth()->user()->id || $withdraw->status != 2){
            return $this->setStatusCode(422)->responseError('确认失败');
        }

        DB::beginTransaction(); //开启事务

        //给打款人加钱
        $payer_user_add_withdraw_amount = bigNumber($withdraw->withdraw_amount);//打款金额
        $payer_user_add_amount = $payer_user_add_withdraw_amount->add($withdraw->brokerage_fee)->getValue();//打款金额+佣金
        $user_saved = User::where('id', $withdraw->payer_user_id)->increment('amount', $payer_user_add_amount);//给打款方加钱

        //给打款方上级加钱
        if($withdraw->payer_parent_user_id && $withdraw->parent_brokerage_fee != 0){
            $payer_user_saved = User::where('id', $withdraw->payer_parent_user_id)->increment('amount', $withdraw->parent_brokerage_fee);//给打款方的上级加钱
            if (!$payer_user_saved) {
                DB::rollBack(); //回滚
                return $this->setStatusCode(422)->responseError('确认失败');
            }
        }

        $withdraw->status = 3;
        $withdraw_saved = $withdraw->save();



        $message_saved = Message::create([
            'user_id' => $withdraw->payer_user_id,
            'title' => '交易确认',
            'content' => config('payment_confirmed_message'),
        ]);

        if (!$user_saved || !$withdraw_saved || !$message_saved) {
            DB::rollBack(); //回滚
            return $this->setStatusCode(422)->responseError('确认失败');
        }
        DB::commit();   //保存

        return $this->responseSuccess($withdraw, '操作成功');
    }

    /**
     * 投诉列表
     * @return \Illuminate\Http\JsonResponse
     */
    public function complaintList()
    {
        $withdraw_list = Complaint::with('withdraw:id,order_no')->where('user_id', Auth()->user()->id)->orderBy('created_at', 'DESC')->get();

        return $this->responseSuccess($withdraw_list);
    }

    /**
     * 投诉
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
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

        if(!$withdraw || !in_array($withdraw->status, [1, 2])){
            return $this->setStatusCode(422)->responseError('投诉失败');
        }

        if($withdraw->user_id == Auth()->user()->id){
            //投诉提现单子
            DB::transaction(function () use($withdraw, $data){
                Complaint::updateOrCreate(
                    ['user_id' => $withdraw->user_id, 'withdraw_id' => $withdraw->id, 'type' => 2],
                    ['content' => $data['content']]
                );
                User::whereIn('id', [$withdraw->user_id, $withdraw->payer_user_id])->update(['status' => 0]);
            });
        }elseif ($withdraw->payer_user_id == Auth()->user()->id){
            //投诉付款单子
            DB::transaction(function () use($withdraw, $data){
                Complaint::updateOrCreate(
                    ['user_id' => $withdraw->payer_user_id, 'withdraw_id' => $withdraw->id, 'type' => 1],
                    ['content' => $data['content']]
                );
                User::whereIn('id', [$withdraw->user_id, $withdraw->payer_user_id])->update(['status' => 0]);
            });
        }else{
            return $this->setStatusCode(422)->responseError('无法投诉');
        }

        return $this->responseSuccess(true, '投诉成功');
    }

    /**
     * 我的消息数量
     * @return \Illuminate\Http\JsonResponse
     */
    public function message()
    {
        $message = Message::where([
            'user_id' => Auth()->user()->id,
            'is_read' => false
        ])->count();

        return $this->responseSuccess($message);
    }

    /**
     * 我的消息列表
     * @return \Illuminate\Http\JsonResponse
     */
    public function messages()
    {
        $message_list = Message::where('user_id', Auth()->user()->id)->orderBy('created_at', 'DESC')->take(50)->get();

        Message::whereIn('id', $message_list->pluck('id'))->update(['is_read'=>true]);

        return $this->responseSuccess($message_list);
    }

    /**
     * 首页参数
     * @return \Illuminate\Http\JsonResponse
     */
    public function depositCount()
    {
        $deposit_amount = Deposit::where([
            'user_id' => Auth()->user()->id,
            'status' => 1,
        ])->sum('amount');

        return $this->responseSuccess([
            'deposit_amount' => $deposit_amount,
            'deposit' => config('deposit'),
            'deposit_enough_message' => config('deposit_enough_message'),
            'withdraw_amount' => Auth()->user()->amount,
            'index_amount' => $this->todayCanGrabAmount() //可抢金额
        ]);
    }


    /**
     * 抢单
     * @return \Illuminate\Http\JsonResponse
     */
    public function grabOrder()
    {
        $grabAmount = $this->todayCanGrabAmount();//可抢金额

        if(config('stop') == 'true'){
            return $this->setStatusCode(422)->responseError(config('stop_message'));
        }

        if(Auth()->user()->status == 0){
            return $this->setStatusCode(422)->responseError(config('account_freeze_message'));
        }

        if(10000 >= $grabAmount){
            return $this->setStatusCode(422)->responseError(config('total_amount_shortage_message'));
        }

        $deposit_amount = Deposit::where([
            'user_id' => Auth()->user()->id,
            'status' => 1,
        ])->sum('amount');

        if($deposit_amount < config('deposit')){
            return $this->setStatusCode(422)->responseError(config('deposit_shortage_message'));
        }


        $res = DB::transaction(function () use ($grabAmount) {
            $count = Withdraw::where('payer_user_id' ,Auth()->user()->id)
                ->whereIn('status', [1,2])->count();

            if($count){
                return [
                    'status' => false,
                    'message' => config('not_completed_message'),//有未完成的单子
                ];
            }

            $Withdraw = Withdraw::inRandomOrder()
                ->where('user_id', '!=', Auth()->user()->id)
                ->where('withdraw_amount', '<=', $grabAmount)
                ->where('status', 0)
                ->first();

            if($Withdraw){
                $Withdraw->payer_user_id = Auth()->user()->id;
                if(Auth()->user()->pid){
                    $Withdraw->payer_parent_user_id = Auth()->user()->pid;
                    $parent_brokerage_fee = round(config('parent_brokerage_fee') / 100 * $Withdraw->withdraw_amount, 2);
                    $Withdraw->parent_brokerage_fee = bigNumber($parent_brokerage_fee)->getValue();
                }

                $Withdraw->status = 1;

                return [
                    'status' => $Withdraw->save(),
                    'message' => config('grabbed_message'),//抢单成功
                ];
            }

            return [
                'status' => false,
                'message' => config('no_list_message'),
            ];
        });

        if($res['status']){
            return $this->responseSuccess($res, $res['message']);
        }

        return $this->setStatusCode(422)->responseError($res['message']);
    }

    /**
     * 抢单页面信息
     * @return \Illuminate\Http\JsonResponse
     */
    public function grab()
    {

        $withdraw = Withdraw::where([
            'payer_user_id' => Auth()->user()->id,
            'status' => 2,
        ])->first();

        if($withdraw){
            return $this->setStatusCode(422)->responseError(config('not_completed_message'));
        }

        $withdraw = Withdraw::where([
            'payer_user_id' => Auth()->user()->id,
            'status' => 1,
        ])->first();

        return $this->responseSuccess($withdraw);
    }

    /**
     * 我的交易列表
     * @return \Illuminate\Http\JsonResponse
     */
    public function transactionList()
    {
        $withdraw_list = Withdraw::where('payer_user_id', Auth()->user()->id)->whereIn('status', [2, 3])->orderBy('created_at', 'DESC')->get();

        return $this->responseSuccess($withdraw_list);
    }

    /**
     * 获取投诉提示语
     * @return \Illuminate\Http\JsonResponse
     */
    public function getComplaintMessage()
    {
        return $this->responseSuccess(config('complaint_message'));
    }

    /**
     * 当日可抢金额
     * @return string
     */
    private function todayCanGrabAmount()
    {
        $total_amount = config('total_amount');
        $today_withdraw_amount = Withdraw::where('payer_user_id' ,Auth()->user()->id)
            ->whereIn('status', [1,2,3])->whereDate('created_at', Carbon::today())->sum('withdraw_amount');//当日已抢金额

        return bigNumber($total_amount)->subtract($today_withdraw_amount)->getValue();
    }
}
