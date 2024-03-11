<?php

namespace App\Http\Controllers;

use App\Models\Assignation;
use App\Traits\HttpResponses;
use App\Http\Requests\AssignationRequest;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class AssignationController extends Controller
{
    use HttpResponses;
    //
     /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $assignation = [];
        $user = Auth::user();
        if ($user->role_id === 3) {
            $assignation = Assignation::where('user_id', $user->id)->get();
        } else if ($user->role_id === 2 || $user->role_id === 1) {
            $assignation = Assignation::all();
        }
        return $this->success($assignation,'All requests assignations', 200);
    }

     /**
     * Store a newly created resource in storage.
     */
    public function store(AssignationRequest $request) {

        $request->validated($request->all());
   
        $assignation = Assignation::create([
            'user_id' => $request->user_id,
            'comment' => $request->comment,
            'state' => 'pending',
            'request_id' => $request->request_id,
            'sender_id' => Auth::user()->id,
            'date_assignation' => Carbon::now()
        ]);

        if(!isset($assignation)) {
            return $this->error(null,'Failed to assignate request.',400);
        } else {
            return $this->success($assignation,'Request assign successfully.',200);
        }
    }

     /**
     * Display the specified resource.
     */
    public function show(string $id) {
        $assignation = Assignation::find($id);
        $request = $assignation->request();
        return $this->success(['assignation' => $assignation, 'request'=> $request ],'request assignation', 200);
    }

}
