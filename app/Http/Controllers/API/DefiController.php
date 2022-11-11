<?php

namespace App\Http\Controllers\API;

use App\Models\Dapps;
use App\Models\Tokens;
use App\Models\Partner;
use App\Models\User;
use App\Models\Influencer;
use App\Models\Adsmanage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class DefiController
{
    
    public function get()
    {
        $dappData = Dapps::where('show_flag', '1')->orderBy('level')->orderBy('created_at')->get();
        return json_encode($dappData);
    }

    public function save(Request $request)
    {
        $mining_group_url = $request->post('mining_group_url');
        $mining_group_name = $request->post('mining_group_name');
        $logo_url = $request->post('logo_url');
        $tg_group = $request->post('tg_group');
        $discode_link = $request->post('discode_link');
        $poocoin_link = $request->post('poocoin_link');
        $twitter_link = $request->post('twitter_link');
        $audit = $request->post('audit');
        $contract = $request->post('contract');
        $kyc = $request->post('kyc');
        $token = $request->post('token');
        $fees = $request->post('fees');
        $age = $request->post('age');
        $daily = $request->post('daily');
        $tvl = $request->post('tvl');
        // $tvl24h = $request->post('tvl24h');
        $level = $request->post('level');
        $showflag = $request->post('showflag');
        $rid = $request->post('id');
        $insertData = [
            'mining_group_url' => $mining_group_url,
            'mining_group' => $mining_group_name,
            'logo_url' => $logo_url,
            'tg_group' => $tg_group,
            'discode_link' => $discode_link,
            'poocoin_link' => $poocoin_link,
            'twitter_link' => $twitter_link,
            'audit' => $audit,
            'contract' => $contract,
            'kyc' => $kyc,
            'coin_token' => $token,
            'fees' => $fees,
            'ages' => $age,
            'daily' => $daily,
            'tvl' => $tvl,
            // 'tvl_24h' => $tvl24h,
            'level' => $level,
            'show_flag' => ($showflag == "show") ? 1 : 0
        ];
        if ($rid) {
            Dapps::where('id', $rid)->update($insertData);
        } else {
            Dapps::create($insertData);
        }
        return $this->get();
    }

    public function delete(Request $request)
    {
        $rowId = $request->post('rid');
        Dapps::where('id', $rowId)->delete();
        return $this->get();
    }
}
