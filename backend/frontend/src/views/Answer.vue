
<script setup>
import { GET_REQUESTS,GET_ASSIGNATIONS, GET_CATEGORIES,GET_ANSWERS, APPROVE_ANSWER,GET_USERS} from '../store/types'
import { format } from "date-fns"
import { onMounted, ref, watchEffect } from 'vue'
import store from '../store'
import router from '../routes'

 const categories = ref([])
 const users = ref([])
 const requests  = ref([])
 const assignations  = ref([])
 const answers = ref([])
 const currentUser = ref(null)
 const loading = ref(false)

 onMounted(async() => { 
       categories.value = await store.dispatch(GET_CATEGORIES);
       users.value = await store.dispatch(GET_USERS);
       requests.value = await store.dispatch(GET_REQUESTS);
       assignations.value = await store.dispatch(GET_ASSIGNATIONS);
       answers.value = await store.dispatch(GET_ANSWERS);
       currentUser.value = store.state.user.loginData.user;
 })

// Listen to update
 watchEffect(async () => {
      answers.value = await store.dispatch(GET_ANSWERS);
 })

      function  categoryName(id) {
          return id ? categories.value.filter(item => item.id === id)
          .map(item=>item ? item.name : '')[0] : '';
       }
         
       function userName(id) {
          return  id  ? users.value.filter(item => item.id === id)
          .map(item=>item ? item.firstname + ' ' + item.lastname : '')[0] : '';
        }
        
        function  request(id) {
           return id ? requests.value.find(item => item.id === id) : null
        }
        
         function assignation(id) {
           return id ? assignations.value.find(item => item.id === id) : null;
        }
       
        function approveResponse(item) {
           
            const data = { 
                description: item.description,
                assignation_id: item.assignation_id,
                state:"approve",
                id: item.id
            }
            loading.value = true;
            store.dispatch(APPROVE_ANSWER,data).then(async reponse => {
                 loading.value = false;
                if (reponse.status === 'success') {
                    router.push('/admin/dashboard')
                } 
            }).catch(err => {
                   loading.value = false;
                    if(err === 'error') {
                        alert(store.state.request.message);
                    }
                   
            })
        }

       function formatDate(date) {
                return format(date,"yyyy-MM-dd");
        }

</script>


<template>
  <div class="admin-container mt-5">
    <div className="admin_table">
      <table class="table" >
        <thead>
          <tr class="table-secondary">
            <th scope="col">Ticket</th>
            <th scope="col">Category</th>
            <th scope="col">Description</th>
            <th scope="col">Status</th>
            <th scope="col">Comment</th>
            <th scope="col">Response</th>
             <th scope="col">IT</th>
            <th scope="col">Date </th>
            <th scope="col" v-if="currentUser&&currentUser.role_id ===2">Action</th>
          </tr>
        </thead>
        <tbody>
           <tr class="table-light" v-for="item in answers" :key="item.id" >

                    <td>
                      {{ assignation(item.assignation_id) ? request(assignation(item.assignation_id).request_id).title : ''}}
                    </td>
                    <td>
                        <span class="fw-bold" >
                            {{ assignation(item.assignation_id) ? categoryName(request(assignation(item.assignation_id).request_id).category_id) : ''  }}
                        </span>
                    </td>
                   
                    <td>
                        {{ assignation(item.assignation_id) ?  request(assignation(item.assignation_id).request_id).description : ''}}
                    </td>
                    <td>
                      <span :class="{'badge bg-danger':item.state==='in_approval','badge bg-success':item.state==='approve' }">
                        {{item.state}}
                      </span> 
                      </td>
                    <td>
                        <span class="fs-6" >
                            {{assignation(item.assignation_id) ? assignation(item.assignation_id).comment : ''}}
                        </span>
                    </td>

                     <td>{{item.description ? item.description : ''}}</td>

                    <td>{{assignation(item.assignation_id) ? userName(assignation(item.assignation_id).user_id) : '' }}</td>
                  
                  
                    <td>{{ item.date_answer ? formatDate(item.date_answer) : ''}}</td>
                    <td>
                     
                        <button @click="approveResponse(item)" :disabled="item.state==='approve' && loading" v-if="currentUser && currentUser.role_id ===2" :class="{'btn btn-small btn-secondary':item.state==='in_approval' , 
                        'btn btn-small btn-light':item.state==='approve' }" >
                            Confirm
                        </button>
                    </td>
               </tr> 
        </tbody>
      </table>
    </div>
  </div>
</template>

