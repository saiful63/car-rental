<template>
     
      <div class="main_body">
            <div class="card car_details">
                  <div class="card_header">
                        <img :src="`/storage/${carDetails.image}`" width="100%" alt="">
                  </div>
                  <div class="vertical-line"></div>
                  <div class="card_body">
                       <div class="car_details_info">
                             <span>Brand: {{carDetails.brand}}</span>
                             <span>Model: {{carDetails.model}}</span>
                             <span>Year: {{carDetails.year}}</span>
                             <span>Type: {{carDetails.car_type}}</span>
                             <span>Daily: {{carDetails.daily_rent_price}}</span>
                             <hr>
                             <div class="car_details_date">
                              <div class="date_in_row">
                                    <div>
                                          <label>Start date</label>
                                          <input type="date" v-model="formData.start_date">
                                    </div>
                                    
                                    <div>
                                          <label>End date</label>
                                          <input type="date" v-model="formData.end_date">

                                          <span v-if="validation_errors.end_date" class="text-danger">{{validation_errors.end_date}}</span>
                                          <span v-if="validation_errors.end_date && errors.length">||</span>
                                          <span v-if="errors.length" class="text-danger">{{errors}}</span>
                                    </div>
                                    
                              </div>
                              <!-- <input type="hidden" v-model="formData.daily_rent_price">
                              <input type="hidden" v-model="formData.daily_rent_price"> -->
                              <button class="btn btn-primary" @click="Book">Book</button>
                             </div>
                       </div>
                        
                  </div>
            </div>
      </div>
</template>

<script setup>
import{Link,usePage} from '@inertiajs/vue3'
import{computed,reactive,ref} from 'vue'
import axios from 'axios'
import {useToast} from 'vue-toastification'


const toast = useToast();

const page = usePage();

const carDetails = computed(()=>page.props.car)
console.log(carDetails.value.daily_rent_price)
const formData = reactive({
    car_id:carDetails.value.id,
    daily_rent_price:carDetails.value.daily_rent_price,
    start_date:'',
    end_date:'',
    status:'Pending'
})
const defaultFormData = reactive({
  car_id:'',
  start_date:'',
  end_date:'',
  status:'',
  daily_rent_price:''
})

const errors = ref([])
const validation_errors = reactive({
      end_date:''
})

const Book = async()=>{
  errors.value = {}
  validation_errors.end_date=''
  try{
        let res = await axios.post('/admin/create_rental',formData);
        
        if(res.data.message && res.data.status==='validation_err'){
              errors.value = res.data.message
        }else{
              toast.success(res.data.message)
        }
        
       //Object.assign(formData,defaultFormData);
      }catch(error){
        if(error.response && error.response.data.errors){
            //Object.assign(formData,defaultFormData);
            validation_errors.end_date = error.response.data.errors.end_date[0];
        }
      }

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
</style>