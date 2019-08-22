<?php

namespace App\Http\Controllers;

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

    /**
     * 用户信息
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function userInfo(Request $request)
    {
        return $this->responseSuccess($request->user());
    }

    public function addCustomer(Request $request)
    {
        $data = $request->validate(
            [
                'name'     => 'required',
                'mobile'   => 'required',
                'level'    => 'required|integer|min:1',
                'source'   => 'required|integer|min:1',
                'industry' => 'required|integer|min:1',
                'address'  => 'nullable|string',
                'website'  => 'nullable|string',
//                'date' => 'required|date_format:"Y-m-d"',
//                'time' => 'required|date_format:"H:i"',
            ],
            [
                'name.required'   => '请输入客户名称',
                'mobile.required' => '请输入电话',
//                'date.required' => '请输入重访日期',
//                'date.date' => '日期格式错误',
//                'time.required' => '请输入重访时间',
//                'time.date' => '时间格式错误',
            ]
        );

        $data['user_id'] = Auth()->user()->id;
//        $data['next_visit_time'] = "{$data['date']} {$data['time']}:00";
        $customer_id = $request->input('id');
        if ($request->input('id')) {
            $customer = Customer::where('user_id', Auth()->user()->id)->find($customer_id);
            if (!$customer) {
                return $this->setStatusCode(422)->responseError('客户资料不存在');
            }

            $customer->update($data);
        } else {
            Customer::create($data);
        }

        return $this->responseSuccess(true);
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
                return $q->where('name', 'like', '%' . request('search') . '%')
                    ->orWhere('mobile', 'like', '%' . request('search') . '%');
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

        if (!$customer) {
            return $this->setStatusCode(422)->responseError('信息不存在');
        }

        $data = array_filter($customer->toArray(), function ($v) {
            return is_null($v) ? false : true;
        });

        return $this->responseSuccess($data);
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

        if (!$customer) {
            return $this->setStatusCode(422)->responseError('信息不存在');
        }

        $order = $order ? 'DESC' : 'ASC';

        $follows = Follow::where('customer_id', $id)
            ->orderBy('visited_at', $order)
            ->orderBy('id', $order)
            ->get();

        return $this->responseSuccess([
            'customer' => $customer,
            'follows'  => $follows,
        ]);
    }

    public function getFollow($id)
    {
        $follow = Follow::find($id);
        if (!$follow) {
            return $this->setStatusCode(422)->responseError('信息不存在');
        }

        $customer = Customer::where('user_id', Auth()->user()->id)->find($follow->customer_id);

        if (!$customer) {
            return $this->setStatusCode(422)->responseError('无权查看');
        }

        return $this->responseSuccess([
            'id'     => $follow->id,
            'date'   => substr($follow->visited_at, 0, 10),
            'time'   => substr($follow->visited_at, -8, 5),
            'type'   => $follow->type,
            'remark' => $follow->remark ? $follow->remark : '',
        ]);
    }

    public function followEdit(Request $request)
    {
        $data = $request->validate(
            [
                'id'   => 'required|integer',
                'date' => 'required',
                'time' => 'required',
                'type' => 'required',
            ]
        );

        $follow = Follow::find($data['id']);
        if (!$follow) {
            return $this->setStatusCode(422)->responseError('信息不存在');
        }

        $customer = Customer::where('user_id', Auth()->user()->id)->find($follow->customer_id);

        if (!$customer) {
            return $this->setStatusCode(422)->responseError('无权查看');
        }

        $follow->visited_at = "{$data['date']} {$data['time']}:00";
        $follow->type = $data['type'];
        $follow->remark = request('remark');
        $follow->save();

        return $this->responseSuccess(true);
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
                'type'        => 'required',
                'date'        => 'required',
                'time'        => 'required',
            ],
            [
                'customer_id.required' => '出错了',
                'type.required'        => '请选择类型',
                'date.required'        => '请选择重访日期',
                'time.required'        => '请选择重访时间',
            ]
        );

        $customer = Customer::where('user_id', Auth()->user()->id)->find($data['customer_id']);

        if (!$customer) {
            return $this->setStatusCode(422)->responseError('出错了');
        }

        if ($customer->status == 1) {
            return $this->setStatusCode(422)->responseError('拜访已结束');
        }

        return $this->responseSuccess(Follow::create([
            'customer_id' => $data['customer_id'],
            'type'        => $data['type'],
            'visited_at'  => "{$data['date']} {$data['time']}:00",
            'remark'      => request('remark')
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

        if (!$customer) {
            return $this->setStatusCode(422)->responseError('信息不存在');
        }

        if ($customer->status != 1) {
            $customer->status = 1;
            $customer->save();
        }

        return $this->responseSuccess(true);
    }

    public function customerIndustryAndSource()
    {
        $industry = CustomerIndustry::where('admin_user_id', Auth()->user()->admin_user_id)
            ->where('is_show', 1)->select('name', 'id')->pluck('name', 'id');

        $source = CustomerSource::where('admin_user_id', Auth()->user()->admin_user_id)
            ->where('is_show', 1)->select('name', 'id')->pluck('name', 'id');

        $industry[0] = '请选择';
        $source[0] = '请选择';

        return $this->responseSuccess([
            'source'   => $source,
            'industry' => $industry
        ]);
    }

    public function callMobile($id)
    {
        $customer = Customer::where('user_id', Auth()->user()->id)->find($id);

        if(!$customer){
            return $this->setStatusCode(422)->responseError('信息不存在');
        }

        $client = new Client();
        $response = $client->post("http://new.02110000.com:8088/api/login", [
            'headers' => [
                'Content-Type' => 'application/json',
            ],
            'body' => json_encode([
                'username' => '8029',
                'password' => 'ZZ0Os6RNuCay2dJi9QlvsFM6pn62Iee9'
            ])
        ]);

        $res = json_decode((string) $response->getBody(), true);

        $uuid = Uuid::generate()->string;

        $response2 = $client->post("http://new.02110000.com:8088/api/CallRequest", [
            'headers' => [
                'Content-Type'  => 'application/json',
                'Authorization' => 'JH ' . $res['token'],
            ],
            'body'     => json_encode([
                'callid'       => $uuid,
                'app_id'       => '8029',
                'caller'       => Auth()->user()->mobile,
                'callee'       => $customer->mobile,
                'call_minutes' => '500',
                'extends'      => '123123',
                'cdr_url'      => 'http://crm-api.dullme.com',
            ])
        ]);

        $res2 = json_decode((string) $response2->getBody(), true);

        if($res2['result'] != 0){
            return $this->setStatusCode(422)->responseError($res2['msg']);
        }

        Follow::create([
            'uuid' => $uuid,
            'customer_id' => $id,
            'type'        => 10, //表示电话
            'visited_at'  => Carbon::now(),
            'remark'      => '系统拨打电话',
        ]);

        return $this->responseSuccess($res2['msg']);
    }

    public function mobileCalled(Request $request)
    {
        $data = $request->all();
        Log::info($data);

        if(isset($data['Record_url']) || isset($data['Call_duration'])){
            $follow = Follow::where('uuid', $data['Call_id'])->first();
            if($follow){
                $follow->call_duration = $data['Call_duration'] ? $data['Call_duration'] : '';
                $follow->record_url = $data['Record_url'] ? $data['Record_url'] : '';
                $follow->save();
            }
            return 200;
        }
    }
}
