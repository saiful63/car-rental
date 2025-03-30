<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Inertia;
use App\Models\Car;
use App\Models\Rental;

class DashboardController extends Controller
{
    function dashboard(){
        $total_cars = Car::count();
        $available_cars = Car::where('availability',1)->count();
        $total_rents = Rental::count();
        $total_revenue = Rental::where('status','Completed')->sum('total_cost');
        $dashboardData = [
            'total_cars'=>$total_cars,
            'available_cars'=>$available_cars,
            'total_rents'=>$total_rents,
            'total_revenue'=>$total_revenue
        ];
        //return response()->json([$total_cars,$available_cars,$total_rent,$total_revenue]);
        return Inertia::render('AdminDashboard',['dashboardData'=>$dashboardData]);
    }
}
