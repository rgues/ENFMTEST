<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Traits\HttpResponses;
use App\Http\Requests\storeRequestsRequest;
use Illuminate\Support\Carbon;
use App\Models\Request;

class RequestsController extends Controller
{
    use HttpResponses;

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        
        $user = Auth::user();
        

        if ($user->role_id === 2 || $user->role_id === 3) {
            $request = Request::all();
            return $this->success($request,'All requests', 200);
        } else {
            $request = Request::where('user_id',$user->id)->get();
            return $this->success($request,'All requests', 200);
        }
        
    }

     /**
     * Store a newly created resource in storage.
     */
    public function store(storeRequestsRequest $request) {

        $request->validated($request->all());

        $mytime = Carbon::now()->toArray(); 
       
        $ticket = $mytime['year'] . $mytime['month']  . $mytime['day']  . Auth::user()->id . rand(10,100);
   
        $article = Request::create([
            'title' => 'T#'. $ticket,
            'description' => $request->description,
            'status' => 'proccesing',
            'category_id' => $request->category_id,
            'user_id' => Auth::user()->id,
            'date_request' => Carbon::now()
        ]);

        if(!isset($article)) {
            return $this->error(null,'Failed to save the request.',400);
        } else {
            return $this->success($article,'New request saved.',200);
        }

    }

     /**
     * Display the specified resource with userId
     */
    public function show(string $id) {

        $request = Request::find($id);
        
        return $this->success(['request' => $request, 'response' =>  $request->answers], 200);
    }

}
