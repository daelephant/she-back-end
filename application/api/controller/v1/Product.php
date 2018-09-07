<?php
/**
 * Created by PhpStorm.
 * User: yin
 * Date: 2018/6/12
 * Time: 6:31
 */

namespace app\api\controller\v1;

use app\api\controller\BaseController;
use app\api\model\Product as ProductModel;
use app\api\validate\Count;
use app\api\validate\IDMustBePostiveInt;
use app\api\validate\NotEmpty;
use app\api\validate\ProductNew;
use app\lib\exception\MissFileException;
use app\lib\exception\ProductException;
use app\api\service\Token as TokenService;
use app\api\service\Order as OrderService;
use app\lib\exception\SuccessMessage;
use app\lib\exception\UserException;
use app\api\model\User as UserModel;
use think\Db;

class Product extends BaseController
{
    public function getRecent($count=15){
        (new Count())->goCheck();
        $products = ProductModel::getMostRecent($count);
        if($products->isEmpty()){
            throw new ProductException();
        }
        //$collection = collection($products);
        //$products = $collection->hidden(['summery']);
        $products = $products->hidden(['summary']);
        return $products;
    }

    public function getAllInCategory($id){
        (new IDMustBePostiveInt())->goCheck();
        $products = ProductModel::getProductsByCategoryID($id);
        if($products->isEmpty()){
            throw new ProductException();
        }
        $products = $products->hidden(['summary']);
        return $products;
    }

    public function getOne($only_num){
        //(new IDMustBePostiveInt())->goCheck();
        (new NotEmpty())->goCheck();
        $product = ProductModel::getProductDetail($only_num);
        if(!$product){
            throw new ProductException();
        }
        return $product;
    }

    //Tp
    public function createProduct(){
        $validate = new ProductNew();
        $validate->goCheck();

        $uid = TokenService::getCurrentUid();
        $user = UserModel::get($uid);
        if(!$user){
            throw new UserException();
        }
        $dataArray = $validate->getDataByRule(input('post.'));
        var_dump($dataArray);
        //$products = ProductModel::create($dataArray);


    }

    //来自TP3.2
//注册---企业
    function register(){
        //program_id、openid
        //账号： account、密码：psw 、账号名称：name、头像：headimage、邮箱： mail、联系人：linkman、联系电话：linktel 、证件号：certificate_num、性别：sex、车牌号：car_num
        //idcard_positive：身份证正面、idcars_reverse 身份证反面
        //driver_license：驾驶证、driving_this：行驶本
        //state 所属状态（1：个人司机、2：合作单位、3：签约单位）

        //如果是司机进来的，账号就是 $_POST["openid"].$_POST["program_id"],密码就是MD5加密的

        $receive=$_POST;
        $car_manerger=M("car_manerger")->where("program_id='".$receive["program_id"]."'"."and openid='".$receive["openid"]."'")->find();

        if(!empty($car_manerger)){
            if($car_manerger["state_register"]==1){
                //待审--不可申请

                $this->ajaxReturn(array('status'=>-777,'msg'=>'待审--该微信不可申请'));
            }if($car_manerger["state_register"]==2){
                //通过--不可申请

                $this->ajaxReturn(array('status'=>-666,'msg'=>'通过--该微信不可申请'));
            }
            // $car_manerger["state_register"]==3 拒绝--可以申请
        }

        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize   =     3145728 ;// 设置附件上传大小
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
        $upload->rootPath  =     './Uploads/'; // 设置附件上传根目录

        // 上传文件	//image_belong:  headimage idcard_positive idcars_reverse driver_license driving_this
        $info   =   $upload->upload();
        if($info){
            $receive['headimage']=$info["headimage"]['savepath'].$info["headimage"]['savename'];

            /* 	$receive['idcard_positive']=$info["idcard_positive"]['savepath'].$info["idcard_positive"]['savename'];
                 $receive['idcars_reverse'] =$info["idcars_reverse"]['savepath'] .$info["idcars_reverse"]['savename'];
                 $receive['driver_license'] =$info["driver_license"]['savepath'] .$info["driver_license"]['savename'];
                 $receive['driving_this']   =$info["driving_this"]['savepath']   .$info["driving_this"]['savename'];
        */
        }else{
            $this->ajaxReturn(array('status'=>-888,'msg'=>'无上传图片'));
            /*	$receive["account"]=$_POST["openid"].$_POST["program_id"];
                $receive["psw"]=md5($_POST["openid"].$_POST["program_id"]);
                if(empty($info["idcard_positive"]) | empty($info["idcars_reverse"]) | empty($info["driver_license"]) | empty($info["driving_this"])){
                    $this->ajaxReturn(array('status'=>-888,'msg'=>'图片未上传'));
                }*/
        }


        $receive['psw']=md5($_POST["psw"]);
        $receive['time_register']=time();
        $receive["state_register"]="1";
        if(M("car_manerger")->add($receive)){
            $this->ajaxReturn(array('status'=>1,'msg'=>'提交成功1'));
        }else{
            $this->ajaxReturn(array('status'=>-1,'msg'=>'提交失败'));
        }
    }

