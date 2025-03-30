<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Exception;
use Log;

class AuthController extends Controller
{
    function signup(){
        return Inertia::render('Frontend/Signup');
    }

    function CreateUser(Request $request){
       $name = $request->input('name');
       $email = $request->input('email');
       $phone = $request->input('phone');
       $password = $request->input('password');
       $address = $request->input('address');

       $user= User::create([
           'name'=>$name,
           'email'=>$email,
           'phone'=>$phone,
           'password'=>$password,
           'address'=>$address
       ]);
      
        if($user){
           return redirect()->route('signup')->with('message', 'You are registered user now');
       }
       else{
             return redirect()->route('signup')->with('message', 'Registration failed');
       }
   
       
    }

    function loginPage(){
        return Inertia::render('Frontend/loginForm');
    }

    function login(Request $request){
       if(Auth::attempt($request->only('email','password'))){
           $user = Auth::user();

           return redirect()->route($user->isAdmin()?'admin.dashboard':'customer.customer_dashboard_page');
       }else{
           return redirect()->route('loginPage');
       }
    }

    function logout(){
        Auth::logout();
        return redirect('/');
    }
}
