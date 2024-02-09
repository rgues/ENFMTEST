<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Assignation extends Model
{
    use HasFactory;

     /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'user_id',
        'request_id',
        'sender_id',
        'comment',
        'state',
        'date_assignation'
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'date_assignation' => 'datetime'
    ];

      /**
     *  Get the  request  
     */
    public function request() 
    {
        return $this->belongsTo(Request::class);
    }

    /**
     *  Get the  answers  
     */
    public function answers() 
    {
        return $this->hasMany(Answer::class);
    }

}