    //注册---个人
    function register_1(){
        Db::startTrans();
        try {
            $file = request()->file('image');
            var_dump($file);
            $flag = 'product-' . (new OrderService())->makeOrderNo();
            // 移动到框架应用根目录/public/uploads/ 目录下
            $info = $file->validate(['size' => 15728640])->move(ROOT_PATH . 'public' . DS . 'images', $flag);

            if ($info) {
                $receive = array();
                $receive['url'] = DS . $info->getSaveName();
                $receive['only_num'] = input('param.only_num');
                Db::table('image')->insert($receive);
                Db::commit();
            } else {
                //无图片===============================================================
                return json(new MissFileException(), 400);
            }
        }catch
        (Exception $ex) {
            Db::rollback();
            throw $ex;
        }
    }
    //临时表数据拼接之后加入正式信息表
    function temp_info(){

        $validate = new ProductNew();
        $validate->goCheck();

        $uid = TokenService::getCurrentUid();
        $user = UserModel::get($uid);

        if(!$user){
            throw new UserException();
        }

        $dataArray = $validate->getDataByRule(input('post.'));//过滤

        $userProduct = $user->product();


            //通过关联模型新增一条UserProduct
        $user->product()->save($dataArray);
        return json(new SuccessMessage(),201);


        //$res = input('param.');
        //$product_insert = array();
        //var_dump($res);exit;

        //if(!empty($res)){
        //    $product_insert['category_id'] = $res['name'];
        //    $product_insert['brand_id'] = $res['car_num'];
        //    $product_insert['summary'] = $res['summary'];
        //    $product_insert['only_num'] = $res['only_num'];
        //    $product_insert['user_id'] = rand(1,100);
        //    //var_dump($product_insert);exit;
        //    if (Db::table('product')->insert($product_insert))
        //        echo 'insert success';
        //
        //}else{
        //    return '参数是空数组';
        //}
    }
}

//修改资料接口
function text_modify(){
    //只有在登录状态才能修改资料  $_GET["online_code"]
    $upload = new \Think\Upload();// 实例化上传类
    $upload->maxSize   =     3145728 ;// 设置附件上传大小
    $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
    $upload->rootPath  =     './Uploads/'; // 设置附件上传根目录
    // 上传文件
    $info   =   $upload->upload();
    if($info){
        $image['image']=$info["image"]['savepath'].$info["image"]['savename'];
    }else{
        $this->ajaxReturn(array('state'=>-888,'msg'=>'无图片'));
    }

    $arr=explode(",",$_POST["online_code"]);

    $where["program_id"]=$_POST["program_id"];
    $where["account"]=$arr[0];
    $where["psw"]=$arr[1];

    $save[$_POST["image_belong"]]=$image['image'];
    $old=M("car_manerger")->where($where)->find();
    if(M("car_manerger")->where($where)->save($save)){

        unlink('./Uploads/'.$old[$_POST["image_belong"]]);
        $this->ajaxReturn(array('state'=>1,'msg'=>'修改成功'));
    }else{
        $this->ajaxReturn(array('state'=>-1,'msg'=>'修改失败'));
    }
}

