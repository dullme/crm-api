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

Route::get('/', function () {
    echo substr('18606520987', -4);
    return view('welcome');
});

Route::get('/login', function (){
    return 'Unauthenticated';
})->name('login');
