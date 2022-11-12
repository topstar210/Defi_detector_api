<?php

namespace App\Http\Controllers\API;

use App\Models\Influencer;
use Illuminate\Http\Request;

class InfluencerController
{
    
    public function get()
    {
        $influencersData = Influencer::orderBy('created_at')->get();
        return json_encode($influencersData);
    }

    public function delete(Request $request)
    {
        $rowId = $request->post('rid');
        $res = Influencer::where('id', $rowId)->delete();
        return $this->get();
    }
    
    public function save(Request $request)
    {
        $name = $request->post('name');
        $url = $request->post('url');
        $telegram = $request->post('telegram');
        $twitter = $request->post('twitter');
        $youtube = $request->post('youtube');
        $logo_url = $request->post('logo_url');
        $rid = $request->post('id');

        $insertData = [
            'name' => $name,
            'url' => $url,
            'telegram' => $telegram,
            'twitter' => $twitter,
            'logo_url' => $logo_url,
            'youtube' => $youtube,
        ];
        if ($rid) {
            Influencer::where('id', $rid)->update($insertData);
        } else {
            Influencer::create($insertData);
        }
        return $this->get();
    }
}
