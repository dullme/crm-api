<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VerificationCode extends Model
{
    protected $fillable = [
        'mobile',
        'type',
        'code',
        'message',
        'is_used',
    ];
}
