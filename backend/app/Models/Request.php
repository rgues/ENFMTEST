<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasManyThrough;

class Request extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'title',
        'description',
        'status',
        'date_request',
        'user_id',
        'category_id'
    ];


    /**
     *  Get the user 
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }


    /**
     *  Get the user 
     */
    public function assignations()
    {
        return $this->hasMany(Assignation::class);
    }

    /**
     *  Get the user 
     */
    public function category()
    {
        return $this->hasOne(Category::class);
    }

    /*
         * Get all of the comments for the Request
         *
         * @return \Illuminate\Database\Eloquent\Relations\HasManyThrough
    */
    public function answers(): HasManyThrough
    {
        return $this->hasManyThrough(
            Answer::class, 
            Assignation::class
    );
    }
}
