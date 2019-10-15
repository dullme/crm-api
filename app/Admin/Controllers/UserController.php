<?php

namespace App\Admin\Controllers;

use App\User;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Widgets\Table;

class UserController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '会员管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User);
        $grid->model()->orderBy('created_at', 'DESC');
        //筛选框
        $grid->filter(function ($filter){
            $filter->like('username', '会员账号');
            $filter->like('name', '会员姓名');
            $filter->equal('upLevel.invitation_code', '推广码');
        });

        $grid->column('id', __('Id'));
        $grid->column('username', __('会员账号'));
        $grid->column('bank_card', __('银行卡号'));
        $grid->column('bank_name', __('发卡行'));
        $grid->column('name', __('会员姓名'));
        $grid->column('amount', __('剩余金币'))->sortable();
        $grid->column('保证金(元)')->display(function (){
            return bigNumber(optional($this->deposit)->sum('amount'))->getValue();

        });

        $grid->column('invitation_code','推广编码')->copyable();

        $grid->column('created_at', __('注册时间'));

        $grid->column('当日交易额(元)')->display(function (){
            $today_amount = $this->totalAmount->whereBetween('created_at', [Carbon::now()->startOfDay(), Carbon::now()->endOfDay()]);
            return bigNumber(optional($today_amount)->sum('withdraw_amount'))->getValue();
        });

        $grid->column('总交易额(元)')->display(function (){
            return bigNumber(optional($this->totalAmount)->sum('withdraw_amount'))->getValue();
        })->sortable();

        $grid->column('下级用户数')->display(function (){
            return optional($this->downLevel)->count();
        });

        $grid->column('下级用户')->expand(function($param){
            $contact = $this->downLevel->map(function ($val){
                return $val->only(['id','username','name']);
            });

            return new Table(['ID','会员账号','会员姓名'],$contact->toArray());
        });

        $grid->column('vip', '是否为vip')->switch([
            'off' => ['value'=> 0, 'text' => '否', 'color' => 'danger'],
            'on' => ['value'=> 1, 'text' => '是', 'color' => 'success'],
        ]);

        $grid->column('status', __('状态'))->display(function ($status){
            if ($status == 0){
                $label = "<a class='label label-danger'>冻结</a>";
            }elseif($status == 1){
                $label = "<a class='label label-success'>正常</a>";
            }else{
                $label = "<a class='label label-default'>注销</a>";
            }

            return $label;
        });

        $grid->column('remark', __('备注'))->editable();

        //操作栏
        $grid->actions(function ($actions){
            $actions->disableView();
            $actions->disableDelete();
            if($this->row->status == 2){
                $actions->disableEdit();
            }
        });
        $grid->disableExport();
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
        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('pid', __('Pid'));
        $show->field('status', __('Status'));
        $show->field('amount', __('Amount'));
        $show->field('username', __('Username'));
        $show->field('name', __('Name'));
        $show->field('invitation_code', __('Invitation code'));
        $show->field('bank_name', __('Bank name'));
        $show->field('bank_card', __('Bank card'));
        $show->field('email_verified_at', __('Email verified at'));
        $show->field('password', __('Password'));
        $show->field('remember_token', __('Remember token'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        $show->panel()->tools(function ($tools){
            $tools->disableEdit();
            $tools->disableDelete();
        });

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new User);

        $form->switch('status', __('状态'))->states([
            'on'  => ['value' => 1, 'text' => '正常', 'color' => 'success'],
            'off' => ['value' => 0, 'text' => '冻结', 'color' => 'danger'],
        ])->default(1);
        $form->switch('vip', __('是否为vip'))->states([
            'off' => ['value' => 0, 'text' => '否', 'color' => 'danger'],
            'on'  => ['value' => 1, 'text' => '是', 'color' => 'success'],
        ])->default(0);
        $form->text('username', __('用户名'));
        $form->text('name', __('实名'));
        $form->text('invitation_code', __('邀请码'));
        $form->text('bank_name', __('开户行'));
        $form->text('bank_card', __('银行卡号'));
        $form->text('remark', __('备注'));
        $form->password('password', __('密码'))->required()->rules('required')->default(function ($form){
            return $form->model()->password;
        });

        $form->saving(function (Form $form){
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = bcrypt($form->password);
            }
        });

        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
            $tools->disableView();
        });
        return $form;
    }
}
