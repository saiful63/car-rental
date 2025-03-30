<template>

      <div class="main_body">
      <div class="nav">
            <ul class="nav_item">
                  <li>    
                    <Link href="/signup">Signup</Link>    
                  </li>
                  <li>
                        <Link href="/loginPage">Login</Link>   
                  </li>
                  <li>
                       <Link href="/car_filters_page">Rentals</Link>  
                  </li>
            </ul>
      </div>
      <div class="filters mb-3">
            <div class="row">
            <!-- Brand Dropdown -->
            <div class="col-md-4">
                <label for="brand">Select Brand:</label>
                <select v-model="state.filters.brand" class="form-control">
                    <option value="">All Brands</option>
                    <option v-for="brand in state.brands" :key="brand" :value="brand">{{ brand }}</option>
                </select>
            </div>
            <div class="col-md-4">
                <label for="brand">Select type:</label>
                <select v-model="state.filters.car_type" class="form-control">
                    <option value="">All typies</option>
                    <option v-for="type in state.carType" :key="type" :value="type">{{ type }}</option>
                </select>
            </div>
             <div class="col-md-4">
                <label for="price">Max Price:</label>
                <input v-model="state.filters.price" type="text" class="form-control" placeholder="Enter max price">
            </div>
            </div>
      </div>
      <div class="content">
            <div class="car">
                  <div class="card each_card" v-for="car in state.cars" :key="car.id">
                        <div class="card_header">
                         <img :src="`/storage/${car.image}`" alt="" width="100%">
                        </div>
                        <div class="card_body card_item">
                             <span>{{car.name}}</span> 
                             <span>Brand: {{car.brand}}</span> 
                             <span>Daily rent: {{car.daily_rent_price}}</span> 
                             <button class="btn btn-primary" @click="bookNow(car.id)">Book Now</button>
                        </div>
                  </div>
            </div>
      </div>
      </div>
</template>

<script setup>
import{Link,usePage,router} from '@inertiajs/vue3'
import{computed,onMounted,reactive,watchEffect,watch} from 'vue'
import axios from 'axios'

const page = usePage();

const carList = computed(()=>page.props.cars)
const bookNow=(id)=>{
    router.get(`/car_details/${id}`);
}

const state = reactive({
      cars:[],
      brands:[],
      carType:[],
      filters:{
            brand:"",
            car_type:"",
            price:"",
      }
})

const fetchCars=async()=>{
  try{
      let res = await axios.get('/fetch_cars');
      state.cars = res.data.cars;
      state.brands = res.data.brands;
      state.carType = res.data.car_typies;
  }catch(error){
        console.log(error)
  }
  
}

const filterCars=async()=>{
   let res = await axios.get('/fetch_cars',{
         params:state.filters
   });
   state.cars = res.data.cars;
   console.log(res.data.cars);
}
onMounted(fetchCars)



watch(()=>state.filters,()=>{
  filterCars()
},{deep: true})
</script>

<style scoped>
.main_body{
     width: cal(100vw - 10vw);
     margin-left: 10vw;
     padding:2vw;
 }
 .car{
       width: 80%;
       max-width: 1200px;
       display: flex;
       flex-wrap: wrap;
       gap: 10px;
 }
 .each_card{
       flex:1 1 100px;
        min-width: 150px; 
      max-width: 220px; 
      min-height: 250px;
       padding: 20px;
 }
 .card_item{
       display: flex;
       flex-direction: column;

 }
 
 .nav{
       width: 80%;
       background-color: rgb(231, 218, 218);
       padding: 2px;
       margin-bottom: 10px;
 }
 .nav_item{
     margin-top: 10px;
     display: flex;
     gap: 10px;
 }

.nav_item li{
      list-style: none;
}

.car{
       width: 80%;
       display: flex;
       flex-wrap: wrap;
       gap: 10px;
 }
 .each_card{
       flex:1 1 100px;
       min-width: 70px;
       padding: 20px;
 }
 .card_item{
       display: flex;
       flex-direction: column;

 }

</style>