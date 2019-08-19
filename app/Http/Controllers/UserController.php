<?php

namespace App\Http\Controllers;

use App\Customer;
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
}
