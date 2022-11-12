<?php

namespace App\Http\Controllers\API;

use App\Models\Partner;
use Illuminate\Http\Request;

class PartnerController
{
    
    public function get()
    {
        $partnersData = Partner::orderBy('created_at')->get();
        return json_encode($partnersData);
    }

    public function delete(Request $request)
    {
        $rowId = $request->post('rid');
        $res = Partner::where('id', $rowId)->delete();
        return $this->get();
    }
    
    public function save(Request $request)
    {
        $name = $request->input('name');
        $url = $request->input('url');
        $telegram = $request->input('telegram');
        $twitter = $request->input('twitter');
        $website = $request->input('website');
        $logo_url = $request->input('logo_url');

        Partner::create([
            'name' => $name,
            'url' => $url,
            'website' => $website,
            'logo_url' => $logo_url,
            'telegram' => $telegram,
            'twitter' => $twitter
        ]);
        return $this->get();
    }
}
