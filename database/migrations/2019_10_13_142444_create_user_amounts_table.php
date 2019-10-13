<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUserAmountsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_amounts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('user_id')->unsigned();
            $table->integer('withdraw_id')->unsigned()->default(0)->comment('提现ID');
            $table->decimal('amount',20,2)->comment('调节值');
            $table->decimal('before_amount',20,2)->comment('调节前金额');
            $table->decimal('after_amount',20,2)->comment('调节后金额');
            $table->integer('type')->comment('调节方式1:增加；2:减少');
            $table->integer('source')->default(0)->comment('调节来源0:后台操作');
            $table->string('remark')->nullable()->comment('备注');
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
        Schema::dropIfExists('user_amounts');
    }
}
