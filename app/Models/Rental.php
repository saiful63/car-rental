<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Rental extends Model
{
    use HasFactory;
 
    protected $fillable=['user_id','car_id','start_date','end_date','total_cost','status'];
    protected $dates = ['start_date','end_date'];

    public function user(){
        return $this->belongsTo(User::class);
    }

    public function car(){
        return $this->belongsTo(Car::class);
    }

    public function getFormattedStartDateAttribute(){
       return Carbon::parse($this->start_date)->format('dM,Y');
    }

    public function getFormattedEndDateAttribute(){
       return Carbon::parse($this->end_date)->format('dM,Y');
    }
}
