<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/11/19
 * Time: 11:00 AM
 */

namespace app\api\model;


class BrandItem extends BaseModel
{

    protected $hidden = ['img_id','brand_id','delete_time','id','img.only_num','img.product_id'];
    //去关联img表
    public function img()
    {
        //描述一对一的关系belongsTo
        return $this->belongsTo('Image','img_id','id');
    }
}