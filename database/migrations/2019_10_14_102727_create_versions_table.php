<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateVersionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('versions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name')->comment('名称');
            $table->string('number')->comment('版本号');
            $table->string('packge_size')->comment('更新包大小');
            $table->string('android_link')->comment('android更新地址');
            $table->string('type')->default('release')->comment('类型');
            $table->string('method')->default('force')->comment('类型');
            $table->string('ios_link')->nullable()->comment('ios更新地址');
            $table->text('info')->nullable()->comment('更新详情');
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
        Schema::dropIfExists('versions');
    }
}
