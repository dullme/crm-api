<?php

namespace App\Admin\Controllers;

use App\Enums\Status;
use App\Models\Employee;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Routing\Controller;

class AdminUserController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header('大客户管理')
            ->description(trans('admin.list'))
            ->body($this->grid()->render());
    }

    protected function grid()
    {
        $userModel = config('admin.database.users_model');
        $grid = new Grid(new $userModel());
        $grid->model()->where('username', '!=', 'admin')->where('id', '!=', 1)->where('name', '!=', '管理员');
        $grid->id('ID')->sortable();
        $grid->username('用户名');
        $grid->name('姓名');
        $grid->company('公司名称');
        $grid->can_create('可开员工数');
        $grid->contact('联系人');
        $grid->contact_mobile('联系人电话');
        $grid->company_address('公司地址');
        $grid->created_at('创建时间');

        $grid->filter(function ($filter){
            $filter->disableIdFilter();
            $filter->like('username', '用户名');
            $filter->like('name', '姓名');
            $filter->like('company', '公司名称');
            $filter->like('contact_mobile', '联系人电话	');
        });

        $grid->disableRowSelector();

        $grid->actions(function ($actions){
            $actions->disableDelete();
        });

        return $grid;
    }

    public function show($id, Content $content)
    {
        return $content
            ->header('大客户管理')
            ->description(trans('admin.detail'))
            ->body($this->detail($id));
    }

    public function edit($id, Content $content)
    {
        return $content
            ->header('大客户管理')
            ->description(trans('admin.edit'))
            ->body($this->form()->edit($id));
    }

    public function create(Content $content)
    {
        return $content
            ->header('大客户管理')
            ->description(trans('admin.create'))
            ->body($this->form());
    }

    protected function detail($id)
    {

        $userModel = config('admin.database.users_model');

        $show = new Show($userModel::findOrFail($id));

        $show->panel()->tools(function ($tools) {
            $tools->disableDelete();
        });;

        $show->id('ID');
        $show->username('用户名');
        $show->name('姓名');
        $show->company('公司名称');
        $show->can_create('可开员工数');
        $show->contact('联系人');
        $show->contact_mobile('联系人电话');
        $show->company_address('公司地址');
        $show->created_at('创建时间');

        return $show;
    }

    public function form()
    {
        $userModel = config('admin.database.users_model');
//        $permissionModel = config('admin.database.permissions_model');
        $roleModel = config('admin.database.roles_model');

        $form = new Form(new $userModel());
        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
        });
        $form->display('id', 'ID');
        $form->text('username', '用户名')->rules('required');
        $form->text('name', '姓名')->rules('required');
        $form->text('company', '公司名称')->rules('required');
        $form->number('can_create', '可开员工数')->default(10)->rules('required');
        $form->text('contact', '联系人')->rules('required');
        $form->text('contact_mobile', '联系人电话')->rules('required');
        $form->text('company_address', '公司地址')->rules('required');

        $form->password('password', trans('admin.password'))->rules('required|confirmed');
        $form->password('password_confirmation', trans('admin.password_confirmation'))->rules('required')->default(function ($form) {
            return $form->model()->password;
        });

        $form->ignore(['password_confirmation']);
        $form->multipleSelect('roles', trans('admin.roles'))->options($roleModel::where('name', '!=', '超级管理员')->where('id', '!=', 1)->get()->pluck('name', 'id'))->rules('required');
//        $form->multipleSelect('permissions', trans('admin.permissions'))->options($permissionModel::all()->pluck('name', 'id'));

        $form->saving(function (Form $form) {
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = bcrypt($form->password);
            }
        });

        return $form;
    }
}
