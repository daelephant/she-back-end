<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/9/20
 * Time: 下午8:44
 */

namespace app\api\model;


class Brand extends BaseModel
{

    public static function getbrandsByCategoryID($categoryID)
    {
        $brands = self::where('category_id','=',$categoryID)->select();
        return $brands;
    }
}