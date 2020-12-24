<?php
namespace App\Http\Helper;

use Exception;

class ResponseBuilder {

    public static function result($data) 
    {
        if (empty($data['status'])) {
            $data['status'] = 500; 
            $data['error'] = true;
            $data['message'] = "Error parsing response!";
            $data['data'] = [];
        }

        $output = [
            "name" => $data['status'] == 200 ? "OK" : 'ERR',
            "status"  => $data['status'],
            "error"   => $data['status'] == 200 ? false : true,
            "message" => !empty($data['message']) ? $data['message'] : "Successfully Executed!",
            "data" => $data['data'] ? $data['data'] : []
        ];
        
        return response()->json($output, $output['status']);
    }
}

?>