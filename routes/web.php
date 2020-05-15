<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('admin/login');
});


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('/clear-cache', function() {
    Artisan::call('cache:clear');
    return "Cache is cleared";
});

Route::get('/clear-views', function() {
    Artisan::call('view:clear');
    return "views are cleared";
});

Route::get('/clear-routes', function() {
    Artisan::call('route:clear');
    return "views are cleared";
});

Route::get('/appucount', 'Controller@appusers');
Route::get('/ucategories', 'Controller@usercategories');
Route::get('/ufiles', 'Controller@files');
Route::get('/uvideos', 'Controller@videos');
Route::get('/updfs', 'Controller@pdfs');
Route::get('/upayments', 'Controller@payments');