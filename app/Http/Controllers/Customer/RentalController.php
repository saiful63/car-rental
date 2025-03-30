<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\User;
use App\Models\Rental;
use Log;
use Illuminate\Support\Facades\Auth;

class RentalController extends Controller
{
    function customerDashboardPage(){
       return Inertia::render('Customer/CustomerDashboardPage');
    }

    function currentRental(){
        $user = User::find(Auth::id(),['id','name','email','address','phone']);
        $currentRental = Rental::where('user_id',Auth::id())->where('status','Pending')->with(['car:id,name,brand'])
            ->get(['id','user_id','car_id','start_date','end_date','total_cost','status'])->map(function($rental){
              return[
                'id'=>$rental->id,
                'car'=>[
                  'name'=>$rental->car->name??'N/A',
                  'brand'=>$rental->car->brand??'N/A',
                ],
                'start_date'=>$rental->formatted_start_date,
                'end_date'=>$rental->formatted_end_date,
                'total_cost'=>$rental->total_cost,
                'status'=>$rental->status
              ];
            });
        return Inertia::render('Customer/CurrentRental',['currentRental'=>$currentRental,'user'=>$user]);
    }

    function rentalHistory(){
        $user = User::find(Auth::id(),['id','name','email','address','phone']);
        $rentalHistory = Rental::where('user_id',Auth::id())->where('status','Completed')->with(['car:id,name,brand'])
            ->get(['id','user_id','car_id','start_date','end_date','total_cost','status'])->map(function($rental){
              return[
                'id'=>$rental->id,
                'car'=>[
                  'name'=>$rental->car->name??'N/A',
                  'brand'=>$rental->car->brand??'N/A',
                ],
                'start_date'=>$rental->formatted_start_date,
                'end_date'=>$rental->formatted_end_date,
                'total_cost'=>$rental->total_cost,
                'status'=>$rental->status
              ];
            });
        return Inertia::render('Customer/RentalHistory',['rentalHistory'=>$rentalHistory,'user'=>$user]);
    }


function deleteCurrentRental(Request $request){
  $id = $request->id;
  try{
    $delete_current_rental = Rental::findOrFail($id);
  if($delete_current_rental->delete()){
    return to_route('customer.current_rental')->with('success','Rental deleted successfully');
  }else{
    return to_route('customer.current_rental')->with('error','Rental delation fail');
  } 
}catch(Exception $e){
   
   Log::info($e->getMessage().$e->getLine());
  }


  }

}
