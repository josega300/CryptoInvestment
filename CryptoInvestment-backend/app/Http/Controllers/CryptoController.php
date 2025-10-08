<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class CryptoController extends Controller
{
    public function getCryptos(Request $request)
    {
        $limit = $request->get('limit', 10);
        $response = Http::withHeaders([
            'X-CMC_PRO_API_KEY' => env('COINMARKETCAP_API_KEY')
        ])->get('https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest', [
            'start' => 1,
            'limit' => $limit,
            'convert' => 'USD'
        ]);

        return $response->json();
    }

    public function getCryptoHistory(Request $request, $symbol)
    {
        $interval = $request->get('interval', 'daily');
        $response = Http::withHeaders([
            'X-CMC_PRO_API_KEY' => env('COINMARKETCAP_API_KEY')
        ])->get('https://pro-api.coinmarketcap.com/v1/cryptocurrency/ohlcv/historical', [
            'symbol' => $symbol,
            'convert' => 'USD',
            'interval' => $interval
        ]);

        return $response->json();
    }
}
