<template>
      
      <AdminLayout/>
      <div class="main_body">
            <Link href="/admin/car" class="btn btn-primary">View car</Link>
            <div class="card">
                  <div class="card_header">
                        Add Car
                  </div>
                  <div class="card_body">
                        
                        <form @submit.prevent="submit">
                         <input type="text" v-model="formData.name" class="form-control" placeholder="Enter Name">
                         <br>
                         <input type="text" v-model="formData.brand" class="form-control" placeholder="Enter Brand">
                         <br>
                         <input type="text" v-model="formData.model" class="form-control" placeholder="Enter Model">
                         <br>
                         <input type="text" v-model="formData.car_type" class="form-control" placeholder="Enter Car type">
                         <br>
                         <input type="text" v-model="formData.daily_rent_price" class="form-control" placeholder="Enter Daily rent price">
                         <br>
                         <select class="form-control" v-model="formData.availability">
                               <option value="" disabled selected>Availability</option>
                               <option value="1">Yes</option>
                               <option value="0">No</option>
                         </select>
                         <br>
                         <input type="file" id="image" @change="handleImage" class="form-control">
                         <br>
                         <input type="text" v-model="formData.year" class="form-control" placeholder="Enter manufacturing year">
                         <br>
                         <button type="submit">Add</button>
                        </form>
                  </div>
            </div>
      </div>
      
</template>

<script setup>
import AdminLayout from '@/Layout/AdminLayout.vue'
import{Link} from '@inertiajs/vue3'
import{reactive} from 'vue'
import axios from 'axios'
import {useToast} from 'vue-toastification'


const toast = useToast();

const formData = reactive({
  name:'',
  brand:'',
  model:'',
  car_type:'',
  daily_rent_price:'',
  availability:'',
  image:null,
  year:''

})

const defaultFormData = reactive({
  name:'',
  brand:'',
  model:'',
  car_type:'',
  daily_rent_price:'',
  availability:'',
  image:null,
  year:''

})

function handleImage(event){
      formData.image = event.target.files[0]
      console.log(formData.image)
}

const submit = async()=>{
      let data = new FormData()
      data.append('name',formData.name)
      data.append('brand',formData.brand)
      data.append('model',formData.model)
      data.append('car_type',formData.car_type)
      data.append('daily_rent_price',formData.daily_rent_price)
      data.append('availability',formData.availability)
      data.append('image',formData.image)
      data.append('year',formData.year)
      try{
        let res = await axios.post('/admin/add_car',data,{
           headers:{'Content-type':'multipart/form-data'}
        })
        toast.success(res.data.message)
      //   Object.assign(formData,defaultFormData);
        document.getElementById('image').value='';
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