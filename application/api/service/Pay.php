<?php
/**
 * Created by PhpStorm.
 * User: yin
 * Date: 2018/7/15
 * Time: 16:48
 */

namespace app\api\service;

use app\api\model\Order as OrderModel;
use app\api\service\Order as OrderService;
use app\lib\enum\OrderStatusEnum;
use app\lib\exception\OrderException;
use app\lib\exception\TokenException;
use think\Exception;
use think\Loader;
use think\Log;

//extend/WxPay/WxPay.Api.php
Loader::import('WxPay.WxPay',EXTEND_PATH,'.Api.php');
class Pay
{
    private $orderNo;
    private $orderID;
//    private $orderModel;

    function __construct($orderID)
    {
        if (!$orderID)
        {
            throw new Exception('订单号不允许为NULL');
        }
        $this->orderID = $orderID;
    }

    //完整业务流程的主方法，类似order
    public function pay($status)
    {
        //订单号可能根本就不存在
        //订单号确实存在，但是，订单号和当前用户是不匹配的，
        //用户是合法的，也有自己的令牌，但是操作的数据不是自己的
        //订单有可能已经被支付过
        //进行库存量检测
        //检测的原则：把最有可能发生的情况的检测放在最前面，这样他一但被检测出来就不会继续后续的步骤了。节约服务器性能
        //第二个原则就是从代码本身的消耗服务器性能来说，消耗服务器性能多的，尽量放后面，先把简单的，对数据库性能消耗小的检测放到前面
        //$this->checkOrderValid();
        //$orderService = new OrderService();
        //$status =  $orderService->checkOrderStock($this->orderID);
        //if (!$status['pass'])
        //{
        //    return $status;
        //}
        //return $this->makeWxPreOrder($status['orderPrice']);
        return $this->makeWxPreOrder($status);
        //return $this->makeWxPreOrder('0.2');
    }
//微信预订单：
    private function makeWxPreOrder($status)
    {
        //openid
        $openid = Token::getCurrentTokenVar('openid');
        if(!$openid)
        {
            throw new TokenException();
        }
        $wxOrderData = new \WxPayUnifiedOrder();
        //Oc1231此单号必须实时变化
        $wxOrderData->SetOut_trade_no($status['id']);
        //$wxOrderData->SetOut_trade_no($this->orderNo);
        $wxOrderData->SetTrade_type('JSAPI');
        $wxOrderData->SetTotal_fee($status['orderPrice'] * 100);//单位是分，所以要转换成元
        $wxOrderData->SetBody('奢无忧');
        $wxOrderData->SetOpenid($openid);
        $wxOrderData->SetNotify_url(config('secure.pay_back_url'));//微信异步通知支付结果

        return $this->getPaySignature($wxOrderData);
    }

    //向微信请求订单号并生成签名
    private function getPaySignature($wxOrderData)
    {
        //$wxOrder = \WxPayApi::unifiedOrder($wxOrderData);
        $wxOrder = \WxPayApi::unifiedOrder($wxOrderData);
        // 失败时不会返回result_code
        if($wxOrder['return_code'] != 'SUCCESS' || $wxOrder['result_code'] !='SUCCESS'){
            Log::record($wxOrder,'error');
            Log::record('获取预支付订单失败','error');
            //            throw new Exception('获取预支付订单失败');
        }
        //prepay_id
        $this->recordPreOrder($wxOrder);
        $signature = $this->sign($wxOrder);
        return $signature;
    }

    private function recordPreOrder($wxOrder){
        // 必须是update，每次用户取消支付后再次对同一订单支付，prepay_id是不同的
        //OrderModel::where('id', '=', $this->orderID)
        //    ->update(['prepay_id' => $wxOrder['prepay_id']]);
        //OrderModel::create(['prepay_id' => $wxOrder['prepay_id']]);
    }

    // 签名
    private function sign($wxOrder)
    {
        $jsApiPayData = new \WxPayJsApiPay();
        $jsApiPayData->SetAppid(config('wx.app_id'));
        $jsApiPayData->SetTimeStamp((string)time());
        $rand = md5(time() . mt_rand(0, 1000));
        $jsApiPayData->SetNonceStr($rand);
        $jsApiPayData->SetPackage('prepay_id=' . $wxOrder['prepay_id']);
        $jsApiPayData->SetSignType('md5');
        $sign = $jsApiPayData->MakeSign();
        $rawValues = $jsApiPayData->GetValues();
        $rawValues['paySign'] = $sign;
        unset($rawValues['appId']);
        return $rawValues;
    }


    private function checkOrderValid()
    {
        $order = OrderModel::where('id', '=', $this->orderID)
            ->find();
        if (!$order) {
            throw new OrderException();
        }
        if(!Token::isValidOperate($order->user_id))
        {
            throw new TokenException(
                [
                    'msg' => '订单与用户不匹配',
                    'errorCode' => 10003
                ]);
        }
        if($order->status != OrderStatusEnum::UNPAID){
            throw new OrderException([
                'msg' => '订单已支付过啦',
                'errorCode' => 80003,
                'code' => 400
            ]);
        }
        $this->orderNo = $order->order_no;
        return true;
    }


}