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


}
