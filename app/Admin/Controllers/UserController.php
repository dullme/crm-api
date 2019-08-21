<?php

namespace App\Admin\Controllers;

use App\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class UserController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '员工管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User);
        if(Auth('admin')->user()->id ==1 || Auth('admin')->user()->name == '管理员' || Auth('admin')->user()->username == 'admin'){}else{
            $grid->model()->where('admin_user_id', Auth('admin')->user()->id);
        }
        $grid->column('admin_name', __('大客户'))->display(function (){
            return optional($this->adminUser)->username;
        });
        $grid->column('id', __('ID'));
        $grid->column('mobile', __('手机号'));
        $grid->column('name', __('名称'));
        $grid->column('created_at', __('创建时间'));

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

        $show->field('id', __('ID'));
        $show->field('mobile', __('手机号'));
        $show->field('name', __('名称'));

        return $show;
    }

    public function edit($id, Content $content)
    {
        return $content
            ->title($this->title())
            ->description($this->description['edit'] ?? trans('admin.edit'))
            ->body($this->form()->edit($id));
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new User);

        $form->hidden('admin_user_id');
        $form->mobile('mobile', __('手机号'))->rules(function ($form){
            return 'required|unique:users,mobile,'.$form->model()->id;
        },[
            'required' => '请输入手机号',
            'unique' => '手机号已存在'
        ]);
        $form->text('name', __('名称'))->rules('required');
        $form->password('password', __('密码'))->rules('required|confirmed')->default(function ($form){
            return $form->model()->password;
        });
        $form->password('password_confirmation', trans('admin.password_confirmation'))->rules('required')->default(function ($form) {
            return $form->model()->password;
        });

        $form->ignore(['password_confirmation']);

        $form->saving(function (Form $form) {
            if(!$form->model()->id){
                $user_count = User::where('admin_user_id', Auth('admin')->user()->id)->count();
                if(Auth('admin')->user()->can_create <= $user_count){
                    return back()->with(admin_toastr('用户创建已达上限', 'error'));
                }
            }

            $form->admin_user_id = Auth('admin')->user()->id;
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = bcrypt($form->password);
            }
        });
        return $form;
    }
}
