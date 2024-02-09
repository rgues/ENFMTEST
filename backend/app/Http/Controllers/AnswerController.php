<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponses;
use App\Http\Requests\AnswerRequest;
use App\Models\Answer;
use App\Models\Assignation;
use App\Models\Request as RequestModel;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class AnswerController extends Controller
{
    use HttpResponses;
     /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = Auth::user();
        $answers = [];

        if ($user->role_id === 2) {
            $answers = Answer::where('state','in_approval')->get();
        } else if ($user->role_id === 3) {
            $answers = Answer::all();
        }
    
        return $this->success($answers,'All Answers', 200);
    }

     /**
     * Store a newly created resource in storage.
     */
    public function store(AnswerRequest $request) {

        $request->validated($request->all());
        $user = Auth::user();

        $article = Answer::create([
            'assignation_id' => $request->assignation_id,
            'description' => $request->description,
            'name' => $user->firstname  . ' ' . $user->firstname,
            'state' => 'in_approval',
            'date_answer' => Carbon::now()
        ]);

        $assignation = Assignation::where('id',$request->assignation_id)->first();
        $assignation->update(['state' => 'evaluate']);

        if(!isset($article)) {
            return $this->error(null,'Failed to save the request.',400);
        } else {
            return $this->success($article,'New request saved.',200);
        }
    }

     /**
     * Display the specified resource.
     */
    public function show(string $id) {
        $answers = Answer::find($id);
        return $this->success($answers,'Assigantion Answers', 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $answer = Answer::where('id',$id)->first();

        if (!isset($answer)) {
            return $this->error(['id' => $id], 'Answer with id '. $id . 'does not exist', 400);
        }

        $assignation = Assignation::where('id',$answer->assignation_id)->first();

        if (!isset($assignation)) {
            return $this->error(['id' => $id], 'Assignation with id '. $id . 'does not exist', 400);
        }

        $requestM = RequestModel::where('id',$assignation->request_id)->first();

        if (!isset($requestM)) {
            return $this->error(['id' => $id], 'Request with id '. $id . 'does not exist', 400);
        }

        $answer->update($request->all());
        $requestM->update(['status' => 'done']);
        $assignation->update(['state' => 'complete']);

        return $this->success($answer, 'Answer has been successfully updated.', 400);
    }

}
