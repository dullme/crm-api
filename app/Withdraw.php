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
        'handing_fee',
        'name',
        'bankname',
        'bankcard',
        'status',
        'remarks',
        'images',
    ];
}
