<?php

namespace App\Admin\Controllers;

use App\Withdraw;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class WithdrawController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '订单管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Withdraw);
        $grid->model()->orderBy('created_at', 'DESC');
        //筛选框
        $grid->expandFilter();
        $grid->filter(function ($filter){
            $filter->equal('payer.name', '出款人');
            $filter->equal('name', '入款人');
            $filter->equal('order_no', '订单号');
            $filter->equal('status', '状态')->select([
                '0' => '待抢单',
                '1' => '已接单',
                '2' => '已出款',
                '3' => '已完成',
                '4' => '已取消',
            ]);
        });

        $grid->disableActions();

        //操作栏
        $grid->actions(function ($actions){
            $actions->disableView();
            $actions->disableDelete();
            $actions->disableEdit();
        });

        $grid->column('id', __('Id'));
        $grid->column('order_no', __('订单号'));
        $grid->column('withdraw_amount', __('订单金额'));
        $grid->column('出款银行卡号')->display(function (){
            return optional($this->payer)->bank_card;
        });
        $grid->column('出款归属')->display(function (){
            return optional($this->payer)->bank_name;
        });
        $grid->column('出款人')->display(function (){
            return optional($this->payer)->name;
        });
        $grid->column('remitter', __('汇款人'));
        $grid->column('bankcard', __('入款银行卡号'));
        $grid->column('bankname', __('入款归属行'));
        $grid->column('name', __('入款人'));
        $grid->column('images', __('凭证'))->display(function ($picture){
            return json_decode($picture);
        })->gallery(['width' => 100, 'height' => 100]);
//        $grid->column('status', __('状态'))->editable('select',[0 => '待抢单',1 => '已接单', 2 => '已出款', 3 => '已完成']);
        $grid->column('status', __('状态'))->display(function ($status){
            if ($status == 0){
                $label = "<a class='label label-danger'>待抢单</a>";
            }elseif($status == 1){
                $label = "<a class='label label-info'>已接单</a>";
            }elseif($status == 2){
                $label = "<a class='label label-info'>已出款</a>";
            }elseif($status == 3){
                $label = "<a class='label label-success'>已完成</a>";
            }elseif($status == 4){
                $label = "<a class='label label-warning'>已取消</a>";
            }else{
                $label = "<a class='label label-default'>未知</a>";
            }

            return $label;
        });

        $grid->column('created_at', __('提款发起时间'));
        $grid->column('grab_at', __('抢单时间'));
        $grid->column('payment_at', __('确认转账时间'));
        $grid->disableExport();
        $grid->disableCreateButton();
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Withdraw::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('payer_user_id', __('Payer user id'));
        $show->field('payer_parent_user_id', __('Payer parent user id'));
        $show->field('order_no', __('Order no'));
        $show->field('amount', __('Amount'));
        $show->field('withdraw_amount', __('Withdraw amount'));
        $show->field('brokerage_fee', __('Brokerage fee'));
        $show->field('parent_brokerage_fee', __('Parent brokerage fee'));
        $show->field('operation_fee', __('Operation fee'));
        $show->field('name', __('Name'));
        $show->field('bankname', __('Bankname'));
        $show->field('bankcard', __('Bankcard'));
        $show->field('images', __('Images'));
        $show->field('remarks', __('Remarks'));
        $show->field('status', __('Status'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Withdraw);

//        $form->number('user_id', __('User id'));
//        $form->number('payer_user_id', __('Payer user id'));
//        $form->number('payer_parent_user_id', __('Payer parent user id'));
//        $form->text('order_no', __('Order no'));
//        $form->decimal('amount', __('Amount'));
//        $form->decimal('withdraw_amount', __('Withdraw amount'));
//        $form->decimal('brokerage_fee', __('Brokerage fee'));
//        $form->number('parent_brokerage_fee', __('Parent brokerage fee'));
//        $form->decimal('operation_fee', __('Operation fee'));
//        $form->text('name', __('Name'));
//        $form->text('bankname', __('Bankname'));
//        $form->text('bankcard', __('Bankcard'));
//        $form->textarea('images', __('Images'));
//        $form->text('remarks', __('Remarks'));
        $form->select('status', __('Status'))->options([0 => '待抢单',1 => '已接单', 2 => '已出款', 3 => '已完成']);

        return $form;
    }
}