//图片修改
function img_modify(){
    $arr=explode(",",$_POST["online_code"]);

    $where["program_id"]=$_POST["program_id"];
    $where["account"]=$arr[0];
    $where["psw"]=$arr[1];

    if(M("car_manerger")->where($where)->save($_POST)){
        $this->ajaxReturn(array('state'=>1,'msg'=>'修改成功'));
    }else{
        $this->ajaxReturn(array('state'=>-1,'msg'=>'修改失败'));
    }
}

//下单
function build_order(){
    //price：价格、state （1：待付款，、2：待服务、3：已取消、4：已完成）、car_id：车种id、extra_need_id：额外需求id
    //is_onload_company：是否使用企业账号登录

    $_POST["state"]="1";
    $_POST["time_xd"]=time();


    if(M("car_order")->add($_POST)){
        $this->ajaxReturn(array('status'=>1,'msg'=>'提交成功','roder_num'=>$_POST["order_num"]));
    }else{
        $this->ajaxReturn(array('status'=>-1,'msg'=>'提交失败'));
    }

}

//首页
function car_index(){
    //车种列表、对应车型列表
    //车种类（一维数组）
    $a=M("car_fenlei")->where("is_show=1 and program_id='".$_GET["program_id"]."'")->order("sort desc")->select();

    for($i=0;$i<count($a);$i++){
        //车型（二维数组）
        $field_1='id,title,canshu_name,canshu_val,image,load_id,price_id,driver_id,fenlei_id,load_start,load_end';
        $a1[$i]=M("car_allcar")->field($field_1)->where("is_show=1 and fenlei_id='".$a[$i]["id"]."'")->select();
        $a[$i]["car_info"]=$a1[$i];

        for($k=0;$k<count($a1[$i]);$k++){
            //车型参数（三维数组）
            $arr_cs_name[$i][$k]=explode(",",$a1[$i][$k]["canshu_name"]);
            $arr_cs_val[$i][$k]=explode(",",$a1[$i][$k]["canshu_val"]);

            $a[$i]["car_info"][$k]["canshu_name"]=$arr_cs_name[$i][$k];
            $a[$i]["car_info"][$k]["canshu_val"]=$arr_cs_val[$i][$k];

            //车种图片
            $image[$i][$k]=explode(",",$a1[$i][$k]["image"]);
            $a[$i]["car_info"][$k]["image"]=$image[$i][$k][0];

            //车种价格计算
            $field_2='id,title,price_start,basis_miles,per_price,ct_per_price';
            $a1_1[$k]=M("car_charges")->field($field_2)->where("id='".$a1[$i][$k]["price_id"]."'")->find();

            $a[$i]["car_info"][$k]["price_arr"]=$a1_1[$k];
        }
    }
    $z=array('k1'=>$a);
    //dump($a);die;
    $this->ajaxReturn($a);
}

//个人登录接口
function onload(){
//个人司机登录，账号就是 $_POST["openid"].$_POST["program_id"]，密码就是md5($_POST["openid"].$_POST["program_id"])
//online_state 1:个人司机，、2其他用户
    if($_GET["online_state"]==1){
        $account=	$_GET["openid"].$_GET["program_id"];
        $psw=		md5($_GET["openid"].$_GET["program_id"]);
    }else{
        $account=	$_GET["account"];
        $psw=		md5($_GET["psw"]);
    }

    $a=M("car_manerger")->where("state_register=2 and program_id='".$_GET["program_id"]."'"."and account='".$account."'")->find();

    if($a["psw"]==$psw){
        $online_code=$a["account"].",".$a["psw"];
        $this->ajaxReturn(array('status'=>1,'msg'=>'登录成功','online_code'=>$online_code));
    }else{
        $this->ajaxReturn(array('status'=>-1,'msg'=>'登录失败'));
    }
}

