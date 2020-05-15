<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use \RecursiveIteratorIterator;
use App\AppUser;
use App\Category;
use App\File;
use App\Pdf;
use App\Video;
use App\Payment;
use DB;
use Storage;


class ApiController extends BaseController
{
    
    //login api
    public function applogin(Request $request){
    if(empty($request->mobile_no)  && empty($request->password)){
        $resp = 0;
        $query = [];
        $message = "Empty params";
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
        echo(json_encode($msg));
    }
    else{
        $mobile_no = $request->mobile_no;
        $password = $request->password;
        $isblocked = DB::table('app_users')->where('mobile', $mobile_no)->value('isBlocked');
        if($isblocked == 1){
        $resp = 3;
        $query = [];
        $message = "You Have Been Blocked";
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
        echo(json_encode($msg));
        }
        else{
        $mobile_device = $request->mobile_device;
        $code = mt_rand(1000,9999);
        $imei = $request->imei;
        $query2 = AppUser::where('mobile', $mobile_no)->where('password', $password)->count();
        if($query2){
            $q = AppUser::where('mobile', $mobile_no)->where('password', $password)->value('logged');
            if($q == 1){
            $qe = AppUser::where('mobile', $mobile_no)->where('password', $password)->value('mobile_device');
            $query = [];
            $resp = 2;
            $message = "Already Logged In From $qe";
            }
            else{
            $imei_list = DB::table('app_users')->where('mobile', $mobile_no)->value('device_list'); 
            if(empty($imei_list)){
                $this->sendotp($mobile_no,"Your Otp Is $code");
            }
            else{
                $arrr = explode(",",$imei_list);
                if(!in_array($imei, $arrr)){
                $this->sendotp($mobile_no,"Your Otp Is $code");
                }
            }
            $hp = DB::table('app_users')
            ->where('mobile', $mobile_no)
            ->update(['mobile_device' =>$mobile_device,'verify_code' => $code]);    
            $query = DB::table("app_users")
                    ->select("app_users.*",\DB::raw("GROUP_CONCAT(categories.cat_name) as cat_name, GROUP_CONCAT(categories.price) as price, GROUP_CONCAT(categories.id) as user_cat"))
                    ->leftjoin("categories",\DB::raw("FIND_IN_SET(categories.id,app_users.user_cat)"),">",\DB::raw("'0'"))
                    ->groupBy("app_users.id","app_users.email","password","full_name","profile_pic","mobile","gender", "created_at", "updated_at", "user_cat", "logged", "verified", "verify_code", "mobile_device", "isactive","user_files_cat","user_videos_cat","device_list", "isBlocked")
                    ->where('mobile', $mobile_no)->get();
            $resp = 1;
            $message = "Logged in";
            }
        }
        else{
            $query = [];
            $resp = 0;
            $message = "please check the credentials";
        }
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
        echo(json_encode($msg));
    }
    }
    }
    
    
    
    //Register api
    public function appregister(Request $request){
    if(empty($request->email)  && empty($request->password) && empty($request->full_name) && empty($request->mobile_no)&& empty($request->gender)){
        $resp = 0;
        $query = [];
        $message = "Empty params";
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
        echo(json_encode($msg));
    }
    else{
        $email = $request->email;
        $mobile_no = $request->mobile_no;
        $password = $request->password;
        $full_name = $request->full_name;
        $gender = $request->gender;
        $pic = $request->profile;
        
        $user_exist = AppUser::where('mobile', $mobile_no)->count();
        
        if($user_exist){
            $resp = 1;
            $query = 33;
            $message = "user already exist";
        }
        else{
            $dbfield = new AppUser;
            $dbfield->email = $email;
            $dbfield->password = $password;
            $dbfield->full_name = $full_name;
            $dbfield->mobile = $mobile_no;
            $dbfield->gender = $gender;
            $dbfield->verify_code = mt_rand(1000,9999);
            if ($request->hasFile('profile_pic')) {
            $filename = $request->profile_pic->store('profile', 'public');
            $dbfield->profile_pic = $filename;
            }
            else{
                $dbfield->profile_pic = "profile/profile_placeholder.png";
            }
            
            $dbfield->save();
            $resp = 2;
            $query = $dbfield->id;
            $message = "registered successfully";
            
        }
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
        echo(json_encode($msg));
    }
    }
    
    
    //get all membership
    public function getMembership(){
        $cat = [1,2,3];
        $query = Category::whereNotIn('id', $cat)->select('*')->get();
        $message = "Fetched All Membership Data";
        $msg = $query;
        echo(json_encode($msg));
    }
    
    
    //get all files
        public function getFiles(Request $request){

        $category = $request->price;    
        $query = DB::table('files')->where('type', '=' ,$category)->get();
        $message = "Fetched All Files Data";
        $msg = $query;
        echo(json_encode($msg));

        
    }
    
    
    //get all Videos
        public function getVideos(Request $request){

        $category = $request->price;    
        $query = DB::table('videos')->where('type', '=' ,$category)->get();
        $message = "Fetched All Video Data";
        $msg = $query;
        echo(json_encode($msg));
    }
    
    
    
