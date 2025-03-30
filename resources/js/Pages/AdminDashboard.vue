<template>
      
      <admin-layout/>
      <div class="main_body">
            <div class="dashboard_content">
                  <div class="d_card1">
                    <span>Total cars: {{dashboardData.total_cars}}</span>
                  </div>
                  <div class="d_card2">
                    <span>Available cars: {{dashboardData.available_cars}}</span>
                  </div>
                  <div class="d_card3">
                   <span>Total Rents: {{dashboardData.total_rents}}</span>
                  </div>
                  <div class="d_card4">
                    <span>Total Revenue: {{dashboardData.total_revenue}}</span>
                  </div>
            </div>
      </div>
</template>

<script setup>
import AdminLayout from '@/Layout/AdminLayout.vue'
import{usePage} from '@inertiajs/vue3'

const page = usePage();
const dashboardData = page.props.dashboardData;
</script>

<style scoped>
.main_body{
     width: cal(100vw - 10vw);
     margin-left: 10vw;
     padding:2vw;
 }
 .dashboard_content{
       display: flex;
       width: 60%;
       grid-gap: 5%;
       margin: 0 auto;
 }
 .d_card1,.d_card2,.d_card3,.d_card4{
     width: 15%;
     height: 10%;
     background: whitesmoke;  
     border: 1px solid gray;
     border-radius: 10px;
 }
</style>