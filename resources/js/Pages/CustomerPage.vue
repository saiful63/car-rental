<template>
      <admin-layout/>
      <div class="main_body">
            <!-- <Link href="/admin/add_car_page">Add Car</Link> -->
            <div class="card">
                  <div class="card_header">
                        Customer List
                  </div>
                  <div class="card_body">
                        <table class="table">
                              <thead>
                                    <tr>
                                          <th>Sl</th>
                                          <th>Customer Name</th>
                                          <th>Email</th>
                                          <th>Phone</th>
                                          <th>Address</th>
                                          <th>Action</th>
                                    </tr>
                              </thead>
                              <tbody>
                                 <tr v-for="(user,index) in userList" :key="user.id">
                                       <td>{{index+1}}</td>
                                       <td>{{user.name}}</td>
                                       <td>{{user.email}}</td>
                                       <td>{{user.phone}}</td>
                                       <td>{{user.address}}</td>
                                       <td>
                                             <Link :href="`/admin/show_user_rentals/${user.id}`">
                                                 <font-awesome-icon :icon="['fas', 'eye']" size="1x" />
                                             </Link> ||
                                                <Link :href="`/admin/edit_car_page/${id}`">
                                                      <font-awesome-icon :icon="['fas', 'pen-to-square']" size="1x" />
                                                </Link> ||
                                                <button type="button" @click="DeleteCar(id)">
                                                      <font-awesome-icon :icon="['fas', 'trash']" size="1x" />
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
import AdminLayout from '@/Layout/AdminLayout.vue'
import{Link,usePage} from '@inertiajs/vue3'
import{computed} from 'vue'

const page = usePage();

const userList = computed(()=>page.props.users)

</script>

<style scoped>
.main_body{
     width: cal(100vw - 10vw);
     margin-left: 10vw;
     padding:2vw;
 }
</style>