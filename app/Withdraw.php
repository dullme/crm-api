<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Withdraw extends Model
{
    protected $fillable = [
        'user_id',
        'payer_user_id',
        'payer_parent_user_id',
        'order_no',
        'amount',
        'withdraw_amount',
        'operation_fee',
        'brokerage_fee',
        'parent_brokerage_fee',
        'name',
        'bankname',
        'bankcard',
        'status',
        'remarks',
        'images',
    ];


    public function payer()
    {
        return $this->belongsTo(User::class, 'payer_user_id', 'id');
    }
}
