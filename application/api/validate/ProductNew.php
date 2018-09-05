<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/8/22
 * Time: 下午6:06
 */

namespace app\api\validate;


class ProductNew extends BaseValidate
{
    protected $rule=[
        'category_id' => 'require|isPositiveInteger',
        'brand_id' => 'require|isPositiveInteger',
        //'mobile' => 'require|isMobile',//座机电话无法识别
        //'mobile' => 'require|isNotEmpty',//座机电话无法识别
        //'province' => 'require|isNotEmpty',
        //'city' => 'require|isNotEmpty',
        //'country' => 'require|isNotEmpty',
        'summary' => 'require|isNotEmpty',
        'only_num' => 'require|isNotEmpty',
        //'new_level' => 'number|between:60,100',

    ];
}