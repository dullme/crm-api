<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Withdraw extends Model
{
    protected $fillable = [
        'user_id',
        'payer_user_id',
        'order_no',
        'amount',
        'withdraw_amount',
        'operation_fee',
        'brokerage',
        'name',
        'bankname',
        'bankcard',
        'status',
        'remarks',
        'images',
    ];
}
