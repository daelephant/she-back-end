<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/10/4
 * Time: 下午12:03
 */

namespace app\api\model;


class Goods extends BaseModel
{
    // 设置当前模型对应的完整数据表名称
    protected $table = 'p2018_goods';

    // 设置当前模型的数据库连接
    protected $connection = [
            // 数据库类型
            'type'        => 'mysql',
            // 数据库连接DSN配置
            'dsn'         => '',
            // 服务器地址
            'hostname'    => '127.0.0.1',
            // 数据库名
            'database'    => 'stock',
            // 数据库用户名
            'username'    => 'root',
            // 数据库密码
            'password'    => 'Cyx.2018',
            // 数据库连接端口
            'hostport'    => '3306',
            // 数据库连接参数
            'params'      => [],
            // 数据库编码默认采用utf8
            'charset'     => 'utf8mb4',
            // 数据库表前缀
            'prefix'      => '',
    ];
    protected $hidden = ['goods_desc','is_delete','logo','sm_logo','mid_logo','mbig_logo','type_id','sort_num','is_updated','is_new','is_hot','is_best','is_floor','big_logo','is_new','is_new'];
    public function getBigLogoAttr($value,$data){
        return $this->prefixImgUrlIgnore($value,$data);
    }

    public function imgs()
    {
        return $this->hasMany('goodsimgs','goods_id','id');//一对多关系
    }

    public function getbrand()
    {
        return $this->belongsTo('goodsbrand','brand_id','id');
    }
    public function getcat()
    {
        return $this->belongsTo('goodscategory','cat_id','id');
    }
//$good = self::with('imgs,getbrand,getcat')->find($id);
    public static function getGoodsByPage($page=1, $size=20,$search,$orderBy){
        //if ($searchkey){
        //    $search['model_num']  = ['like','%'.$searchkey.'%'];
        //}

        if($orderBy['addtime']){
            $search['is_on_sale'] =  '是';
            $search['check_status'] =  1;
            $pagingData = self::with('imgs,getbrand,getcat')->order('addtime desc')->where($search)
                ->paginate($size, true, ['page' => $page]);
        }else{
            $search['is_on_sale'] =  '是';
            $search['check_status'] =  1;
            $pagingData = self::with('imgs,getbrand,getcat')->order('brand_id asc')->where($search)
                ->paginate($size, true, ['page' => $page]);
        }
        if (array_key_exists('user_id',$search)){
            unset($search['check_status']);
            unset($search['is_on_sale']);
            unset($pagingData);
            $search['check_status'] =  ['neq','0'];
            $pagingData = self::with('imgs,getbrand,getcat')->order('addtime desc')->where($search)
                ->paginate($size, true, ['page' => $page]);
        }

        return $pagingData ;
    }
    public static function getGoodsByPageCa($cid,$page=1, $size=20){
        //$where["account"]=$arr[0];
        //$where["psw"]=$arr[1];
        $pagingData = self::with('getbrand,getcat')->order('addtime desc')->where([['cat_id','=',$cid],['is_on_sale','=','是']])
            ->paginate($size, true, ['page' => $page]);
        return $pagingData ;
    }

    public static function getGoodsByPagePri($pri,$page=1, $size=20){
        switch ($pri)
        {
            case 0:
                $cid = ['1','99990000'];
                break;
            case 1:
                $cid = ['1','10000'];
                break;
            case 2:
                $cid = ['10000','50000'];
                break;
            case 3:
                $cid = ['50000','100000'];
                break;
            case 4:
                $cid = ['100000','99990000'];
                break;
        }

        $pagingData = self::with('getbrand,getcat')->order('addtime desc')->where('market_price','between',$cid)->where('is_on_sale','=','是')
            ->paginate($size, true, ['page' => $page]);
        return $pagingData ;
    }

    public static function getGoodsByPageNew($newlevel,$page=1, $size=20){
        switch ($newlevel)
        {
            case 0:
                $cid = 0;
                break;
            case 1:
                $cid = '全新';
                break;
            case 2:
                $cid = '99';
                break;
            case 3:
                $cid = '95';
                break;
            case 4:
                $cid = '90';
                break;
            case 5:
                $cid = '其他';
                break;
        }

        $pagingData = self::with('getbrand,getcat')->order('addtime desc')->where('new_level','=',$cid)->where('is_on_sale','=','是')
            ->paginate($size, true, ['page' => $page]);
        return $pagingData ;
    }

    public static function getGoodById($id){
        $good = self::with('imgs,getbrand,getcat')->find($id);
        return $good;
    }

    public static function getBrands(){
        $brands = self::with('getbrand,getcat')->select();
        return $brands;
    }
}
