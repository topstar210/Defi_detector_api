<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\DefiController;
use App\Http\Controllers\API\TokensController;
use App\Http\Controllers\API\InfluencerController;
use App\Http\Controllers\API\PartnerController;
use App\Http\Controllers\API\AdvertiseController;

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

Route::controller(AuthController::class)->group(function () {
    Route::post('/auth/login', 'check_user');
    Route::post('/auth/logout', 'logout');
    Route::post('/auth/checkToken', 'check_token');
    Route::post('/auth/changePassword', 'change_pwd');
});

Route::controller(DefiController::class)->group(function () {
    Route::get('/dapps/get', 'get');
    Route::post('/dapps/save', 'save');
    Route::post('/dapps/delete', 'delete');
});

Route::controller(TokensController::class)->group(function () {
    Route::get('/tokens/get', 'get');
    Route::post('/tokens/save', 'save');
    Route::post('/tokens/delete', 'delete');
});

Route::controller(InfluencerController::class)->group(function () {
    Route::get('/influencer/get', 'get');
    Route::post('/influencer/save', 'save');
    Route::post('/influencer/delete', 'delete');
});

Route::controller(PartnerController::class)->group(function () {
    Route::get('/partner/get', 'get');
    Route::post('/partner/save', 'save');
    Route::post('/partner/delete', 'delete');
});

Route::controller(AdvertiseController::class)->group(function () {
    Route::get('/admanage/get', 'get');
    Route::post('/admanage/save', 'save');
    Route::post('/admanage/delete', 'delete');
});
