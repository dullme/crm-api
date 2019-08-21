<?php

namespace App\Admin\Controllers;

use App\CustomerIndustry;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CustomerIndustryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '行业管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new CustomerIndustry);

        $grid->column('id', __('ID'));
        $grid->column('name', __('名称'));
        $grid->column('is_show', __('是否显示'))->switch();
        $grid->column('created_at', __('添加时间'));

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
        $show = new Show(CustomerIndustry::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('名称'));
        $show->field('is_show', __('是否显示'));
        $show->field('created_at', __('添加时间'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new CustomerIndustry);

        $form->text('name', __('名称'));
        $form->switch('is_show', __('是否显示'))->default(true);
        $form->hidden('admin_user_id');
        $form->saving(function (Form $form) {
            $form->admin_user_id = Auth('admin')->user()->id;
        });

        return $form;
    }
}
