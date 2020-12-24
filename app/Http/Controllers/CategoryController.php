<?php

namespace App\Http\Controllers;

use App\Http\Helper\ResponseBuilder;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CategoryController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function show()
    {
        $data = DB::table('categories as c')
                   ->leftjoin('categories as c2', 'c.parent_id', '=', 'c2.id')
                   ->select('c.*', 'c2.name as parent_name')
                   ->get();
 
        $out  = [
            "status"  => 200,
            "data"    => $data
        ];
 
        return ResponseBuilder::result($out);
    }

    public function store(Request $request)
    {
 
        if ($request->isMethod('post')) {
 
            $this->validate($request, [
                'name' => 'required'
            ]);
 
            $data = [
                'name' => $request->input('name'),
                'parent_id' => $request->input('parent')
            ];
 
            $insert = Category::create($data);
 
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
                'name' => 'required',
                'id'    => 'required'
            ]);

            $category = Category::find($request->input('id'));
 
            $data = [
                'name' => $request->input('name'),
                'parent_id' => $request->input('parent')
            ];
 
            $update = $category->update($data);
 
            if ($update) {
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
 
            return ResponseBuilder::result($out);
        }
    }

    public function destroy($id)
    {
        $categorys =  Category::find($id);
 
        if (!$categorys) {
            $out  = [
                "status"   => 404,
                "message"  => "Data not found!"
            ];
        } else {
            $categorys->delete();

            $out  = [
                "status"   => 200,
                "message"  => "Data deleted!"
            ];
        }
 
        return ResponseBuilder::result($out);
    }
}
