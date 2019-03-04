<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/10/4
 * Time: 上午11:59
 */

namespace app\lib\exception;


class GoodsException extends BaseException
{
    public $code = 404;
    public $msg = '商品不存在，请检查ID';
    public $errorCode = 80001;
}