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

Route::middleware('auth:api')->get('/user-info', function (Request $request) {
    return $request->user();
});

Route::post('send-sms', 'SmsController@sendSms');

Route::post('/login-sms', 'LoginController@login');    //用户登录
