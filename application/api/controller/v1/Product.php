<?php
/**
 * Created by PhpStorm.
 * User: yin
 * Date: 2018/6/12
 * Time: 6:31
 */

namespace app\api\controller\v1;

use app\api\model\Product as ProductModel;
use app\api\validate\Count;
use app\lib\exception\ProductException;

class Product
{
    public function getRecent($count=15){
        (new Count())->goCheck();
        $products = ProductModel::getMostRecent($count);
        if($products->isEmpty()){
            throw new ProductException();
        }
        //$collection = collection($products);
        //$products = $collection->hidden(['summery']);
        $products = $products->hidden(['summary']);
        return $products;
    }
}