//查询账号审核结果接口
function search_registe(){
    //online_state 1:个人司机，、2其他用户
    if($_GET["online_state"]==1){
        //司机用户   没账号密码的
        $account=	$_GET["openid"].$_GET["program_id"];
    }else{
        //企业用户
        $account=	$_GET["account"];
    }

    $a=M("car_manerger")->where("program_id='".$_GET["program_id"]."'"."and account='".$account."'")->find();

    if($a["state_register"]==1){
        $this->ajaxReturn(array('status'=>"1",'msg'=>"等待审核"));
    }else if($a["state_register"]==2){
        $this->ajaxReturn(array('status'=>"2",'msg'=>"审核通过"));
    }else if($a["state_register"]==3){
        $this->ajaxReturn(array('status'=>"3",'msg'=>"审核拒绝"));
    }

}

function chech_load($c_online_code,$program_id){
    //传递回来的编码带有时间戳  不要时间戳
    //account+psw   online_code    program_id openid
    $online_code=explode(",",$c_online_code);//[0]账号、[1]密码

    if(empty($online_code)){
        $is_conline["state"]="-999";//没有登录码
    }else{
        $a=M("car_manerger")->where("program_id='".$program_id."'"."and account='".$online_code[0]."'"."and psw='".$online_code[1]."'")->find();

        if(empty($a)){
            //账号或者密码错误
            $is_conline["state"]="2";//账号密码错误、一般只会是密码错误
        }else{
            $is_conline["state"]="1";//验证成功
            $is_conline["info"]=$a;
        }
    }

    return $is_conline;
}
//判断个人是否登录  新
function is_load_1(){

    if(empty($_GET["online_code"])){
        $account=	$_GET["openid"].$_GET["program_id"];
        $psw=		md5($_GET["openid"].$_GET["program_id"]);
        $online_code=$account.",".$psw;
        $results=$this->chech_load($online_code,$_GET["program_id"]);
    }else{
        $results=$this->chech_load($_GET["online_code"],$_GET["program_id"]);
    }
    $b_temp=M("car_manerger")->field('name,headimage,is_online')->where("program_id='".$_GET["program_id"]."'"."and openid='".$_GET["openid"]."'")->find();


    if($results["state"]=="-999"){
        $b["id_state"]="0";
        $b["msg"]="游客";
    }else if($results["state"]=="1" ){
        //正常登录
        $b["id_state"]="1";
        $b["msg"]="已在平台注册";

        if($results["info"]["state"]==1){

            $b["msg_state"]="个人司机";

        }else if($results["info"]["state"]==2){
            $b["msg_state"]="合作单位";
        }else if($results["info"]["state"]==3){
            $b["msg_state"]="签约单位";
        }
        if($b_temp["is_online"]==1){

            $b["name"]=$b_temp["name"];
            $b["headimage"]=$b_temp["headimage"];

            $b["msg_is_online"]="已登录";
        }else{
            $b["msg_is_online"]="未登录登录";
        }

        $this->ajaxReturn($b);
    }else if($results["info"]["state"]=="2"){
        //账号密码错误、一般只会是密码错误
        $this->ajaxReturn(array('status'=>"-999",'msg'=>"账号异常禁止登录"));
    }

}


