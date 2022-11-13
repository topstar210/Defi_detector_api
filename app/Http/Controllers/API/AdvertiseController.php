<?php

namespace App\Http\Controllers\API;

use App\Models\Adsmanage;
use Illuminate\Http\Request;

class AdvertiseController
{

    public function get()
    {
        $adsmanageData = Adsmanage::where('kind', null)->orderBy('level')->orderBy('created_at')->get();
        return json_encode($adsmanageData);
    }

    public function delete(Request $request)
    {
        $rowId = $request->post('rid');
        $res = Adsmanage::where('id', $rowId)->delete();
        return $this->get();
    }

    public function save(Request $request)
    {
        $image = $request->post('ads_img');
        if(isset($image)){
            $imgname = time() . '.' . explode('/', explode(':', substr($image, 0, strpos($image, ';')))[1])[1];
            list($type, $data) = explode(';', $image);
            list(, $data)      = explode(',', $data);
            $data = base64_decode($data);
            file_put_contents("./uploads/".$imgname, $data);
        }

        $level = $request->post('level');
        $ads_url = $request->post('ads_url');
        Adsmanage::create([
            'image' => isset($imgname) ? $imgname: "",
            'link' => $ads_url,
            'level' => $level,
        ]);
        return $this->get();
    }
}
