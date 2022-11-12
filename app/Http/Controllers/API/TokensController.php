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
        $rowId = $request->input('rid');
        $tokenData = Tokens::where('id', $rowId)->delete();
        return $this->get();
    }
    
    public function save(Request $request)
    {
        $token_name = $request->input('token_name');
        $coin = $request->input('coin');
        $website = $request->input('website');
        $presale_buy = $request->input('presale_buy');
        $telegram = $request->input('telegram');
        $discord = $request->input('discord');
        $twitter = $request->input('twitter');
        $launch = $request->input('launch');
        $chain = $request->input('chain');
        $audit = $request->input('audit');
        $contract = $request->input('contract');
        $kyc = $request->input('kyc');
        $chart = $request->input('chart');
        $market_cap = $request->input('market_cap');
        $price = $request->input('price');
        // $change_24h = $request->input('change_24h');
        $level = $request->input('level');
        $showflag = $request->input('showflag');
        $rid = $request->input('rid');
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
