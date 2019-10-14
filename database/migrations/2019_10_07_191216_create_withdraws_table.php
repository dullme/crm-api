<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateWithdrawsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('withdraws', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('user_id')->unsigned();
            $table->integer('payer_user_id')->unsigned()->nullable()->comment('付款人ID');
            $table->integer('payer_parent_user_id')->unsigned()->nullable()->comment('付款人的上级ID');
            $table->string('order_no')->unique()->comment('订单号');
            $table->decimal('amount', 20, 2)->comment('提现时金额');
            $table->decimal('withdraw_amount', 20, 2)->comment('提现金额');
            $table->decimal('operation_fee', 20 , 2)->comment('平台运营手续费');
            $table->decimal('brokerage_fee', 20 , 2)->comment('佣金');
            $table->decimal('parent_brokerage_fee', 20 , 2)->default(0)->comment('上级佣金');
            $table->string('name')->comment('收款人');
            $table->string('remitter')->nullable()->comment('汇款人');
            $table->string('bankname')->comment('开户银行');
            $table->string('bankcard')->comment('银行卡号');
            $table->text('images')->nullable()->comment('图片');
            $table->string('remarks')->nullable()->comment('备注');
            $table->integer('status')->default(0)->comment('状态0:待抢单；1:已接单;2:已出款;3:交易正常;4:交易取消');
            $table->timestamp('grab_at')->nullable()->comment('抢单时间');
            $table->timestamp('payment_at')->nullable()->comment('确认付款时间');
            $table->timestamp('time_out_at')->nullable()->comment('订单超时时间');
            $table->timestamp('finished_at')->nullable()->comment('订单结束时间');
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
        Schema::dropIfExists('withdraws');
    }
}