    //get all Pdf
        public function getPdfs(Request $request){
        $category = $request->price;    
        $query = DB::table('pdfs')->where('type', '=' ,$category)->get();
        $message = "Fetched All Pdf Data";
        $msg = $query;
        echo(json_encode($msg));
    }
    
    public function isLoggedin(Request $request){
        $id = $request->id;
        $hp = DB::table('app_users')
        ->where('mobile', $id)
        ->update(['logged' => null, 'verified' => 0]);
        $resp = $request->id;
        $query = [];
        $message = "Logged in";
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
 
        echo(json_encode($msg));
    }
    
        public function changePass(Request $request){
        $id = $request->mobile;
        $pass = $request->password;
        $hp = DB::table('app_users')
        ->where('mobile', $id)
        ->update(['password' => $pass]);
        $resp = $request->id;
        $query = [];
        $message = "Password Changed";
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
 
        echo(json_encode($msg));
    }
    
    public function editProfile(Request $request){
        $id = $request->mobile;
        $fullname = $request->fullname;
        $email = $request->email;
        $hp = DB::table('app_users')
        ->where('mobile', $id)
        ->update(['full_name' => $fullname,'email' => $email, 'mobile' => $id ]);
        $resp = $request->id;
        $query = [];
        $message = "Profile Edited";
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
 
        echo(json_encode($msg));
    }
    
    public function checkOtp(Request $request){
        $mob = $request->id;
        $otp = $request->otp;
        $imei = $request->imei;
        $imei_list = DB::table('app_users')->where('mobile', $mob)->value('device_list');
        if(!empty($imei_list)){
        $arr = explode(",", $imei_list);
        array_push($arr,$imei);
        }
        else{
            $arr = array();
            array_push($arr,$imei);
        }
        $final = implode(',', array_filter($arr));
        
        $hp = DB::table('app_users')->where('mobile', $mob)->where('verify_code', $otp)->first();
        if($hp){
        $h = DB::table('app_users')->where('mobile', $mob)->update(['verify_code' => 0, 'verified' => 1,'device_list' => $final ]);
        $resp = 1;
        $query = [];
        $message = "Verfied Successfully";
        }else{
        $resp = 0;
        $query = [];
        $message = "Incorrect Otp";
        }
            
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
         echo(json_encode($msg));
    }
    
    public function resendOtp(Request $request){
        $mob = $request->id;
        $code = mt_rand(1000,9999);
        $this->sendotp($mob,"Your Otp Is $code");
        $hp = DB::table('app_users')->where('mobile', $mob)->update(['verify_code' => $code]);
        $resp = $code;
        $query = [];
        $message = "Otp Sent";
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
         echo(json_encode($msg));
        
    }
    
