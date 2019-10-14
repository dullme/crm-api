<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');
    $router->resource('users', UserController::class);
    $router->resource('withdraws', WithdrawController::class);
    $router->resource('deposits', DepositController::class);
    $router->resource('banks', BankController::class);
    $router->resource('helps', HelpController::class);
    $router->resource('messages', MessageController::class);
    $router->resource('complaints', ComplaintController::class);
    $router->resource('deposit-withdraws', DepositWithdrawController::class);
    $router->resource('user-amounts', UserAmountController::class);
    $router->resource('versions', VersionController::class);
});
