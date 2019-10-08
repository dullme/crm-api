<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateComplaintsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('complaints', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('user_id')->unsigned();
            $table->integer('withdraw_id')->unique()->comment('提现单ID');
            $table->text('content')->comment('内容');
            $table->text('replay')->nullable()->comment('回复');
            $table->integer('type')->comment('类型1:我付款的单子；2:我提现的单子');
            $table->integer('status')->default(0)->comment('状态0:待受理；1:客服处理中;2:处理完毕');
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
        Schema::dropIfExists('complaints');
    }
}
