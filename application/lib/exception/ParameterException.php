<?php
/**
 * Created by PhpStorm.
 * User: yin
 * Date: 2018/5/31
 * Time: 6:22
 */

namespace app\lib\exception;


class ParameterException extends BaseException
{
    //预制变量：写子类的时候这样一些成员变量都是会被覆盖的
    //HTTP 状态码 404,200
    public $code = 400;

    //错误具体信息
    public $msg = '参数错误';

    //自定义的错误码
    public $errorCode = 10000;
}