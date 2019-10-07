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
            $table->increments('id');
            $table->integer('pid')->unsigned()->default(0)->comment('邀请人ID');
            $table->decimal('amount',20,2)->default(0)->comment('可用额度');
            $table->string('username')->unique()->comment('用户名');
            $table->string('name')->nullable()->comment('姓名');
            $table->string('invitation_code')->unique()->comment('邀请码');
            $table->string('bank_name')->nullable()->comment('银行名称');
            $table->string('bank_card')->nullable()->comment('银行卡号');
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
