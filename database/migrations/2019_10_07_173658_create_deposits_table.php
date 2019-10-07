<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDepositsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('deposits', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('user_id')->unsigned();
            $table->integer('amount')->comment('金额');
            $table->string('name')->comment('收款人');
            $table->string('bankname')->comment('开户银行');
            $table->string('bankcard')->comment('银行卡号');
            $table->text('images')->comment('图片');
            $table->integer('status')->default(0)->comment('状态0:待审核；1:已确认');
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
        Schema::dropIfExists('deposits');
    }
}
