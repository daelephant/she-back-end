<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/9/20
 * Time: 下午8:53
 */

namespace app\lib\exception;


class BrandException extends BaseException
{
    public $code = 404;
    public $msg = '指定的品牌不存在，请检查参数';
    public $errorCode = 20001;
}