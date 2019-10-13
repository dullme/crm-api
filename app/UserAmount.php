<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserAmount extends Model
{
    protected $fillable = [
        'user_id',
        'withdraw_id',
        'amount',
        'before_amount',
        'after_amount',
        'type',
        'source',
        'remark',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
