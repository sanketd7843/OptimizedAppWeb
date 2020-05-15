<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use App\AppUser;
use App\Category;
use App\File;
use App\Payment;
use App\Pdf;
use App\Video;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    
    public function appusers(){
        $users = Appuser::count();
        echo($users);
        
    }
    public function usercategories(){
        $userscat = Category::count();
        echo($userscat);
        
    }
    public function files(){
        $files = File::count();
        echo($files);
        
    }
    public function videos(){        
        $videos = Video::count();
        echo($videos);
    }
    public function pdfs(){
        $pdfs = Pdf::count();
        echo($pdfs);
    }
    public function payments(){
        $payments = Payment::count();
        echo($payments);
    }
}



