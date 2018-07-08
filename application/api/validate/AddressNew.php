<?php
/**
 * Created by PhpStorm.
 * User: yin
 * Date: 2018/7/8
 * Time: 18:45
 */

namespace app\api\validate;


use app\lib\exception\BaseException;

class AddressNew extends BaseValidate
{
    protected $rule=[
        'name' => 'require|isNotEmpty',
        'mobile' => 'require|isMobile',
        'province' => 'require|isNotEmpty',
        'city' => 'require|isNotEmpty',
        'country' => 'require|isNotEmpty',
        'detail' => 'require|isNotEmpty'
    ];
}