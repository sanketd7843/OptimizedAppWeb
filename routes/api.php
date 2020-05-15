<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/applogin', 'ApiController@applogin');
Route::post('/appregister', 'ApiController@appregister');
Route::get('/getpdfs', 'ApiController@getPdfs');
Route::get('/getmembership', 'ApiController@getMembership');
Route::get('/getfiles', 'ApiController@getFiles');
Route::get('/getvideos', 'ApiController@getVideos');
Route::post('/isloggedin', 'ApiController@isLoggedin');
Route::post('/changepass', 'ApiController@changePass');
Route::post('/editprofile', 'ApiController@editProfile');
Route::post('/checkotp', 'ApiController@checkOtp');
Route::post('/resendotp', 'ApiController@resendOtp');


Route::post('/forgotpass', 'ApiController@forgotpass');
Route::post('/resendpassotp', 'ApiController@resendpassOtp');
Route::post('/changepassotp', 'ApiController@changePassOtp');
Route::post('/updatemembership', 'ApiController@updateMembership');

Route::post('/backup', 'ApiController@backupPdfs');
Route::post('/restore', 'ApiController@restorePdfs');
Route::post('/isactive', 'ApiController@isActive');


Route::get('/getuserspdfcat', 'ApiController@getuserspdfcat');
Route::get('/getusersvideoscat', 'ApiController@getusersvideoscat');
Route::get('/getusersfilescat', 'ApiController@getusersfilescat');


Route::get('/test', 'ApiController@test');

Route::post('/isblocked', 'ApiController@isBlocked');







