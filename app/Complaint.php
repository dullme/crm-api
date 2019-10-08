<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Complaint extends Model
{
    protected $fillable = [
        'user_id',
        'withdraw_id',
        'content',
        'replay',
        'status',
        'type',
    ];

    public function withdraw()
    {
        return $this->belongsTo(Withdraw::class);
    }
}
