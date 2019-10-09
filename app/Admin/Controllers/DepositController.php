<?php

namespace App\Admin\Controllers;

use App\Deposit;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class DepositController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '保证金';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Deposit);

        $grid->column('id', __('Id'));
        $grid->column('会员账号')->display(function (){
            return $this->user->username;
        });
        $grid->column('amount', __('缴纳金额(元)'))->display(function ($amount){
            return bigNumber($amount)->getValue();
        });
        $grid->column('name', __('收款人'));
        $grid->column('bankname', __('汇款归属行'));
        $grid->column('bankcard', __('汇款银行卡号'));
        $grid->column('images', __('汇款回执单'))->display(function ($picture){
            return json_decode($picture);
        })->gallery(['width' => 100, 'height' => 100]);;
        $grid->column('status', __('状态'));
        $grid->column('created_at', __('汇款时间'));

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
        $show = new Show(Deposit::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('amount', __('Amount'));
        $show->field('name', __('Name'));
        $show->field('bankname', __('Bankname'));
        $show->field('bankcard', __('Bankcard'));
        $show->field('images', __('Images'));
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
        $form = new Form(new Deposit);

        $form->number('user_id', __('User id'));
        $form->number('amount', __('Amount'));
        $form->text('name', __('Name'));
        $form->text('bankname', __('Bankname'));
        $form->text('bankcard', __('Bankcard'));
        $form->textarea('images', __('Images'));
        $form->number('status', __('Status'));

        return $form;
    }
}
