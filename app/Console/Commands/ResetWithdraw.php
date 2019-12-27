<?php

namespace App\Console\Commands;

use App\User;
use App\Withdraw;
use Carbon\Carbon;
use Illuminate\Console\Command;

class ResetWithdraw extends Command
{

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'reset:withdraw';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = '重置超时的订单';

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
        $amount = configs('deduction');
        $withdraw = Withdraw::where('status', 1)->where('time_out_at', '<', Carbon::now())->pluck('payer_user_id', 'id');

        $withdraw->map(function ($item) use($amount){
            User::where('id', $item->payer_user_id)->decrement('amount', $amount);
            Withdraw::create([
                'user_id'         => $item->payer_user_id,
                'order_no'        => $item->order_no.'-'.time(),
                'amount'          => 0, //未扣除前余额
                'withdraw_amount' => $amount,//提现金额（不包括手续费）
                'operation_fee'   => 0, //平台运营手续费
                'brokerage_fee'   => 0, //佣金
                'status'          => 3,
                'name'            => '系统扣款',
                'bankname'        => '000000000000000000',
                'bankcard'        => '付款超时，系统扣款',
                'vip'             => 0,
            ]);

            Withdraw::where('id', $item->id)->update([
                'payer_user_id'        => null,
                'payer_parent_user_id' => null,
                'parent_brokerage_fee' => 0,
                'status'               => 0,
                'grab_at'              => null,
                'time_out_at'          => null,
            ]);
        });

    }
}
