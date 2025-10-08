<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CryptoController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');


Route::get('/cryptos', [CryptoController::class, 'getCryptos']);
Route::get('/cryptos/{symbol}/history', [CryptoController::class, 'getCryptoHistory']);
