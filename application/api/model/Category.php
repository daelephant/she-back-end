<?php
/**
 * Created by PhpStorm.
 * User: yin
 * Date: 2018/6/12
 * Time: 21:20
 */

namespace app\api\model;


class Category extends BaseModel
{

    public function getCategoryImgUrlAttr($value,$data){
        return $this->prefixImgUrl($value,$data);
    }


//    关联Image表,一对一

    protected $hidden = ['delete_time','update_time','create_time','from'];
    public function img(){
        return $this->belongsTo('Image','topic_img_id','id');
    }

    //一对多

    public function categoryImages(){
        return $this->hasMany('image_category','category_id','id');
    }
    public static function getAllCategorys()
    {
        $categorys = self::with(['categoryImages'])->select();
        return $categorys;
    }
    public static function getCategorysById($id)
    {
        $categorys = self::with(['categoryImages'])->select($id);
        return $categorys;
    }
}