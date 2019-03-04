<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/10/4
 * Time: 下午4:46
 */

namespace app\api\model;


class GoodsImgs extends BaseModel
{
    // 设置当前模型对应的完整数据表名称
    protected $table = 'p2018_goods_pic';

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
        'password'    => 'root',
        // 数据库连接端口
        'hostport'    => '3306',
        // 数据库连接参数
        'params'      => [],
        // 数据库编码默认采用utf8
        'charset'     => 'utf8mb4',
        // 数据库表前缀
        'prefix'      => '',
    ];
    //protected $hidden = ['sm_pic','mid_pic','id','big_pic','goods_id'];
    public function getPicAttr($value,$data){
        return $this->prefixImgUrlIgnore($value,$data);
    }
}