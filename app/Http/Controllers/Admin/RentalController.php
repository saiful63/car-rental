<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\User;
use App\Models\Car;
use App\Models\Rental;
use Log;
use Carbon\Carbon;
use Exception;
use Illuminate\Support\Facades\Auth;

class RentalController extends Controller
{
    function RentalPage(){
      return Inertia::render('RentalPage');
    }

    function RentalForm(){
      return Inertia::render('RentalForm');
    }
    
    function CustomerList(){
        $customers = User::all();
        return response()->json($customers);
    }

    function CarList(){
       
        $cars = Car::all();
        return response()->json($cars);
    }

    function CreateRental(Request $request){
         $request->validate([
            'start_date'=>'required|date',
            'end_date'=>'required|date|after:start_date'
          ],[
            'end_date.after'=>'End will greater than start date'
          ]);
       $request->merge(['user_id'=>Auth::id()]);
       $car_id = $request->input('car_id');
       $user_id = $request->input('user_id');
       $today = Carbon::today()->toDateString();
      $start_date = Carbon::parse($request->input('start_date'));
      $end_date = Carbon::parse($request->input('end_date'));
      
      $isUnavailable = Rental::where('car_id',$car_id)
                        ->where('start_date','<=',$end_date)
                        ->where('end_date','>=',$start_date)
                        ->exists();
        
        if($isUnavailable){
           return response()->json([
             'message'=>'Car is not available',
             'status'=>'validation_err'
           ]);
        }else{
            $rental_data = $request->except('daily_rent_price');
            $start_date = Carbon::parse($request->input('start_date'));
            $end_date = Carbon::parse($request->input('end_date'));
            $totalDays = $start_date->diffInDays($end_date)+1;
            $totalRent = $totalDays*$request->input('daily_rent_price');
            $rental_data['total_cost'] = $totalRent;
            $rental = Rental::create($rental_data);

            if($rental){
                  return response()->json([
                  'message'=>'Rental created successfully',
                  'status'=>'200'
              ]);
            }else{
                  return response()->json([
                  'message'=>'Rental creation operaton fail',
                  'status'=>'500'
              ]);
            }
        }
       
}

function RentalList(){
               $rentals = Rental::with(['user','car'])
                   ->get()->map(function($rental){
                     return[
                       'id'=>$rental->id,
                       'user'=>[
                         'name'=>$rental->user->name??'N/A'
                       ],
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
            if($rentals){
            return response()->json($rentals);
            }
}

function EditRental(Request $request){
   $id = $request->id;
   $rental = Rental::where('id',$id)->first();
   return Inertia::render('EditRentalViewPage',['rental'=>$rental]);
}

function rentalsOfUser(Request $request){
  $id = $request->id;
  $user = User::find($id,['id','name','email','address','phone']);
  $rentalsOfUser = Rental::where('user_id',$id)->with(['car:id,name,brand'])
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
         //return response()->json($rentalsOfUser);
        return Inertia::render('RentalsOfUserPage',['rentalsOfUser'=>$rentalsOfUser,'user'=>$user]);
}

function editUserRentalPage(Request $request){
  $id = $request->id;
  $rental = Rental::where('id',$id)->first();
  return Inertia::render('EditRentalOfUserForm',['rental'=>$rental]);
}

function editUserRental(Request $request){
  $id = $request->id;
  try{
    $rentalUpdate = Rental::where('id',$id)->update($request->only(['id','user_id','car_id','start_date','end_date','total_cost','status']));
    return response()->json([
          'message'=>'Rental updated successfully',
          'status'=>200,
          'redirect_url'=>route('admin.rentals_of_user',['id'=>$request->user_id])
      ]);
  }catch(Exception $e){
    return response()->json([
          'message'=>'Rental updation operaton fail',
          'status'=>500
      ]);
  }
  
}


  


}
