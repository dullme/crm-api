<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDepositWithdrawsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('deposit_withdraws', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('user_id')->unique()->unsigned();
            $table->decimal('withdraw_amount', 20, 2)->comment('提现金额');
            $table->decimal('operation_fee', 20 , 2)->comment('平台运营手续费');
            $table->string('name')->comment('收款人');
            $table->string('bankname')->comment('开户银行');
            $table->string('bankcard')->comment('银行卡号');
            $table->text('images')->nullable()->comment('图片');
            $table->string('remarks')->nullable()->comment('备注');
            $table->integer('status')->default(0)->comment('状态0:已申请；1已完成');
            $table->timestamp('payment_at')->nullable()->comment('确认付款时间');
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
        Schema::dropIfExists('deposit_withdraws');
    }
}
