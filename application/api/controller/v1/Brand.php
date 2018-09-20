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

class Brand extends BaseController
{
    public function getAllInCategory($id){
        (new IDMustBePostiveInt())->goCheck();
        $brands = BrandModel::getbrandsByCategoryID($id);
        if($brands->isEmpty()){
            throw new BrandException();
        }
        //$brands = $brands->hidden(['summary']);
        return $brands;
    }
}