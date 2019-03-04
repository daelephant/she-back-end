<?php
/**
 * Created by PhpStorm.
 * User: yin
 * Date: 2018/7/15
 * Time: 16:33
 */

namespace app\api\controller\v1;


use app\api\controller\BaseController;
use app\api\service\WxNotify;
use app\api\validate\IDMustBePostiveInt;
use app\api\service\Pay as PayService;
use app\lib\exception\SuccessMessage;
use app\lib\exception\UserException;
use think\Log;
use app\api\service\Token as TokenService;
use app\api\model\User as UserModel;

class Pay extends BaseController
{
    protected $beforeActionList = [
        'checkExclusiveScope' => ['only' => 'getPreOrder']
    ];

    public function getPreOrder($id='')
    {
        //(new IDMustBePostiveInt())->goCheck();
        $pay = new PayService($id);
        $status = input('post.');
        return $pay->pay($status);
    }
    //微信端调用的接口
    public function redirectNotify()
    {
        //通知频率为15/15/30/180/1800/1800/1800/3600,单位：秒
        //1、检查库存量，超卖
        //2、更新这个订单的status状态
        //3、减库存
        //如果成功处理，我们返回微信成功处理的信息。否则，我们需要返回没有成功处理

        //微信调用接口，特点：post,xml格式，不会携带参数
        Log::write('1大象测试测试日志信息，这是警告级别，并且实时写入','notice');
        $notify = new WxNotify();
        $notify->handle();

    }


    public function notifyConcurrency()
    {
        $notify = new WxNotify();
        $notify->handle();
    }

    public function receiveNotify()
    {
//        $xmlData = file_get_contents('php://input');
//        Log::error($xmlData);
//        $notify = new WxNotify();
//        $notify->handle();
//        $xmlData = file_get_contents('php://input');
//        $result = curl_post_raw('http:/zerg.cn/api/v1/pay/re_notify?XDEBUG_SESSION_START=13133',
//            $xmlData);
//        return $result;
//        Log::error($xmlData);

    }

    public function wx_set_vip()
    {


        $uid = TokenService::getCurrentUid();
        $user = UserModel::get($uid);
        if (!$user) {
            throw new UserException();
        }
        $pay_price = input('put.');

        $resData = [];
        $resData['pay_price'] = $pay_price['pay_price'];
        if(substr($pay_price['pay_price'],'0','1') == '1'){
            $resData['vip_deadtime'] = strtotime("+1 year");
        }else{
            $resData['vip_deadtime'] = strtotime("+2 year");
        }
        $resData['update_time_vip'] = time();
        $resData['scope'] = 32;
        $user_up = $user->save($resData);
        if ($user_up){
            return json(new SuccessMessage(),200);
        }else{
            throw new UserException();
        }
    }
    public function getUserinfo()
    {
        $uid = TokenService::getCurrentUid();
        $user = UserModel::get($uid);
        if (!$user) {
            throw new UserException();
        }
        //$userData = $user->find();
        $user['phone'] = $user['extend'];

        $user->hidden(['openid','nickname','delete_time','create_time','update','extend','pay_price']);

        return $user;

    }
}