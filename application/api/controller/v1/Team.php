<?php
/**
 * Created by PhpStorm.
 * User: mac
 * Date: 2018/12/24
 * Time: 5:01 PM
 */

namespace app\api\controller\v1;
use app\api\model\Team as TeamModel;

class Team
{
    public function getAllTeam(){
        $teams = TeamModel::getAllTeams();
        return $teams;
    }
}