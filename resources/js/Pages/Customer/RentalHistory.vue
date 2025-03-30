<template>
      
      <CustomerLayout/>
      <div class="main_body">
            <div class="card">
                  <div class="card_header">
                       <h2>Current Rental</h2> 
                       <hr>
                  </div>
                  <div class="card_body">
                        <table class="table">
                              <thead>
                                    <tr>
                                          <th>SL</th>
                                          <th>Customer Name</th>
                                          <th>Car Details(Name,Brand)</th>
                                          <th>Status</th>
                                          <th>Start Date</th>
                                          <th>End Date</th>
                                          <th>Total Cost</th>
                                    </tr>
                              </thead>
                              <tbody>
                                 <tr v-for="(rental,index) in rentals_history" :key="rental.id">
                                       <td>{{index+1}}</td>
                                       <td>{{user.name}}</td>
                                       <td>{{rental.car.name}}-{{rental.car.brand}}</td>
                                       <td>{{rental.status}}</td>
                                       <td>{{rental.start_date}}</td>
                                       <td>{{rental.end_date}}</td>
                                       <td>{{rental.total_cost}}</td>
                                       
                                 </tr>
                              </tbody>
                        </table>
                        
                  </div>
            </div>
      </div>
</template>

<script setup>
import CustomerLayout from '@/Layout/CustomerLayout.vue'
import{Link,usePage} from '@inertiajs/vue3'



const page = usePage();
const rentals_history = page.props.rentalHistory;
const user = page.props.user;

</script>

<style scoped>
.main_body{
     width: cal(100vw - 10vw);
     margin-left: 10vw;
     padding:2vw;
 }
</style>