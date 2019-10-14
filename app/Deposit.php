<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Deposit extends Model
{
    protected $fillable = [
        'user_id',
        'amount',
        'name',
        'bankname',
        'bankcard',
        'images',
        'status',
        'remitter',
    ];


    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
