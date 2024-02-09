<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\RequestsController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AssignationController;
use App\Http\Controllers\AnswerController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Public routes
Route::post('/login',[AuthController::class, 'login']);

// Protected 
Route::group(['middleware' => ['auth:sanctum']], function() {

    Route::post('/register',[AuthController::class, 'register']);
    Route::post('/logout',[AuthController::class, 'logout']);

    Route::resource('categories', CategoriesController::class)->only(['index']);
    Route::resource('roles', RoleController::class)->only(['index']);
    Route::resource('users', UserController::class)->only(['index']);
    Route::resource('/request',RequestsController::class)->only(['index','store','show']);
    Route::resource('/assignation',AssignationController::class)->only(['index','store','show']);
    Route::resource('/answer',AnswerController::class)->only(['index','store','show', 'update']);

});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
