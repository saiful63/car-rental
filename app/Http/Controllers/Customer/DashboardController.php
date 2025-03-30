<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Car;
use App\Models\Rental;
use Inertia\Inertia;

class DashboardController extends Controller
{
    function dashboard(){
        $total_cars = Car::count();
        $available_cars = Car::where('availability',1)->count();
        $dashboardData = [
            'total_cars'=>$total_cars,
            'available_cars'=>$available_cars
        ];
        //return response()->json([$total_cars,$available_cars,$total_rent,$total_revenue]);
        return Inertia::render('Customer/CustomerDashboardPage',['dashboardData'=>$dashboardData]);
    }
}
