<?php
/**
 * Created by PhpStorm.
 * User: cyx
 * Date: 2018-07-05
 * Time: 16:28
 */
return [
    // 小程序app_id

    'app_id' => 'wx472b8ca2a2e1b9a9',
    // 小程序app_secret
    'app_secret' => 'b123a4f29586f9bbaacdad61c9e6b0f5',
    // 微信使用code换取用户openid及session_key的url地址
    'login_url' => "https://api.weixin.qq.com/sns/jscode2session?appid=%s&secret=%s&js_code=%s&grant_type=authorization_code",//%s作为占位符
    // 微信获取access_token的url地址
    'access_token_url' => "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s",
];
