<?php

/**
 * 生成纯数字的随机数
 * @param $len
 * @return bool|string
 */
function randStr($len) {
    $chars = str_repeat('0123456789', $len);
    $chars = str_shuffle($chars);
    $str = substr($chars, 0, $len);

    return $str;
}
