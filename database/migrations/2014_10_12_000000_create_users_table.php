<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('mobile')->unique()->comment('手机号');
            $table->string('name')->nullable()->comment('名称');
            $table->string('email')->nullable()->comment('邮箱');
            $table->string('level')->nullable()->comment('等级');
            $table->string('industry')->nullable()->comment('行业');
            $table->string('source')->nullable()->comment('来源');
            $table->string('website')->nullable()->comment('网站地址');
            $table->string('province')->nullable()->comment('省');
            $table->string('city')->nullable()->comment('市');
            $table->string('area')->nullable()->comment('区');
            $table->string('address')->nullable()->comment('详细地址');
            $table->timestamp('next_visit_time')->nullable()->comment('下次访问时间');
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
