<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\User;

class CustomerController extends Controller
{
    function CustomerPage(){
      $users = User::all();
      return Inertia::render('CustomerPage',['users'=>$users]);
    }
}
