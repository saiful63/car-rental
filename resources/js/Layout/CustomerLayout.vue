<template>
      <div class="sidenav">
       <div class="items">  
         <Link href="/customer/customerDashboardPage">Dashboard</Link>
         <Link href="/customer/current_rental">Rental</Link>
         <Link href="/customer/rental_history">Rental History</Link>
         <Link href="/logout">Logout</Link>
       </div>
      </div>
      
          <slot/>
      
</template>

<script setup>
import{Link} from '@inertiajs/vue3'
</script>

<style scoped>
 .sidenav{
     position: fixed;
     width: 10vw;
     height: 100vh;
     top: 0;
     left: 0;
     background-color: rgb(51, 48, 48);
     padding-left: 2vw;
     padding-top: 2vw;
 }

 .items{
     display: flex;
     flex-direction: column;
     font-size:20px;
     gap: 10px;
     margin: 0 auto;
 }

 .items a{
     color: white;
     text-decoration: none;
 }
 
</style>