<?php

namespace App\Http\Controllers;

use App\Customer;
use App\Follow;
use Illuminate\Http\Request;

class UserController extends ResponseController
{

    /**
     * 用户信息
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function userInfo(Request $request)
    {
        return $this->responseSuccess($request->user());
    }

    /**
     * 客户管理
     * @return \Illuminate\Http\JsonResponse
     */
    public function customerList()
    {
        $customer = Customer::with('user:id,name')
            ->where('user_id', Auth()->user()->id)
            ->when(request('search'), function ($q) {
                return $q->where('name', 'like', '%'. request('search') .'%')
                    ->orWhere('mobile', 'like', '%'. request('search') .'%');
            })
            ->select('id', 'user_id', 'avatar', 'name', 'mobile', 'status', 'created_at')
            ->orderBy('id', 'DESC')
            ->get();

        return $this->responseSuccess($customer);
    }

    /**
     * 客户信息
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function customerInfo($id)
    {
        $customer = Customer::where('user_id', Auth()->user()->id)->find($id);

        if(!$customer){
            return $this->setStatusCode(422)->responseError('信息不存在');
        }

        return $this->responseSuccess($customer);
    }

    /**
     * 跟进记录
     * @param $id
     * @param $order
     * @return \Illuminate\Http\JsonResponse
     */
    public function followList($id, $order)
    {
        $customer = Customer::where('user_id', Auth()->user()->id)->find($id);

        if(!$customer){
            return $this->setStatusCode(422)->responseError('信息不存在');
        }

        $order = $order ? 'DESC' : 'ASC';

        $follows = Follow::where('customer_id', $id)
            ->orderBy('visited_at', $order)
            ->orderBy('id', $order)
            ->get();

        return $this->responseSuccess([
            'customer' => $customer,
            'follows' => $follows,
        ]);
    }

    /**
     * 盯一下
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function follow(Request $request)
    {
        $data = $request->validate(
            [
                'customer_id' => 'required',
                'type' => 'required',
                'date' => 'required',
                'time' => 'required',
            ],
            [
                'customer_id.required' => '出错了',
                'type.required' => '请选择类型',
                'date.required' => '请选择重访日期',
                'time.required' => '请选择重访时间',
            ]
        );

        $customer = Customer::where('user_id', Auth()->user()->id)->find($data['customer_id']);

        if(!$customer){
            return $this->setStatusCode(422)->responseError('出错了');
        }

        if($customer->status ==1){
            return $this->setStatusCode(422)->responseError('拜访已结束');
        }

        return $this->responseSuccess(Follow::create([
            'customer_id' => $data['customer_id'],
            'type' =>  $data['type'],
            'visited_at' => $data['date'] . ' ' . $data['time'],
            'remark' => request('remark')
        ]));
    }

    /**
     * 结束拜访
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function customerEnd($id)
    {
        $customer = Customer::where('user_id', Auth()->user()->id)->find($id);

        if(!$customer){
            return $this->setStatusCode(422)->responseError('信息不存在');
        }

        if($customer->status != 1){
            $customer->status = 1;
            $customer->save();
        }

        return $this->responseSuccess(true);
    }
}
