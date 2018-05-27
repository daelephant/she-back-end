<?php
/**
 * Created by PhpStorm.
 * User: cyx
 * Date: 2018-05-24
 * Time: 15:31
 */

namespace app\api\validate;


use think\Exception;
use think\Request;
use think\Validate;

class BaseValidate extends Validate
{
    public function goCheck(){
        //获取http传入的参数
        //对这些参数做校验
        $request = Request::instance();//实例化对象
        $params = $request->param();//拿到所有的参数
        $resule = $this->check($params);
        if(!$resule){
            $error = $this->error;
            throw new Exception($error);
        }
        else{
            return true;
        }
    }

}