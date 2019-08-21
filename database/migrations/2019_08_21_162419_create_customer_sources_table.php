<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCustomerSourcesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer_sources', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('admin_user_id')->unsigned()->comment('关联管理员');
            $table->string('name');
            $table->boolean('is_show')->comment('是否显示');
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
        Schema::dropIfExists('customer_sources');
    }
}
