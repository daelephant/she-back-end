<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/9/20
 * Time: 下午8:49
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\validate\IDMustBePostiveInt;
use app\api\model\Brand as BrandModel;
use app\lib\exception\BrandException;

use app\api\model\Category as CategoryModel;

class Brand extends BaseController
{
    public function getAllInCategory($id){
        (new IDMustBePostiveInt())->goCheck();
        $brands = BrandModel::getbrandsByCategoryID($id);

        $categoryImgs = CategoryModel::getCategorysById($id);
        if(!$categoryImgs->isEmpty()) {
            $brands['categoryImgs'] = $categoryImgs;
        }

        if(!is_array($brands)){
            throw new BrandException();
        }
        //if($brands->isEmpty()){
        //    throw new BrandException();
        //}
        //$brands = $brands->hidden(['summary']);
        return $brands;
    }

    public function getAllbrands(){

        $brands = BrandModel::getbrands();

        //if(!is_array($brands)){
        //    throw new BrandException();
        //}

        //if(!$categoryImgs->isEmpty()) {
        //    $brands['categoryImgs'] = $categoryImgs;
        //}

        //if($brands->isEmpty()){
        //    throw new BrandException();
        //}
        //$brands = $brands->hidden(['summary']);
        return $brands;
    }
}