<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Car;
use Inertia\Inertia;

class CarController extends Controller
{
    function CarList(){
        $cars = Car::where('availability',1)->orderBy('id','desc')->get();
        return Inertia::render('FrontendCar',['cars'=>$cars]);
    }

    function carDetails(Request $request){
         $id = $request->id;
        $car = Car::where('id',$id)->first();
        return Inertia::render('Frontend/CarDetailsPage',['car'=>$car]);
    }

    function carFiltersPage(){
        return Inertia::render('Frontend/CarFilterPage');
    }

    function fetchCars(Request $request){

         $query = Car::select('id', 'name', 'brand', 'image', 'car_type', 'daily_rent_price');

    
    if ($request->brand) {
        $query->where('brand', $request->brand);
    }

    if ($request->car_type) {
        $query->where('car_type', $request->car_type);
    }

    if ($request->price) {
        $query->where('daily_rent_price', '<=', $request->price);
    }

    // Get filtered cars
    $cars = $query->get();

    // Fetch all unique brands and car types from the database (not just filtered ones)
    $allBrands = Car::pluck('brand')->toArray();
    $allCarTypes = Car::pluck('car_type')->toArray();

    // Return response
    return response()->json([
        'cars' => $cars, 
        'brands' => $allBrands, 
        'car_typies' => $allCarTypes
    ]);
    }
}
