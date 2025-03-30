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
      <div class="content">
            <div class="car">
                  <div class="card each_card" v-for="car in carList" :key="car.id">
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
import{computed} from 'vue'

const page = usePage();

const carList = computed(()=>page.props.cars)
const bookNow=(id)=>{
    router.get(`/car_details/${id}`);
}
</script>

<style scoped>
.main_body{
     width: cal(100vw - 10vw);
     margin-left: 10vw;
     padding:2vw;
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

</style>