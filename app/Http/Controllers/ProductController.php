<?php

namespace App\Http\Controllers;

use App\Http\Helper\ResponseBuilder;
use App\Models\Product;
use App\Models\ProductHistory;
use App\Models\ProductView;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Facades\JWTAuth;

class ProductController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    private $payload;

    public function __construct()
    {
        $token = JWTAuth::getToken();
        $this->payload = JWTAuth::getPayload($token)->toArray();
    }

    public function show(Request $request)
    {
        $order = empty($request->get('price')) ? 'DESC' : $request->get('price');

        $data = Product::where('category_id', $request->get('category'))
                        ->orderBy("price", $order)
                        ->paginate(10);
 
        $out  = [
            "status"  => 200,
            "data"    => $data
        ];
 
        return ResponseBuilder::result($out);
    }

    public function showById($id) 
    {
        $token = JWTAuth::getToken();
        $payload = JWTAuth::getPayload($token)->toArray();

        $view = ProductView::firstwhere(['user_id' => $payload['sub'], 'product_id' => $id]);
        $date = date_format($view->created_at,"Y-m-d");
        $now = date("Y-m-d");

        // compare date for count view
        if (!$view || ($now > $date)) {
            ProductView::create(['user_id' => $payload['sub'], 'product_id' => $id]);
        }

        $product = DB::table('products as p')
                      ->join('users as u', 'p.user_id', '=', 'u.id')
                      ->join('categories as c', 'p.category_id', '=', 'c.id')
                      ->leftJoin('categories as c2', 'c.parent_id', '=', 'c2.id')
                      ->select(
                        'p.*', 
                        'u.name as user', 
                        'u.email', 
                        'c.*', 
                        'c2.name as parent_category', 
                        DB::raw("
                            (SELECT 
                                COUNT(id) 
                            FROM 
                                product_views v 
                            WHERE 
                                v.user_id = {$payload['sub']} 
                            AND 
                                v.product_id = {$id}) as count"))
                      ->where('p.id', '=', $id)
                      ->get();
                      
        $out  = [
            "status"  => 200,
            "data"    => $product[0]
        ];

        return ResponseBuilder::result($out);
    }

    public function store(Request $request)
    {
 
        if ($request->isMethod('post')) {
 
            $this->validate($request, [
                'name'        => 'required',
                'price'       => 'required|numeric',
                'category_id' => 'required'
            ]);
 
            $data = [
                'name'        => $request->input('name'),
                'price'       => $request->input('price'),
                'user_id'     => $this->payload['sub'],
                'category_id' => $request->input('category_id')
            ];
 
            $insert = Product::create($data);
 
            if ($insert) {
                $out  = [
                    "status"  => 200,
                    "message" => "Success insert data!",
                    "data"    => $data
                ];
            } else {
                $out  = [
                    "status"   => 400,
                    "message"  => "Failed insert data!",
                    "data"     => $data
                ];
            }
 
            return ResponseBuilder::result($out);
        }
    }

    public function update(Request $request)
    {
 
        if ($request->isMethod('put')) {
 
            $this->validate($request, [
                'name'        => 'required',
                'price'       => 'required|numeric',
                'category_id' => 'required',
                'id'          => 'required'
            ]);

            $product = Product::find($request->input('id'));
 
            $data = [
                'name'        => $request->input('name'),
                'price'       => $request->input('price'),
                'user_id'     => $this->payload['sub'],
                'category_id' => $request->input('category_id')
            ];

            $dataHistory = [
                'name'        => $product->name,
                'price'       => $product->price,
                'user_id'     => $product->user_id,
                'category_id' => $product->category_id,
                'product_id'  => $product->id
            ];

            if ($this->payload['sub'] == $product->user_id) {
                $update = $product->update($data);
                $history = ProductHistory::create($dataHistory);
 
                if ($update && $history) {
                    $out  = [
                        "status"  => 200,
                        "message" => "Success update data!",
                        "data"    => $data
                    ];
                } else {
                    $out  = [
                        "status"   => 400,
                        "message"  => "Failed update data!",
                        "data"     => $data
                    ];
                }
            } else {
                $out  = [
                    "status"   => 403,
                    "message"  => "You don't have permission to edit this data!"
                ];
            }

            return ResponseBuilder::result($out);
        }
    }

    public function destroy($id)
    {
        $product =  Product::find($id);

        if ($this->payload['sub'] == $product->user_id) {
            if (!$product) {
                $out  = [
                    "status"   => 404,
                    "message"  => "Data not found!"
                ];
            } else {
                $product->delete();
    
                $out  = [
                    "status"   => 200,
                    "message"  => "Data deleted!"
                ];
            }
        } else {
            $out  = [
                "status"   => 403,
                "message"  => "You don't have permission to delete this data!"
            ];
        }
 
        return ResponseBuilder::result($out);
    }
}
