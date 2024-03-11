<script setup>
import { onMounted, ref, watchEffect } from "vue";
import { ADD_ASSIGNATION,GET_ASSIGNATIONS, GET_USERS, GET_REQUESTS } from "../store/types"
import store from '../store'
import router from '../routes'
import { useRoute } from 'vue-router'

     const route = useRoute()
     const user_id = ref('')
     const comment = ref('')
     const request_id = ref('')
     const assigner = ref('')
     const assignError = ref('')
     const users = ref([])
     const requests = ref([]) 
     const assignations = ref([])
     const loading = ref(false)
     const reassign = ref(false)

    onMounted(async () =>{

      assignations.value = await store.dispatch(GET_ASSIGNATIONS);
      users.value = await store.dispatch(GET_USERS);
      requests.value = await store.dispatch(GET_REQUESTS);
    
     if (users.value &&  users.value.length) {
         users.value = users.value.filter(item => item.role_id === 3);
     }

     if (requests.value &&  requests.value.length) {
        requests.value = requests.value.filter(item => item.status === 'proccesing');
     }

     if (route.params.id || route.params.user) {
        request_id.value = route.params.id;
        assigner.value = route.params.user;
        reassign.value = true;
        users.value = users.value.filter(item => item.id !== parseInt(assigner.value));
     }
  })

     watchEffect(
      () => (route.params.id, route.params.user),
      async (newId1,newId2) => {

        request_id.value = newId1;
        assigner.value = newId2;
        users.value = users.value.filter(item => item.id !== parseInt(assigner.value));
      }
    )


    function saveAssignRequest() {
      
      loading.value = true;
      const data = {
        request_id: request_id.value,
        user_id: user_id.value,
        comment: comment.value
      };
        store
        .dispatch(ADD_ASSIGNATION, data)
        .then((data) => {
          loading.value = false;
          if (data.status === "success") {
             router.push("/admin/dashboard/assignations");
          }
        })
        .catch((data) => {
          loading.value = false;
          if (data === "error") {
            assignError.value = store.state.request.message;
          }
        });
    }

     function updateRequest() {

      // Get user assignations
      if (assignations.value &&  assignations.value.length) {
         assignations.value = assignations.value.filter(item => parseInt(item.user_id) === parseInt(user_id.value));
      }
 
     // remove request that is already assign to the user
     if (assignations.value &&  assignations.value.length) {
         assignations.value.map((assign) => {
                requests.value = requests.value.filter(item => parseInt(assign.request_id) !== parseInt(item.id));
         });
     }
  }
</script>


<template>
  <form class="m-10 p-5">
    <div class="mb-4">
      <h3 class="text-dark">ASSIGN REQUEST</h3>
    </div>

    <div class="mb-3">
      <p class="alert alert-danger" v-show="assignError">{{ assignError }}</p>
    </div>

    <div class="mb-3">
      <select class="form-control" id="#it" @change="updateRequest" v-model="user_id">
        <option for="it" value="" :disabled="true">
          Select IT
        </option>
        <option for="it" v-for="user in users" :key="user.id" :value="user.id">
          {{ user.firstname }}  {{ user.lastname }}
        </option>
      </select>
    </div>

    <div class="mb-3" v-if="user_id && !reassign">
      <select class="form-control" id="#request"   v-model="request_id">
        <option for="request" value="" :disabled="true">
          Select Request
        </option>
        <option for="request" v-for="req in requests" :key="req.id" :value="req.id">
          {{ req.description }} 
        </option>
      </select>
    </div>

    <div class="mb-3">
      <textarea
        rows="3"
        v-model="comment"
        class="form-control"
        id="passwordInput"
        placeholder="Enter a comment"
      />
    </div>

    <div class="mb-3">
      <button
        :disabled="loading"
        @click.prevent="saveAssignRequest"
        :class="{'btn btn-lg btn-dark':!loading,'btn btn-lg btn-danger':loading}"
        type="button"
      >
        Save
      </button>
    </div>
  </form>
</template>