//判断个人是否登录   旧
function is_load(){
    //个人登录信息   ---全查询，显示部分
    $b_temp=M("car_manerger")->where("program_id='".$_GET["program_id"]."'"."and openid='".$_GET["openid"]."'")->find();

    $b["state"]=$b_temp["state"];
    $b["is_online"]=$b_temp["is_online"];
    $b["state_register"]=$b_temp["state_register"];

    if(empty($b_temp)){
        $b["id_state"]="0";
        $b["msg"]="游客";
    }else{
        $b["id_state"]="1";
        $b["msg"]="已在平台注册";
        if($b_temp["state"]==1){

            $b["msg_state"]="个人司机";
            if($b["is_online"]==1){

                $b["name"]=$b_temp["name"];
                $b["headimage"]=$b_temp["headimage"];

                $b["msg_is_online"]="已登录";
            }else{
                $b["msg_is_online"]="未登录登录";
            }
        }else if($b_temp["state"]==2){

            $b["msg_state"]="合作单位";
        }else if($b_temp["state"]==3){

            $b["msg_state"]="签约单位";
        }

        if($b_temp["state_register"]==1){


            $b["msg_register"]="待审核";
        }else if($b_temp["state_register"]==2){


            $b["msg_register"]="审核完成";
        }else if($b_temp["state_register"]==3){


            $b["msg_register"]="审核拒绝";
        }

    }
    $this->ajaxReturn($b);
}

//退出登录接口
function load_out(){


    $arr=explode(",",$_GET["online_code"]);
    $save["is_online"]=2;

    $where["program_id"]=$_GET["program_id"];
    $where["account"]=$arr[0];
    $where["psw"]=$arr[1];
    if(M("car_manerger")->where($where)->save($save)){
        $this->ajaxReturn(array('status'=>"1",'msg'=>"退出成功"));
    }else{
        $this->ajaxReturn(array('status'=>"-1",'msg'=>"退出失败"));
    }


}

//异步检测账号唯一接口
function only_account(){
    $a=M("car_manerger")->where("program_id='".$_GET["program_id"]."'"."and account='".$_GET["account"]."'")->find();

    if(empty($a)){
        $this->ajaxReturn(array('status'=>1,'msg'=>'可以使用'));
    }else{
        $this->ajaxReturn(array('status'=>-1,'msg'=>'已经存在该账号'));
    }
}


//车型详情
function car_con(){
    if(empty($_GET["program_id"]) ){
        $this->ajaxReturn(array("state" => -999, "msg" => "参数缺失"));
    }
    $field_1='id,title,canshu_name,canshu_val,image,load_id,price_id,driver_id,fenlei_id,load_start,load_end';
    $a1=M("car_allcar")->field($field_1)->where("id='".$_GET["id"]."'"."and program_id='".$_GET["program_id"]."'")->find();

    //车型参数
    $a1["canshu_name"]=explode(",",$a1["canshu_name"]);
    $a1["canshu_val"]=explode(",",$a1["canshu_val"]);

    //车种图片

    $a1["image"]=explode(",",$a1["image"]);

    //车种价格计算
    $field_2='id,title,price_start,basis_miles,per_price,ct_per_price';
    $a1_1=M("car_charges")->field($field_2)->where("id='".$a1["price_id"]."'")->find();

    $a1["price_arr"]=$a1_1;

    $this->ajaxReturn($a1);
}

//平台资讯列表
function info_list(){
    if(empty($_GET["program_id"]) ){
        $this->ajaxReturn(array("state" => -999, "msg" => "参数缺失"));
    }
    $a=	M("jt03_zx_info")->field('id,title,image,time_input')->where("is_show=1 and program_id='".$_GET["program_id"]."'")->order("sort desc")->select();

    $this->ajaxReturn($a);
}

//资讯详情
function info_con(){
    if(empty($_GET["program_id"]) ){
        $this->ajaxReturn(array("state" => -999, "msg" => "参数缺失"));
    }

    $a=	M("jt03_zx_info")->field('id,title,image,time_input,content')->where("id='".$_GET["id"]."'"."and program_id='".$_GET["program_id"]."'")->find();

    $this->ajaxReturn($a);
}

//额外需求选择也
function car_extra_need(){

}

//取消订单原因页
function car_cancel_reason(){
    $a=M("car_cancel_reason")->field('id,title')->where("program_id='".$_GET["program_id"]."'")->order("sort")->select();

    $this->ajaxReturn($a);
}

//价格明细接口

//function price_con(){
//    $distance;
//}
