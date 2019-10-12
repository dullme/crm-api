<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DepositWithdraw extends Model
{
    protected $fillable = [
        'user_id',
        'withdraw_amount',
        'operation_fee',
        'name',
        'bankname',
        'bankcard',
        'images',
        'remarks',
        'status',
        'payment_at',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
