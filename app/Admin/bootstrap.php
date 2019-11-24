<?php

/**
 * Laravel-admin - admin builder based on Laravel.
 * @author z-song <https://github.com/z-song>
 *
 * Bootstraper for Admin.
 *
 * Here you can remove builtin form field:
 * Encore\Admin\Form::forget(['map', 'editor']);
 *
 * Or extend custom form field:
 * Encore\Admin\Form::extend('php', PHPEditor::class);
 *
 * Or require js and css assets:
 * Admin::css('/packages/prettydocs/css/styles.css');
 * Admin::js('/packages/prettydocs/js/main.js');
 *
 */

use Encore\Admin\Admin;

Encore\Admin\Form::forget(['map', 'editor']);

Encore\Admin\Form::init(function (\Encore\Admin\Form $form) {

    $form->disableEditingCheck();

    $form->disableCreatingCheck();

    $form->disableViewCheck();

    $form->tools(function (\Encore\Admin\Form\Tools $tools) {
        $tools->disableDelete();
        $tools->disableView();
//        $tools->disableList();
    });
});

Admin::js('/js/app.js');

Admin::navbar(function (\Encore\Admin\Widgets\Navbar $navbar) {
    $url = asset('tishiyin.mp3');
    $navbar->right("<div style='float: left;margin-top: 11px'><audio src='{$url}' style='width: 250px;height: 30px' controls id='audio'></audio></div>");
});
