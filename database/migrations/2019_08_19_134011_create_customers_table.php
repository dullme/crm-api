<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('user_id')->unsigned()->comment('外键：users的主键');
            $table->string('name')->unique()->comment('客户名称');
            $table->string('avatar')->nullable()->comment('头像');
            $table->string('mobile')->nullable()->comment('电话');
            $table->integer('status')->unsigned()->default(0)->comment('状态');
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
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customers');
    }
}
