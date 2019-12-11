<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GrabLog extends Model
{
    protected $fillable = [
        'id',
        'user_id',
        'order_no',
        'withdraw_amount',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
