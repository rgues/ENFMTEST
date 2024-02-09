<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Answer extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'assignation_id',
        'description',
        'name',
        'state',
        'date_answer'
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'date_answer' => 'datetime'
    ];

    /**
     *  Get the  assignation  
     */
    public function assignation() 
    {
        return $this->belongsTo(Assignation::class);
    }
}
