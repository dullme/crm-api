<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $fillable = [
        'user_id',
        'avatar',
        'name',
        'mobile',
        'status',
        'email',
        'level',
        'industry',
        'source',
        'website',
        'province',
        'city',
        'area',
        'address',
        'next_visit_time',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
