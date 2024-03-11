<script setup>
import { GET_ROLES, GET_USERS} from '../store/types';
import { ref, onMounted } from 'vue'
import store from '../store'

 const roles = ref([])
 const users = ref([])

 onMounted(async () => { 
       roles.value = await store.dispatch(GET_ROLES)
       users.value = await store.dispatch(GET_USERS)
 });

function roleName(id) {
    return roles.value.filter(item => item.id === id)
           .map(item=>item ? item.title : '')[0];
}
</script>

<template>
  <div class="admin-container mt-5">
    <div className="admin_table">
      <table class="table" >
        <thead>
          <tr class="table-secondary">
           
            <th scope="col">Firstname</th>
            <th scope="col">Lastname</th>
            <th scope="col">Email</th>
             <th scope="col">Role</th>
          </tr>
        </thead>
        <tbody>
           <tr class="table-light" v-for="item in users" :key="item.id" >
              
                    <td>
                       <span class="text-left fw-bold">
                          {{item.firstname}}
                        </span> 
                    </td>
                    <td>{{item.lastname}}</td>
                    <td>{{item.email}}</td>
                    <td>
                        <span :class="{'badge bg-danger':item.role_id===1, 'badge bg-success':item.role_id===2 , 'badge bg-warning':item.role_id===3 }">
                            {{roleName(item.role_id) }}
                        </span>
                    </td>
               </tr> 
        </tbody>
      </table>
    </div>
  </div>
</template>
