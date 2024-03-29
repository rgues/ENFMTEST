<?php

    namespace App\Http\Controllers;
    
    use App\Traits\HttpResponses;
    use App\Http\Requests\StoreUserRequest;
    use App\Http\Requests\LoginUserRequest;
    use App\Models\User;
    use Illuminate\Support\Facades\Hash;
    use Illuminate\Support\Facades\Auth;
    
    class AuthController extends Controller
    {
        //
        use HttpResponses;
        /**
         *  Authenticate the user that call the API
        */
        public function login (LoginUserRequest $request) { 
    
            // Validate the request
            $request->validated($request->all());
    
            if (!Auth::attempt($request->only('email','password'))) {
                return $this->error('','Credentials do not match.',401);
            } 
    
             $user = User::where('email', $request->email)->first();
    
             return $this->success([
                    'user' => $user,
                    'token' => $user->createToken('API TOKEN of '. $user->fisrtname)->plainTextToken,
             ], 'User was successfully created', 200);
        }


        /**
        *  Register the user on the database
        */
        public function register (StoreUserRequest $request) {
    
            // Validate the request
            $request->validated($request->all());
    
            $user = User::create([
                'firstname' => $request->firstname,
                'lastname' => $request->lastname,
                'role_id' => $request->role_id,
                'email' => $request->email,
                'password' => Hash::make($request->password)
            ]);

            if (isset($user)) {
                return $this->success([
                    'user' => $user,
                    'token' => $user->createToken('API TOKEN of '. $user->firstname)->plainTextToken
                ], 'User was successfully created', 200);
            } else {
                return $this->error($request, 'Failed to create the user', 400);
            }
        }     
    
        /**
        *  Log out the user on the database
        */
        public function logout () {
    
            Auth::user()->currentAccessToken()->delete();
    
            return $this->success([
                'message' => 'You have successfully deleted and your token has been remove from the database'
            ]);
        }
    
    }
