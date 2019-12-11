<?php

namespace App\Admin\Controllers;

use App\GrabLog;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class GrabLogController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '抢单日志';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new GrabLog);

        $grid->model()->orderBy('id', 'DESC');

        $grid->column('id', __('Id'));
        $grid->column('会员账号')->display(function (){
            return optional($this->user)->username;
        });

        $grid->column('会员姓名')->display(function (){
            return optional($this->user)->name;
        });
        $grid->column('order_no', __('订单号'));
        $grid->column('withdraw_amount', __('抢单金额'));
        $grid->column('created_at', __('抢单时间'));

        $grid->filter(function ($filter){
            $filter->equal('user.username', '会员账号');
            $filter->equal('user.name', '会员姓名');
            $filter->equal('order_no', '订单号');
        });

        $grid->disableActions();
        $grid->disableCreateButton();
        $grid->disableRowSelector();
        $grid->disableExport();

        return $grid;
    }
}
