<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Follow extends Model
{
    protected $fillable = [
        'customer_id',
        'type',
        'visited_at',
        'remark',
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }
}
