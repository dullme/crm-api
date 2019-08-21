<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('send-sms', 'SmsController@sendSms');
Route::post('/login-sms', 'LoginController@login');    //用户登录

//需要认证的API接口
Route::group(['middleware' => 'auth:api'], function (){
    Route::get('user-info', 'UserController@userInfo'); //用户信息
    Route::get('customer-list', 'UserController@customerList'); //客户信息
    Route::get('customer-info/{id}', 'UserController@customerInfo'); //客户信息
    Route::get('follow-list/{id}/{order}', 'UserController@followList'); //跟进记录
    Route::post('follow', 'UserController@follow'); //盯一下
    Route::get('customer-end/{id}', 'UserController@customerEnd'); //结束拜访
    Route::post('customer/{id?}', 'UserController@addCustomer'); //客户信息保存
});
