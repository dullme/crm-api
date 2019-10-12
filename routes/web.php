<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use App\Customer;
use GuzzleHttp\Client;


Route::get('/', function () {

    $client = new Client();

    try {
        $response = $client->get('http://54.169.181.103:1188/newuser?userid=100000');
        $usdt_address = $response->getBody()->getContents();
        dd($usdt_address);
    } catch (Exception $e) {

    }
    return view('welcome');
});

Route::get('/login', function (){
    return 'Unauthenticated';
})->name('login');
