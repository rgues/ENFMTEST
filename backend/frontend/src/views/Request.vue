
<script setup>
import { format } from 'date-fns';
import { GET_REQUESTS , GET_CATEGORIES, GET_USERS} from '../store/types';
import { onMounted, ref } from 'vue';
import store from '../store'
import router from '../routes'

  const requests = ref([])
  const categories = ref([])
  const users = ref([]);
  const currentUser = ref(null);

  onMounted(async () => { 
      requests.value = await store.dispatch(GET_REQUESTS);
      categories.value = await store.dispatch(GET_CATEGORIES);
      users.value = await store.dispatch(GET_USERS);
      currentUser.value = store.state.user.loginData.user
  })

  function categoryName(id) {
    return id ? categories.value.filter(item => item.id === id)
                           .map(item=>item ? item.name : '')[0] : '';
  }
  
  function userName(id) {
    return id ? users.value.filter(item => item.id === id)
                     .map(item=>item ? item.firstname + ' ' + item.lastname : '')[0] : '';
  }
  
  function responseRequest(item) {
    router.push(`/admin/dashboard/requestResponses/${item.id}`);
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
            <th scope="col">Sender</th>
            <th scope="col">Date</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
           <tr class="table-light" v-for="item in requests" :key="item.id" >
                    <td>
                      <span class="fw-bold" >{{item.title}}</span>
                    </td>
                    <td>{{categoryName(item.category_id) }}</td>
                    <td>{{item.description}}</td>
                    <td>
                      <span :class="{'badge bg-danger':item.status==='proccesing', 'badge bg-success':item.status==='done' }">
                        {{item.status}}
                      </span> 
                      </td>
                    <td>{{ currentUser && currentUser.id === item.user_id ? currentUser.firstname + ' '  + currentUser.lastname :  userName(item.user_id) }}</td>
                    
                    <td>{{item.date_request ? formatDate(item.date_request) : ''}}</td>
                    <td>
                        <button @click="responseRequest(item)" :disabled="item.status==='proccesing'" :class="{ 'btn btn-small btn-light':item.status==='proccesing' , 
                        'btn btn-small btn-secondary':item.status==='done' }" >
                            Responses
                        </button>
                    </td>
               </tr> 
        </tbody>
      </table>
    </div>
  </div>
</template>

