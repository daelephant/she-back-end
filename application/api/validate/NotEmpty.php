<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/8/31
 * Time: 下午2:26
 */

namespace app\api\validate;


class NotEmpty extends BaseValidate
{
    protected $rule=[
        'only_num' => 'require|isNotEmpty'
    ];
    protected $message=[
        'only_num' => 'only_num参数必须存在'
    ];

}