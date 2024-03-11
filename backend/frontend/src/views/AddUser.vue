<script setup>
import { ADD_USER, GET_ROLES } from "../store/types";
import store from '../store'
import { onMounted, ref } from 'vue';
import router from '../routes'

const role_id = ref('')
const firstname = ref('')
const lastname = ref('')
const email = ref('')
const password = ref('')
const userError = ref('')
const loading = ref(false)
const roles = ref([])

onMounted(async() => {
     roles.value = await store.dispatch(GET_ROLES);
})

function registerUser() {
      loading.value = true;
      const data = {
        role_id: role_id.value,
        firstname: firstname.value,
        lastname: lastname.value,
        email: email.value,
        password: password.value
      }
      
        store
        .dispatch(ADD_USER, data)
        .then((data) => {
          loading.value = false;
          if (data.status === "success") {
            router.push("/admin/dashboard/users");
          }
        })
        .catch((data) => {
          loading.value = false;
          if (data === "error") {
            userError.value = store.state.user.message;
          }
        });
    }

</script>

<template>
  <form class="m-10 p-5">
    <div class="mb-4">
      <h3 class="text-dark">ADD USER</h3>
    </div>

    <div class="mb-3">
      <p class="alert alert-danger" v-show="userError">{{ userError }}</p>
    </div>

    <div class="mb-3">
      <select class="form-control" id="#role" v-model="role_id">
        <option for="role" value="" :disabled="true">
          Select Role
        </option>
        <option for="role"  v-for="role in roles" :key="role.id" :value="role.id">
          {{ role.title }}
        </option>
      </select>
    </div>
    <div class="mb-3">
      <input
        type="text"
        v-model="firstname"
        class="form-control"
        id="firstnameInput"
        placeholder="FirstName"
      />
    </div>

      <div class="mb-3">
      <input
        type="text"
        v-model="lastname"
        class="form-control"
        id="lastnameInput"
        placeholder="LaststName"
      />
    </div>

      <div class="mb-3">
      <input
        type="email"
        v-model="email"
        class="form-control"
        id="emailInput"
        placeholder="Email"
      />
    </div>

      <div class="mb-3">
      <input
        type="password"
        v-model="password"
        class="form-control"
        id="PasswordInput"
        placeholder="Password"
      />
    </div>

    <div class="mb-3">
      <button
        :disabled="loading"
        @click.prevent="registerUser"
        :class="{'btn btn-lg btn-dark':!loading,'btn btn-lg btn-danger':loading}"
        type="button"
      >
        Save
      </button>
    </div>
  </form>
</template>
