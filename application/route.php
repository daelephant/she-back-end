<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\Route;
//Route::rule('hello','sample/Test/hello');
//Route::rule('hello','sample/Test/hello','GET|POST',['https'=>false]);
//Route::get('hello/:id','sample/Test/hello');
//Route::get('hello/:id','sample/Test/hello');
//Route::post('hello/:id','sample/Test/hello');

//固定的三段式  模块名/控制器名/操作方法名  有自定义目录用.表示
//api/v1表示这是api接口，v1版本
Route::get('api/:version/banner/:id','api/:version.Banner/getBanner');

//查询通常定义为get
Route::get('api/:version/theme','api/:version.Theme/getSimpleList');
//和上面获取主题的列表的简要信息 做区分，这里传入id信息表示获取某个具体theme的详细信息
Route::get('api/:version/theme/:id','api/:version.Theme/getComplexOne');

Route::get('api/:version/product/recent','api/:version.Product/getRecent');
Route::post('api/:version/product/newProduct','api/:version.Product/createProduct');
Route::post('api/:version/product/uploadProduct','api/:version.Product/upload');
Route::post('api/:version/product/register_1','api/:version.Product/register_1');
Route::post('api/:version/product/temp_info','api/:version.Product/temp_info');

Route::get('api/:version/product/by_category','api/:version.Product/getAllInCategory');
Route::get('api/:version/product/:only_num','api/:version.Product/getOne');

Route::get('api/:version/brand/by_category','api/:version.Brand/getAllInCategory');

//路由分组
//Route::group('api/:version/product',function(){
//    Route::get('/recent','api/:version.Product/getRecent');
//    Route::get('/by_category','api/:version.Product/getAllInCategory');
//    Route::get('/:id','api/:version.Product/getOne',[],['id'=>'\d+']);
//});

//Token
Route::get('api/:version/category/all','api/:version.Category/getAllCategories');
Route::post('api/:version/token/user','api/:version.Token/getToken');
Route::post('api/:version/token/verify','api/:version.Token/verifyToken');
Route::post('api/:version/token/app','api/:version.Token/getAppToken');

//address
Route::post('api/:version/address','api/:version.Address/createOrUpdateAddress');
Route::get('api/:version/address','api/:version.Address/getUserAddress');

Route::get('api/:version/second','api/:version.Address/second');

//order
Route::post('api/:version/order','api/:version.Order/placeOrder');
Route::post('api/:version/order/:id','api/:version.Order/getDetail',[],['id'=>'\d+']);//第三个【】是可选项，第四个是限定id的值类型限定，这里的意思是id必须是正整数（根据需求写正则）

Route::get('api/:version/order/by_user', 'api/:version.Order/getSummaryByUser');
Route::get('api/:version/order/paginate', 'api/:version.Order/getSummary');
Route::put('api/:version/order/delivery', 'api/:version.Order/delivery');

//Pay
Route::post('api/:version/pay/pre_order', 'api/:version.Pay/getPreOrder');
Route::post('api/:version/pay/notify', 'api/:version.Pay/receiveNotify');//微信服务器需要调用的接口
Route::post('api/:version/pay/re_notify', 'api/:version.Pay/redirectNotify');
Route::post('api/:version/pay/concurrency', 'api/:version.Pay/notifyConcurrency');