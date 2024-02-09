<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\User;
use App\Models\Request;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Assignation>
 */
class AssignationFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            //
            'user_id' => User::all()->random()->id,
            'request_id'  =>  Request::all()->random()->id,
            'sender_id'  =>  User::all()->random()->id,
            'comment'  => fake()->text(),
            'state'  => 'pending',
            'date_assignation'  => now()
        ];
    }
}
