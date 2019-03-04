<?php
/**
 * Created by PhpStorm.
 * User: cyx
 * Date: 2018-06-06
 * Time: 16:38
 */
return [
    'img_prefix' => 'https://apiofcyx.shewuyou.cn/images',
    'token_expire_in' => 7200,
    'stock_img_prefix' => 'https://stock.shewuyou.cn/Public/Uploads/',
    //数据库配置2
    'db_config2' => [
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
    ]
];
