<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFollowsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('follows', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('customer_id')->unsigned()->comment('外键：customers的主键');
            $table->integer('type')->unsigned()->comment('类型');
            $table->string('uuid')->nullable()->comment('UUID');
            $table->string('call_duration')->nullable()->comment('通话时间');
            $table->string('record_url')->nullable()->comment('录音地址');
            $table->timestamp('visited_at')->comment('重访时间');
            $table->text('remark')->nullable()->comment('备注');
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
        Schema::dropIfExists('follows');
    }
}
