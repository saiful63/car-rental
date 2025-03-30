<template>
      
      <AdminLayout/>
      <div class="main_body">
            <Link href="/admin/add_car_page">Add Car</Link>
            <div class="card">
                  <div class="card_header">
                        Car List
                  </div>
                  <div class="card_body">
                            <EasyDataTable
                              :headers="headers"
                              :items="formattedCars"
                              :rows-per-page="3" 
                              item-html="image"
                            >
                                <template #item-image="{image}">
                                    <img :src="`/storage/${image}`" width="80px">
                                </template>

                              <template #item-action="{id}">
                                    <Link :href="`/admin/view_car/${id}`">
                                          <font-awesome-icon :icon="['fas', 'eye']" size="1x" />
                                    </Link> ||
                                    <Link :href="`/admin/edit_car_page/${id}`">
                                          <font-awesome-icon :icon="['fas', 'pen-to-square']" size="1x" />
                                    </Link> ||
                                    <button type="button" @click="DeleteCar(id)">
                                          <font-awesome-icon :icon="['fas', 'trash']" size="1x" />
                                    </button>
                              </template>
                            </EasyDataTable>
                       
                        
                  </div>
            </div>
      </div>
      
</template>

<script setup>
import AdminLayout from '@/Layout/AdminLayout.vue'
import {defineProps,reactive,onMounted,computed} from 'vue'
import{Link} from '@inertiajs/vue3'
import axios from 'axios'
import Swal from "sweetalert2";
import {useToast} from 'vue-toastification'


const toast = useToast();


let carData = reactive({
   cars:[]
})

const fetchCars=async()=>{
   let res = await axios.get('/admin/get_cars');
    carData.cars = res.data
}


const DeleteCar=async(id)=>{
      Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!"
            }).then(async(result) => {
            if (result.isConfirmed) {
            try{
                  let res = await axios.post(`/admin/delete_car/${id}`); 
                  toast.success(res.data.message)
                  await fetchCars();
            
                  }catch(error){
                        console.log(error)
                 }
            }
      });
      
}

onMounted(fetchCars)

const headers=[
      {text:"Name",value:"name"},
      {text:"Brand",value:"brand"},
      {text:"Model",value:"model"},
      {text:"Car type",value:"car_type"},
      {text:"Daily rent price",value:"daily_rent_price"},
      {text:"Image",value:"image"},
      {text:"Year",value:"year"},
      {text:"Availability",value:"availability"},
      {text:"Action",value:"action"}
];

const formattedCars=computed(()=>{
    return carData.cars.map(car=>({
        name:car.name,
        brand:car.brand,
        model:car.model,
        car_type:car.car_type,
        daily_rent_price:car.daily_rent_price,
        image:car.image,
        year:car.year,
        availability:car.availability === 1 ? "Available" : "Not Available",
        id:car.id
    }))
})
</script>

<style scoped>
.main_body{
     width: cal(100vw - 10vw);
     margin-left: 10vw;
     padding:2vw;
 }
</style>