<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/9/5
 * Time: 下午2:35
 */

namespace app\lib\exception;


class MissFileException extends BaseException
{
    //覆盖父类
    public $code = 400;
    public $msg = '图片不存在，请重新上传';
    public $errorCode = 400001;
}