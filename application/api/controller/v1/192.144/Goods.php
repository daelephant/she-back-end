<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/10/4
 * Time: 上午11:17
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\model\StockBrand;
use app\api\model\StockCat;
use app\api\validate\GoodNew;
use app\api\validate\IDMustBePostiveInt;
use app\lib\exception\GoodsException;
use app\lib\exception\MissFileException;
use app\lib\exception\SuccessMessage;
use app\lib\exception\UserException;
use think\Db;
use app\api\model\Goods as GoodsModel;
use app\api\service\Token as TokenService;
use app\api\service\Order as OrderService;
use app\api\model\User as UserModel;
use think\Exception;

class Goods extends BaseController
{
    protected $beforeActionList = [
        'checkExclusiveScope' => ['only' => 'getAllGoods'],
        //'checkPrimaryScope' => ['only' => 'getDetail, getSummaryByUser']
    ];


    public function getAllGoods($page=1){
        $searchData = input('get.');
        $search = [];
        $orderBy = [];
        if(array_key_exists('size',$searchData)&&$searchData['size']){
            $size=$searchData['size'];
        }else{
            $size=21;
        }

        //获取当前用户上传的订单

        //获取当前用户上传的订单

        if(array_key_exists('user_id',$searchData) && $searchData['user_id']){
            $uid = TokenService::getCurrentUid();
            //$user = UserModel::get($uid);
            if(!$uid){
                throw new UserException();
            }
            $search['user_id'] =  $uid;
        }

        if(array_key_exists('category',$searchData) &&$searchData['category']){
            $search['cat_id'] =  $searchData['category'];
        }
        if (array_key_exists('brand',$searchData) && $searchData['brand']){
            $search['brand_id'] =  $searchData['brand'];
        }

        if (array_key_exists('key',$searchData) && $searchData['key']){
            $search['model_num']  = ['like','%'.$searchData['key'].'%'];
        }

        //$searchData['price_start'] = $searchData['price_start']+$searchData['price_start'];
        if(array_key_exists('price_start',$searchData) && $searchData['price_start'] === "0"){
            $search['market_price'] = array('between', array(0, $searchData['price_end']+0));
        }
        if (array_key_exists('price_start',$searchData) && array_key_exists('price_end',$searchData)){
            if( $searchData['price_start'] && $searchData['price_end']){
                $search['market_price'] = array('between', array($searchData['price_start']+0, $searchData['price_end']+0));
            }
        }
        if(array_key_exists('sort_by_time',$searchData)&&$searchData['sort_by_time']){
            $orderBy['addtime'] =  $searchData['sort_by_time'];
        }else{
            $orderBy['addtime'] = 0;
        }
        $pagingData = GoodsModel::getGoodsByPage($page,$size,$search,$orderBy);
        if ($pagingData->isEmpty())
        {
            return [
                'current_page' => $pagingData->currentPage(),
                'data' => []
            ];
        }

        $data = $pagingData->hidden(['is_best', 'is_floor','is_hot'])
            ->toArray();

        return [
            'current_page' => $pagingData->currentPage(),
            'data' => $data
        ];
    }

    public function getAllGoodsByCa($cid,$page=1, $size=20){
        $pagingData = GoodsModel::getGoodsByPageCa($cid,$page,$size);
        if ($pagingData->isEmpty())
        {
            return [
                'current_page' => $pagingData->currentPage(),
                'data' => []
            ];
        }

        $data = $pagingData->hidden(['is_best', 'is_floor','is_hot'])
            ->toArray();
        return [
            'current_page' => $pagingData->currentPage(),
            'data' => $data
        ];
    }

    public function getAllGoodsByPri($pri,$page=1, $size=20){
        $pagingData = GoodsModel::getGoodsByPagePri($pri,$page,$size);
        if ($pagingData->isEmpty())
        {
            return [
                'current_page' => $pagingData->currentPage(),
                'data' => []
            ];
        }

        $data = $pagingData->hidden(['is_best', 'is_floor','is_hot'])
            ->toArray();
        return [
            'current_page' => $pagingData->currentPage(),
            'data' => $data
        ];
    }

    public function getAllGoodsByNew($newlevel,$page=1, $size=20){
        if($newlevel == 0){
            $pagingData = GoodsModel::getGoodsByPage($page,$size);
        }else{
            $pagingData = GoodsModel::getGoodsByPageNew($newlevel,$page,$size);
        }

        if ($pagingData->isEmpty())
        {
            return [
                'current_page' => $pagingData->currentPage(),
                'data' => []
            ];
        }

        $data = $pagingData->hidden(['is_best', 'is_floor','is_hot'])
            ->toArray();
        return [
            'current_page' => $pagingData->currentPage(),
            'data' => $data
        ];
    }

    //订单详情接口
    public function getDetail($id)
    {
        (new IDMustBePostiveInt())->goCheck();
        $goodDetail = GoodsModel::getGoodById($id);
        //$goodDetail = Db::connect('mysql://root:root@127.0.0.1:3306/stock#utf8mb4')->table('p2018_goods')->find($id);
        if(!$goodDetail)
        {
            throw new GoodsException();
        }
        return $goodDetail->hidden(['is_on_sale']);
        //return $goodDetail;
    }
    public function getAllBrands()
    {
        $brands = StockCat::getBrands();
        return $brands;

    }
    function register_1(){
        Db::startTrans();
        try {
            $file = request()->file('image');
            //var_dump($file);
            $flag = 'product-' . (new OrderService())->makeOrderNo();
            // 移动到框架应用根目录/public/uploads/ 目录下

            $info = $file->validate(['size' => 15728640])->move(ROOT_PATH . 'public' . DS . 'images', $flag);

            if ($info) {
                $receive = array();
                $path = DS . $info->getSaveName();
                //$path =  $info->getSaveName();
                $receive['pic'] = $path;
                $receive['mid_pic'] = $path;
                $receive['big_pic'] = $path;
                $receive['only_num'] = input('param.only_num');
                $configdb2 = config('setting.db_config2');
                Db::connect($configdb2)->table('p2018_goods_pic')->insert($receive);
                Db::commit();
            } else {
                //无图片===============================================================
                return json(new MissFileException(), 400);
            }
        }catch
        (Exception $ex) {
            Db::rollback();
            throw $ex;
        }
    }
    //临时表数据拼接之后加入正式信息表
    function temp_info(){
        $validate = new GoodNew();
        $validate->goCheck();

        $uid = TokenService::getCurrentUid();
        $user = UserModel::get($uid);

        if(!$user){
            throw new UserException();
        }
        $test09 = input('post.');
        $dataArray = $validate->getDataByRule(input('post.'));//过滤
        $test09['addtime'] = date('Y-m-d H:i:s',time());
        $test09['goods_name'] = (new OrderService())->makeOrderNo();


        //通过关联模型新增一条UserProduct
        Db::startTrans();
        try {
            $user->good()->save($test09);
            $configdb2 = config('setting.db_config2');
            $good = Db::connect($configdb2)->table('p2018_goods')->field('id')->where('only_num', $test09['only_num'])->find();
            $goodId = $good['id'];

            Db::connect($configdb2)->table('p2018_goods_pic')->where('only_num', $test09['only_num'])->update(['goods_id' => $goodId]);
        }catch
        (Exception $ex) {
            Db::rollback();
            throw $ex;
        }
        return json(new SuccessMessage(),200);
    }

}