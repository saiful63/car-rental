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
                                          <th>Action</th>
                                    </tr>
                              </thead>
                              <tbody>
                                 <tr v-for="(rental,index) in current_rentals" :key="rental.id">
                                       <td>{{index+1}}</td>
                                       <td>{{user.name}}</td>
                                       <td>{{rental.car.name}}-{{rental.car.brand}}</td>
                                       <td>{{rental.status}}</td>
                                       <td>{{rental.start_date}}</td>
                                       <td>{{rental.end_date}}</td>
                                       <td>{{rental.total_cost}}</td>
                                       <td>
                                             <button type="button" @click="currentRental(rental.id)" class="btn btn-danger btn-sm">
                                                  Cancel
                                             </button>
                                       </td>
                                       
                                 </tr>
                              </tbody>
                        </table>
                        
                  </div>
            </div>
      </div>
</template>

<script setup>
import CustomerLayout from '@/Layout/CustomerLayout.vue'
import{Link,usePage,router} from '@inertiajs/vue3'
import{computed} from 'vue'
import axios from 'axios'
import {useToast} from 'vue-toastification'
import Swal from 'sweetalert2'


const toast = useToast();
const page = usePage();
const current_rentals = page.props.currentRental;
const user = page.props.user;
const flashMessage = computed(()=>{
   page.props.flash?.success??"";
}) 

const currentRental = async (id) => {
  Swal.fire({
    title: 'Are you sure?',
    text: 'You won’t be able to revert this!',
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Yes, delete it!'
  }).then((result) => {
    if (result.isConfirmed) {
      try {
        router.delete(`/admin/delete_current_rental/${id}`,{
          preserveScroll:true,
          preserveState:false,
          onSuccess:()=>{
            Swal.fire({
            title: 'Deleted!',
            text: flashMessage.value?flashMessage.value:'',
            icon: 'success',
            confirmButtonText: 'OK'
          }).then(()=>{
            if(flashMessage.value){
              toast.success(flashMessage.value)
            }
          });
          },
          onError:(error)=>{
            Swal.fire({
            title: "Error!",
            text: "Something went wrong. Please try again.",
            icon: "error",
            confirmButtonText: "OK",
          });
          }
          
        });
      } catch (error) {
            console.log(error)
        Swal.fire({
          title: 'Error!',
          text: 'Something went wrong. Please try again.',
          icon: 'error',
          confirmButtonText: 'OK'
        });
      }
    }
  });
};

</script>

<style scoped>
.main_body{
     width: cal(100vw - 10vw);
     margin-left: 10vw;
     padding:2vw;
 }
</style>