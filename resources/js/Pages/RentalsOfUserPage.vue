<template>
      <AdminLayout/>
      <div class="main_body">
            <Link href="/admin/rental_form">Create Rental</Link>
            <div class="card mb-3">
             <table class="table table-bordered">
                 <tr>
                       <td>Email</td>
                       <td>{{user.email}}</td>
                 </tr>
                 <tr>
                       <td>Phone</td>
                       <td>{{user.phone}}</td>
                 </tr>
                 <tr>
                       <td>Address</td>
                       <td>{{user.address}}</td>
                 </tr>
             </table>
            </div>
            <div class="card">
                  <div class="card_header">
                       <h2>Rental History</h2> 
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
                                          <th>Action</th>
                                    </tr>
                              </thead>
                              <tbody>
                                 <tr v-for="(rental,index) in rentals" :key="rental.id">
                                       <td>{{index+1}}</td>
                                       <td>{{user.name}}</td>
                                       <td>{{rental.car.name}}-{{rental.car.brand}}</td>
                                       <td>{{rental.status}}</td>
                                       <td>{{rental.start_date}}</td>
                                       <td>{{rental.end_date}}</td>
                                       <td>{{rental.total_cost}}</td>
                                       <td>
                                             <!-- <button type="button" @click="DeleteCar(car.id)">
                                                  <font-awesome-icon :icon="['fas', 'trash']" size="1x" />
                                             </button>
                                             -->
                                             ||
                                             <Link :href="`/admin/edit_user_rental/${rental.id}`">
                                                 <font-awesome-icon :icon="['fas', 'pen-to-square']" size="1x" />
                                             </Link> 
                                       </td>
                                       
                                 </tr>
                              </tbody>
                        </table>
                        
                  </div>
            </div>
      </div>
      
</template>

<script setup>
import AdminLayout from '@/Layout/AdminLayout.vue'
import{Link,usePage} from '@inertiajs/vue3'
import axios from 'axios'


const page = usePage();
const rentals = page.props.rentalsOfUser;
const user = page.props.user;

</script>

<style scoped>
.main_body{
     width: cal(100vw - 10vw);
     margin-left: 10vw;
     padding:2vw;
 }
</style>