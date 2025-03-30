<template>
      
      <AdminLayout/>
      <div class="main_body">
            <Link href="/admin/car">Car List</Link>
            <div class="card">
                  <div class="card_header">
                        Car List
                  </div>
                  <div class="card_body">
                        <table class="table table-bordered table-striped">
                              <tr>
                              <td>Name</td>
                              <td>{{ car.name }}</td>
                              </tr>
                              <tr>
                              <td>Brand</td>
                              <td>{{ car.brand }}</td>
                              </tr>
                              <tr>
                              <td>Model</td>
                              <td>{{ car.model }}</td>
                              </tr>
                              <tr>
                              <td>Car Type</td>
                              <td>{{ car.car_type }}</td>
                              </tr>
                              <tr>
                              <td>Daily Rent Price</td>
                              <td>{{ car.daily_rent_price }}</td>
                              </tr>
                              <tr>
                              <td>Image</td>
                              <td>
                                    <img :src="`/storage/${car.image}`" width="80px" alt="Car Image">
                              </td>
                              </tr>
                              <tr>
                              <td>Year</td>
                              <td>{{ car.year }}</td>
                              </tr>
                        </table>
                        
                  </div>
            </div>
      </div>
      
</template>

<script setup>
import AdminLayout from '@/Layout/AdminLayout.vue'
import {defineProps} from 'vue'
import{Link} from '@inertiajs/vue3'

const props=defineProps({
      car:Array
})

</script>

<style scoped>
.main_body{
     width: cal(100vw - 10vw);
     margin-left: 10vw;
     padding:2vw;
 }
</style>