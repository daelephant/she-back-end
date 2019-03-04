<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/12/24
 * Time: 6:31 PM
 */

namespace app\api\model;


class Team extends BaseModel
{
    public function getSmPicAttr($value,$data){
        return $this->prefixImgUrl($value,$data);
    }
    public function getBigPicAttr($value,$data){
        return $this->prefixImgUrl($value,$data);
    }
    public static function getAllTeams()
    {
        $teams = self::order('weight','desc')->select();
        return $teams;
    }
    public static function getTeamById($id)
    {
        $team = self::find($id);
        return $team;
    }
}