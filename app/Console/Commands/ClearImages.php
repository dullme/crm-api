<?php

namespace App\Console\Commands;

use App\User;
use App\Withdraw;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Storage;

class ClearImages extends Command
{

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'clear:images';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '删除30天之前的图片';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        // 取到磁盘实例
        $disk = Storage::disk('public');

        $time = Carbon::now()->subMonth()->toDateString();
        $time = str_replace('-', '_', $time);

        // 删除目录
        $disk->deleteDirectory($time);
    }
}
