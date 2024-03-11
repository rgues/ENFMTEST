
<script setup>
import { GET_REQUESTS,GET_ASSIGNATIONS, GET_CATEGORIES, GET_USERS} from '../store/types'
import { format } from "date-fns"
import { onMounted } from 'vue'
import { ref } from 'vue'
import store from '../store'
import router from '../routes'

   const categories = ref([])
   const users = ref([])
   const requests = ref([])
   const assignations = ref([])
   const currentUser = ref(null)

 onMounted(async () => { 
       categories.value = await store.dispatch(GET_CATEGORIES);
       users.value = await store.dispatch(GET_USERS);
       requests.value = await store.dispatch(GET_REQUESTS);
       assignations.value = await store.dispatch(GET_ASSIGNATIONS);
       currentUser.value = store.state.user.loginData.user
})

       function categoryName(id) {
           return categories.value.filter(item => item.id === id)
                                  .map(item=>item ? item.name : '')[0];
        }

        function userName(id) {
           return id ?  users.value.filter(item => item.id === id)
                             .map(item=>item ? item.firstname + ' ' + item.lastname : '')[0] : '';
        }
        
        function requestDescription(id) {
           return id ? requests.value.find(item => item.id === id) : ''
        }

        function answerRequest(item) {
            router.push(`/admin/dashboard/sentAnswer/${item.id}`);
        }

       function reassignRequest(item) {
           router.push(`/admin/dashboard/reassign/${item.request_id}/${item.user_id}`);
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
            <th scope="col">Sender</th>
            <th scope="col">IT</th>
            <th scope="col">Date</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
           <tr class="table-light" v-for="item in assignations" :key="item.id" >

                    <td>
                      {{requestDescription(item.request_id) ? requestDescription(item.request_id).title : ''}}
                    </td>
                    <td>
                        <span class="fw-bold" >
                            {{requestDescription(item.request_id) ? categoryName(requestDescription(item.request_id).category_id) : '' }}
                        </span>
                    </td>
                   
                    <td>
                            {{requestDescription(item.request_id) ? requestDescription(item.request_id).description : ''}}
                    </td>
                    <td>
                      <span :class="{'badge bg-danger':item.state==='pending', 'badge bg-warning':item.state==='evaluate', 'badge bg-success':item.state==='complete' }">
                        {{item.state}}
                      </span> 
                      </td>
                    <td>
                        <span class="fs-6" >
                            {{item.comment}}
                        </span>
                    </td>
                    <td>{{userName(item.sender_id) }}</td>
                    <td>{{userName(item.user_id) }}</td>
                  
                    <td>{{ item.date_assignation ? formatDate(item.date_assignation) : ''}}</td>
                    <td>
                        <button @click="answerRequest(item)" :disabled="item.state!=='pending'" v-if="currentUser.role_id===3" :class="{'btn btn-small btn-secondary':item.state==='pending', 'btn btn-small btn-gray':item.state==='evaluate' , 
                        'btn btn-small btn-light':item.state==='complete' }"  >
                            Answer
                        </button>
                        <button @click="reassignRequest(item)" :disabled="item.state==='complete'" v-if="currentUser.role_id ===2" :class="{'btn btn-small btn-dark':item.state==='pending', 'btn btn-small btn-secondary':item.state==='evaluate' , 
                        'btn btn-small btn-light':item.state==='complete' }" >
                            Reassign
                        </button>
                    </td>
               </tr> 
        </tbody>
      </table>
    </div>
  </div>
</template>
