<template>
      
      <AdminLayout/>
      <div class="main_body">
            <Link href="/admin/rental_page" class="btn btn-primary mb-2">View rentals</Link>
            <div class="card">
                  <div class="card_header">
                        <h4>Create Rental</h4>
                  </div>
                  <div class="card_body">
                        
                        <form @submit.prevent="submit">
                         <input type="text" v-model="formData.customer" class="form-control">
                         <br>
                         <input type="text" v-model="formData.car" class="form-control">
                         <br>
                         <input type="date" v-model="formData.start_date" class="form-control">
                         <br>
                         <input type="date" v-model="formData.end_date" class="form-control">
                         <br>
                         <input type="text" v-model="formData.total_cost" class="form-control" placeholder="Enter Daily Rent">
                         <br>
                         <select class="form-control" v-model="formData.status">
                               <option value="" disabled selected>Select Status</option>
                               <option value="Pending">Pending</option>
                               <option value="Ongoing">Ongoing</option>
                               <option value="Completed">Completed</option>
                               <option value="Canceled">Canceled</option>
                         </select>
                         <br>
                         <button class="btn btn-primary btn-sm" type="submit">Update</button>
                        </form>
                  </div>
            </div>
      </div>
      
</template>

<script setup>
import AdminLayout from '@/Layout/AdminLayout.vue'
import{Link,usePage,router} from '@inertiajs/vue3'
import{reactive,onMounted,ref} from 'vue'
import axios from 'axios'
import {useToast} from 'vue-toastification'


const toast = useToast();

const page = usePage();


const formData = reactive({
  car:page.props.rental.car_id,
  customer:page.props.rental.user_id,
  start_date:page.props.rental.start_date,
  end_date:page.props.rental.end_date,
  status:page.props.rental.status,
  total_cost:page.props.rental.total_cost,
  id:page.props.rental.id
})

const defaultFormData = reactive({
  car:'',
  customer:'',
  start_date:'',
  end_date:'',
  status:'',
  daily_rent_price:'',
  id:''
})



const submit = async()=>{
      let data = new FormData()
      data.append('car_id',formData.car)
      data.append('user_id',formData.customer)
      data.append('start_date',formData.start_date)
      data.append('end_date',formData.end_date)
      data.append('status',formData.status)
      data.append('total_cost',formData.total_cost)
      data.append('id',formData.id)
      try{
        let res = await axios.post('/admin/edit_user_rental',data)
        
        if(res.data.message){
              toast.success(res.data.message)
              if(res.data.redirect_url){
                 router.get(res.data.redirect_url)
              }
              
        }else{
              toast.success(res.data.message)
        }
        
       //Object.assign(formData,defaultFormData);
      }catch(error){
       
      }
      
}

</script>

<style scoped>
.main_body{
     width: cal(100vw - 10vw);
     margin-left: 10vw;
     padding:2vw;
 }
</style>