<template>
     
      <div class="main_body">
            <div class="card">
                  <div class="card_header">
                    <h3>User Login</h3>
                  </div>
                  
                  <div class="card_body">
                      <form @submit.prevent="submit">
                         <input type="text" v-model="formData.email" class="form-control" placeholder="Enter email">
                         <br>
                         <input type="text" v-model="formData.password" class="form-control" placeholder="Enter password">
                         <br>
                         <div>

                         </div>
                         <div>
                               <button type="submit">Login</button> 
                         </div>
                         
                      </form>  
                  </div>
            </div>
      </div>
</template>

<script setup>
import{Link,usePage,router} from '@inertiajs/vue3'
import{reactive,watch} from 'vue'
import {useToast} from 'vue-toastification'

const toast = useToast();


const formData = reactive({
   'email':'',
   'password':''
})


const submit = ()=>{
    router.post('/login',formData);
}

</script>

<style scoped>
.main_body{
     width: cal(100vw - 10vw);
     margin-left: 10vw;
     padding:2vw;
 }

 .car_details{
      display: flex;
      flex-direction: row; 
      width: 50%;
      padding: 10px;
      margin: 0 auto;
 }
 .card_header,.card_body{
       width: 25%;
 }
 .vertical-line {
  width: 2px;
  height: 100px;
  border: 1px solid yellow;
  background-color: black;
}
.car_details_date{
      display: flex;
      flex-direction: column;
      gap: 10px;
      
}

.date_in_row{
      display: flex;
      gap: 10px;
}
.car_details_info{
      padding-left: 10px;
      display: flex;
      flex-direction: column;
}
.card{
      width: 400px;
      margin: 0 auto;
}

.card_body,.card_header{
      width: 100%;
}

</style>