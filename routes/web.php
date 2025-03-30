<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\CarController;
use App\Http\Controllers\RentalController;
use App\Http\Controllers\Admin\DashboardController as AdminDashboard;
use App\Http\Controllers\Admin\CarController as AdminCar;
use App\Http\Controllers\Admin\CustomerController as AdminCustomer;
use App\Http\Controllers\Admin\RentalController as AdminRental;
use App\Http\Controllers\Customer\RentalController as CustomerRental;
use App\Http\Controllers\Customer\DashboardController as CustomerDashboard;
use App\Http\Controllers\Frontend\CarController as FrontendCar;
use App\Http\Controllers\AuthController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Authentication

Route::get('/signup',[AuthController::class,'signup'])->name('signup');

Route::post('/create_user',[AuthController::class,'CreateUser']);
Route::get('/loginPage',[AuthController::class,'loginPage'])->name('loginPage');
Route::post('/login',[AuthController::class,'login'])->name('login');

// Frontend
Route::get('/',[FrontendCar::class,'CarList'])->name('frontend.car_list');
Route::get('/car_details/{id}',[FrontendCar::class,'carDetails'])->name('frontend.car_details');
Route::get('/car_filters_page',[FrontendCar::class,'carFiltersPage'])->name('frontend.car_filters_page');
Route::get('/fetch_cars',[FrontendCar::class,'fetchCars'])->name('frontend.fetch_cars');


Route::middleware('auth')->group(function(){
   Route::middleware('IsAdmin')->group(function(){
        // Admin dashboard
        Route::get('/admin/dashboard',[AdminDashboard::class,'dashboard'])->name('admin.dashboard');

        Route::post('/add_car',[CarController::class,'AddCar'])->name('AddCar');
        Route::get('/show_car/{id}',[CarController::class,'ShowCar'])->name('ShowCar');
        Route::post('/update_car',[CarController::class,'UpdateCar'])->name('UpdateCar');
        Route::post('/delete_car/{id}',[CarController::class,'DeleteCar'])->name('DeleteCar');

     //    Route::post('/create_rental',[RentalController::class,'CreateRental'])->name('CreateRental');

        // Page route
        Route::get('/admin/rental_page',[AdminRental::class,'RentalPage'])->name('admin.rental_page');
        Route::get('/admin/rental_form',[AdminRental::class,'RentalForm'])->name('admin.rental_form');
        Route::get('/admin/edit_rental_page/{id}',[AdminRental::class,'EditRentalPage'])->name('admin.edit_rental_page');


        // Car
        Route::get('/admin',[AdminDashboard::class,'index'])->name('admin.index');
        Route::get('/admin/car',[AdminCar::class,'CarPage'])->name('admin.car');
        Route::get('/admin/customer',[AdminCustomer::class,'CustomerPage'])->name('admin.customer');
        Route::get('/admin/rental',[AdminRental::class,'RentalPage'])->name('admin.rental');
        Route::get('/admin/add_car_page',[AdminCar::class,'AddCarPage'])->name('admin.add_car_page');
        Route::post('/admin/add_car',[AdminCar::class,'AddCar'])->name('admin.add_car');
        Route::get('/admin/view_car/{id}',[AdminCar::class,'ViewCar'])->name('admin.view_car');
        Route::get('/admin/edit_car_page/{id}',[AdminCar::class,'EditCarPage'])->name('admin.edit_car_page');
        Route::post('/admin/delete_car/{id}',[AdminCar::class,'DeleteCar'])->name('admin.delete_car');
        Route::post('/admin/update_car',[AdminCar::class,'UpdateCar'])->name('admin.update_car');
        Route::get('/admin/get_cars',[AdminCar::class,'GetCars'])->name('admin.get_cars');
        
        // Rental
        Route::get('/admin/car_list',[AdminRental::class,'CarList'])->name('admin.car_list');
        Route::get('/admin/customer_list',[AdminRental::class,'CustomerList'])->name('admin.customer_list');
        Route::post('/admin/create_rental',[AdminRental::class,'CreateRental'])->name('admin.create_rental');
        Route::get('/admin/list_rental',[AdminRental::class,'RentalList'])->name('admin.list_rental');
        Route::get('/admin/show_user_rentals/{id}',[AdminRental::class,'rentalsOfUser'])->name('admin.rentals_of_user');
        Route::get('/admin/edit_user_rental/{id}',[AdminRental::class,'editUserRentalPage'])->name('admin.edit_user_rental_page');
        Route::post('/admin/edit_user_rental',[AdminRental::class,'editUserRental'])->name('admin.edit_user_rental');
        Route::get('/logout',[AuthController::class,'logout'])->name('logout');
   });
   
   Route::middleware('IsCustomer')->group(function(){
        // Customer
        Route::get('/customer/customerDashboardPage',[CustomerDashboard::class,'dashboard'])->name('customer.customer_dashboard_page');
        Route::get('/customer/current_rental',[CustomerRental::class,'currentRental'])->name('customer.current_rental');
        Route::get('/customer/rental_history',[CustomerRental::class,'rentalHistory'])->name('customer.rental_history');
        Route::delete('/admin/delete_current_rental/{id}',[CustomerRental::class,'deleteCurrentRental'])->name('admin.delete_current_rental');
        Route::get('/logout',[AuthController::class,'logout'])->name('logout');
        Route::post('/admin/create_rental',[AdminRental::class,'CreateRental'])->name('admin.create_rental');
      });

});


