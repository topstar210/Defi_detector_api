<?php

namespace App\Http\Controllers\API;

use App\Models\Tokens;
use Illuminate\Http\Request;

class TokensController
{
    
    public function get()
    {
        $tokensData = Tokens::where('show_flag', '1')->orderBy('level')->orderBy('created_at')->get();
        return json_encode($tokensData);
    }

    public function delete(Request $request)
    {
        $rowId = $request->post('rid');
        $tokenData = Tokens::where('id', $rowId)->delete();
        return $this->get();
    }
    
    public function save(Request $request)
    {
        $token_name = $request->post('name');
        $coin = $request->post('coin');
        $website = $request->post('website');
        $presale_buy = $request->post('presale_buy');
        $telegram = $request->post('telegram');
        $discord = $request->post('discord');
        $twitter = $request->post('twitter');
        $launch = $request->post('launch');
        $chain = $request->post('chain');
        $audit = $request->post('audit');
        $contract = $request->post('contract');
        $kyc = $request->post('kyc');
        $chart = $request->post('chart');
        $market_cap = $request->post('market_cap');
        $price = $request->post('price');
        // $change_24h = $request->post('change_24h');
        $level = $request->post('level');
        $showflag = $request->post('showflag');
        $rid = $request->post('id');
        $insertData = [
            'name' => $token_name,
            'chain' => $chain,
            'website' => $website,
            'presale_buy' => $presale_buy,
            'telegram' => $telegram,
            'discord' => $discord,
            'twitter' => $twitter,
            'launch' => $launch,
            'audit' => $audit,
            'contract' => $contract,
            'kyc' => $kyc,
            'chart' => $chart,
            'coin' => $coin,
            'market_cap' => $market_cap,
            'price' => $price,
            // 'change_24h' => $change_24h,
            'level' => $level,
            'show_flag' => ($showflag == "show") ? 1 : 0
        ];
        if ($rid) {
            Tokens::where('id', $rid)->update($insertData);
        } else {
            Tokens::create($insertData);
        }
        return $this->get();
    }
}
