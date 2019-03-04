<?php
/**
 * Created by PhpStorm.
 * User: cyx
 * Date: 2018-07-05
 * Time: 15:28
 */

namespace app\api\controller\v1;


use app\api\service\UserToken;

class Phone
{

    /**
     *
     * TP 框架集成微信小程序 getPhoneNumber 获取手机号功能
     * 博客地址
     */
    public function getPhone($code)
    {
        $post = input('post.');
        //$phonePath =  config('setting.phone_path').'/wxBizDataCrypt.php';
        include_once ("./phone/wxBizDataCrypt.php"); //引入 wxBizDataCrypt.php 文件
        $appid = 'wx472b8ca2a2e1b9a9';
        $ut = new UserToken($code);
        $sessionAll = $ut->getSessionKey($code);
        $sessionKey = $sessionAll['session_key'];
        $encryptedData= $post['encryptedData'];
        //$encryptedData= I('get.encryptedData');
        $iv = $post['iv'];

        $pc = new \WXBizDataCrypt($appid, $sessionKey); //注意使用\进行转义
        $errCode = $pc->decryptData($encryptedData, $iv, $data );

        if ($errCode == 0) {
            print($data . "\n");
        } else {
            print($errCode . "\n");
        }
    }
    }