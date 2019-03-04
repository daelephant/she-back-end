<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2019/2/12
 * Time: 4:20 PM
 */

namespace app\api\validate;


use app\api\model\BaseModel;

class GoodNew extends BaseValidate
{
    protected $rule=[
        'cat_id' => 'require|isPositiveInteger',
        //'brand_id' => 'require|isPositiveInteger',
        //'mobile' => 'require|isMobile',//座机电话无法识别
        //'mobile' => 'require|isNotEmpty',//座机电话无法识别
        //'province' => 'require|isNotEmpty',
        //'city' => 'require|isNotEmpty',
        //'country' => 'require|isNotEmpty',
        //'summary' => 'require|isNotEmpty',
        'only_num' => 'require|isNotEmpty',
        //'new_level' => 'number|between:60,100',

    ];
}