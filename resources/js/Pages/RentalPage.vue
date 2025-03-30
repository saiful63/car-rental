<template>
      <AdminLayout/>
      <div class="main_body">
            <Link href="/admin/rental_form">Create Rental</Link>
            <div class="card">
                  <div class="card_header">
                        Rental List
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
                                 <tr v-for="list in rental_list.lists" :key="list.id">
                                       <td>{{list.id}}</td>
                                       <td>{{list.user.name}}</td>
                                       <td>{{list.car.name}}-{{list.car.brand}}</td>
                                       <td>{{list.status}}</td>
                                       <td>{{list.start_date}}</td>
                                       <td>{{list.end_date}}</td>
                                       <td>{{list.total_cost}}</td>
                                       <td>
                                             <!-- <Link :href="`/admin/view_car/${car.id}`">
                                                   <font-awesome-icon :icon="['fas', 'eye']" size="1x" />
                                             </Link> ||
                                              ||
                                             <button type="button" @click="DeleteCar(car.id)">
                                                  <font-awesome-icon :icon="['fas', 'trash']" size="1x" />
                                             </button> -->

                                             <Link :href="`/admin/edit_rental_page/${list.id}`">
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
import{Link} from '@inertiajs/vue3'
import {onMounted,reactive} from 'vue'
import axios from 'axios'


const rental_list = reactive({
      lists:[]
})
onMounted(async()=>{
      const res = await axios.get('/admin/list_rental');
      rental_list.lists = res.data;
})
console.log(rental_list.lists)
</script>

<style scoped>
.main_body{
     width: cal(100vw - 10vw);
     margin-left: 10vw;
     padding:2vw;
 }
</style>