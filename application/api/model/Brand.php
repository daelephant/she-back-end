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

    protected $hidden = ['id','from','category_id','delete_time','update_time'];
    //这里items不是普通的函数，而是关联：
    public function items()
    {
        //当前模型是Banner要关联的模型是BannerItem
        return $this->hasMany('BrandItem','brand_id','id');
    }
    //具体的业务实现：根据Banner id获取相关的业务。

    public static function getbrands()
    {
        $banner = self::with(['items','items.img'])->select();
        return $banner;
    }

    public function getBrandImgUrlAttr($value,$data){
        return $this->prefixImgUrl($value,$data);
    }


    public static function getbrandsByCategoryID($categoryID)
    {
        $brandsImg = self::where('category_id','=',$categoryID)->where('from','=','1')->select();
        $brandsName = self::where('category_id','=',$categoryID)->where('from','=','0')->select();
        //$categoryImg =  CategoryModel::getCategorysById($categoryID);
        $brands = array(
            'img' => $brandsImg,
            'name'=> $brandsName
        );
        return $brands;
    }


}