<?php
/**
 * Created by PhpStorm.
 * User: yin
 * Date: 2018/9/23
 * Time: 12:13
 */

namespace app\api\model;


class ImageCategory extends BaseModel
{
    public function getUrlAttr($value,$data){
        return $this->prefixImgUrl($value,$data);
    }
    protected $hidden = ['id','from','delete_time','update_time','category_id'];

}