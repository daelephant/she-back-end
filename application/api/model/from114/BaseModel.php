<?php

namespace app\api\model;

use think\Model;

class BaseModel extends Model
{
    protected function prefixImgUrl($value,$data){
        $finalUrl = $value;
        if (array_key_exists('from',$data)){

            if($data['from'] == 1){
                $finalUrl = config('setting.img_prefix').$value;
            }
        }else
            $finalUrl = config('setting.img_prefix').$value;
        return $finalUrl;
    }

    protected function prefixImgUrlIgnore($value,$data){
        $finalUrl = $value;
        if(substr($value,0,1) == '/'){

            $finalUrl = config('setting.img_prefix').$value;
        } else{

            $finalUrl = config('setting.stock_img_prefix').$value;
        }
        return $finalUrl;
    }
    //
}