    public function sendotp($mobile, $otp){
    $apiKey = urlencode('OuPExpsY3XA-pGEFehrZ3o4YLQHAhMGYIWQ0ssqPAZ');
    $numbers = urlencode($mobile);
    $sender = urlencode("OPMZCA");
    $message = rawurlencode("$otp");
    $data = 'apikey=' . $apiKey . '&numbers=' . $numbers . '&sender=' . $sender . '&message=' . $message;
    $ch = curl_init('https://api.textlocal.in/send/?' . $data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    curl_close($ch);
    //echo $response;
    }
    
    public function forgotpass(Request $request){
        $mob = $request->id;
        $c = mt_rand(1000,9999);
        $code = $c;
        $hp = DB::table('app_users')->where('mobile', $mob)->count();
        if($hp > 0){
        $this->sendotp($mob,"Your Otp Is $code");
        $p = DB::table('app_users')->where('mobile', $mob)->update(['verify_code' => $code]);
        $resp = 1;
        $query = [];
        $message = "verify code sent";
        }
        else{
        $resp = 0;
        $query = [];
        $message = "mobile doesnt exist";
        }
        
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
        echo(json_encode($msg));
        
    }
    
    
    
    
    public function resendpassOtp(Request $request){
        $mob = $request->id;
        $code = mt_rand(1000,9999);
        $this->sendotp($mob,"Your Otp Is $code");
        $hp = DB::table('app_users')->where('mobile', $mob)->update(['verify_code' => $code]);
        $resp = $code;
        $query = [];
        $message = "Otp Sent";
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
        echo(json_encode($msg));
        
    }
    
    public function changePassOtp(Request $request){
        $mob = $request->id;
        $code = $request->code;
        $pass = $request->password;
        $hp = DB::table('app_users')->where('mobile', $mob)->where('verify_code', $code)->count();
        if($hp > 0){
        $p = DB::table('app_users')->where('mobile', $mob)->update(['password' => $pass]);
        $resp = 1;
        $query = [];
        $message = "Password Changed";
        }
        else{
        $resp = 0;
        $query = [];
        $message = "Incorrect";
        }
            
        $msg = array('success' => $resp, 'data' =>$query, 'message' => $message);
        echo(json_encode($msg));
        
    }
    
    
    public function updateMembership(Request $request){
        $mob = $request->id;
        $p = $request->price;
        $uid = $request->uid;
        $membership_id = $request->membership;
        $mem_type = $request->membershiptype;
        $code = "You Have SuccessFully Purchased The Membership";
        //$this->sendotp($mob,$code);
        $arr = array();
        if($mem_type == 1){
            $userd = DB::table('app_users')->where('mobile', $mob)->value('user_cat');
        }
        if($mem_type == 2){
            $userd = DB::table('app_users')->where('mobile', $mob)->value('user_videos_cat');
        }
        if($mem_type == 3){
            $userd = DB::table('app_users')->where('mobile', $mob)->value('user_files_cat');
        }
        
        array_push($arr,$userd);
        array_push($arr,$membership_id);
        $final = implode(',', array_filter($arr));
        if($mem_type == 1){
            $hp = DB::table('app_users')->where('mobile', $mob)->update(['user_cat' => $final]);
        }
        if($mem_type == 2){
            $hp = DB::table('app_users')->where('mobile', $mob)->update(['user_videos_cat' => $final]);
        }
        if($mem_type == 3){
            $hp = DB::table('app_users')->where('mobile', $mob)->update(['user_files_cat' => $final]);
        }
        
        $this->payments($uid, $membership_id, $p);
        $resp = 1;
        $query = [];
        $message = "Success";
        $msg = array('success' => $membership_id , 'data' =>$query, 'message' => $message);
        echo(json_encode($msg));
        
    }
    
    public function payments($user_id, $category_type, $price){
        $hp = new Payment;
        $hp->user_id = $user_id;
        $hp->category_type = $category_type;
        $hp->price = $price;
        $hp->save();
    }
    
    public function backupPdfs(Request $request){
            $uid = $request->id;
            if($request->hasFile('pdf'))
            {
            $file = $request->file('pdf');
            $originalname = $file->getClientOriginalName();
            $exists = Storage::disk('public')->exists("$uid/$uid, $originalname");
            if($exists){
                unlink('public/'.$uid.'/'.$originalname);
            }
            $path = $file->storeAs('public/'.$uid, $originalname);
            $resp = 1;
            $query = [];
            $message = "File Backup Successfully";
            }
            $msg = array('success' => $resp , 'data' =>$query, 'message' => $message);
            echo(json_encode($msg));
    }
    
    public function restorePdfs(Request $request){
            $uid = $request->id;
            $exists = Storage::disk('public')->exists("$uid");
            if($exists){
            $path = public_path("storage/$uid");
            $files = Storage::disk('public')->files("$uid");
            //calculate size of folder
            $s = $this->GetDirectorySize($path);
            $resp = 1;
            $query = $files;
            $message = "Success";
            $msg = array('data' =>$query, 'size' => $s);
            echo(json_encode($msg));
            }
            else{
            $resp = 0;
            $query = [];
            $message = "Backup Does'nt Exists";
            $msg = array('data' =>$query);
            echo(json_encode($msg));
            }
    }
    
    //active inactive
        public function isActive(Request $request){
        $id = $request->id;
        $datetime = date('Y-m-d H:i:s');
        $hp = DB::table('app_users')
        ->where('id', $id)
        ->update(['logged' => 1,'isactive' => 1, 'updated_at'=>$datetime]);
        $isblocked = DB::table('app_users')->where('id', $id)->value('isBlocked');
        $resp = 1;
        $query = [];
        $message = "Id is active";
        $msg = array('success' => $isblocked, 'data' =>$query, 'message' => $message);
        echo(json_encode($msg));
    }
    
    //get user pdf categories
    
    public function getuserspdfcat(Request $request){
        $id = $request->id;
        $q = \DB::table("app_users")->where('app_users.id', $id)
        ->select("app_users.user_cat as category_id",\DB::raw("GROUP_CONCAT(categories.cat_name) as cat_name, GROUP_CONCAT(categories.id) as category_id"))
        ->leftjoin("categories",\DB::raw("FIND_IN_SET(categories.id,app_users.user_cat)"),">",\DB::raw("'0'"))
        ->groupBy("app_users.id","app_users.user_cat")
        ->get();
        $result = json_encode($q);
        echo($result);
    }
    
    
    //get user videos categories
    
    public function getusersvideoscat(Request $request){
        $id = $request->id;
        $q = \DB::table("app_users")->where('app_users.id', $id)
        ->select("app_users.user_videos_cat as category_id",\DB::raw("GROUP_CONCAT(categories.cat_name) as cat_name, GROUP_CONCAT(categories.id) as category_id"))
        ->leftjoin("categories",\DB::raw("FIND_IN_SET(categories.id,app_users.user_videos_cat)"),">",\DB::raw("'0'"))
        ->groupBy("app_users.id","app_users.user_videos_cat")
        ->get();
        $result = json_encode($q);
        echo($result);
    }
    
        
    //get user files categories
    
    public function getusersfilescat(Request $request){
        $id = $request->id;
        $q = \DB::table("app_users")->where('app_users.id', $id)
        ->select("app_users.user_files_cat as category_id",\DB::raw("GROUP_CONCAT(categories.cat_name) as cat_name, GROUP_CONCAT(categories.id) as category_id"))
        ->leftjoin("categories",\DB::raw("FIND_IN_SET(categories.id,app_users.user_files_cat)"),">",\DB::raw("'0'"))
        ->groupBy("app_users.id","app_users.user_files_cat")
        ->get();
        $result = json_encode($q);
        echo($result);
    }
    
        
    public function test(){
        $mobile_no = "8237329811";
        $imei_list = DB::table('app_users')->where('mobile', $mobile_no)->value('device_list'); 
        $arr = explode(",", $imei_list);
        print_r($arr);
        if(!in_array("1", $arr)){
                $this->sendotp($mobile_no,"Your Otp Is 1234");
        }
    }
    
    function GetDirectorySize($directory){
            $size = 0;
            $files= glob($directory.'/*');
            foreach($files as $path){
                is_file($path) && $size += filesize($path);
                is_dir($path) && GetDirectorySize($path);
            }
            return $size;
    }
    
    
    function isBlocked(Request $request){
        $id = $request->id;
        $isblocked = DB::table('app_users')->where('id', $id)->value('isBlocked');
        $query = [];
        $message = "Return blocked Or Not";
        $msg = array('success' => $isblocked , 'data' =>$query, 'message' => $message);
        echo(json_encode($msg));
    }
    
    
    
}