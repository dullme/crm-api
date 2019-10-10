<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBanksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('banks', function (Blueprint $table) {
            $table->increments('id');
            $table->tinyInteger('status')->default(1)->comment('状态');
            $table->string('bank_name',50)->comment('银行名称');
            $table->string('bank_code',32)->nullable()->comment('银行编码');
            $table->string('icon')->comment('银行logo');
            $table->string('background')->nullable()->comment('银行卡背景');
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
        Schema::dropIfExists('banks');
    }
}
