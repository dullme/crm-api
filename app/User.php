<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'pid',
        'status',
        'amount',
        'username',
        'name',
        'invitation_code',
        'bank_name',
        'bank_card',
        'password',
    ];

    public function findForPassport($username) {

        return User::where('username', $username)->first();
    }

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function adminUser()
    {
        $userModel = config('admin.database.users_model');
        return $this->belongsTo($userModel);
    }

    public function withdraw()
    {
        return $this->hasMany(Withdraw::class, 'payer_user_id', 'id');
    }
}
