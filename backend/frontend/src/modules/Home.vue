<script setup>
import AuthLayout from "../layouts/Auth.vue"
import {LOGIN_USER} from '../store/types'
import { ref } from 'vue';
import store  from '../store'
import router from '../routes'

// Form Data
const email = ref('')
const password = ref('')
const loginError = ref('')
const loading = ref(false)

// Login function
 function login()  {
          loading.value = true;
         const data = {
           email : email.value,
           password : password.value
         }
         store.dispatch(LOGIN_USER,data).then(data => {
              loading.value = false;
              if(data === 'success') {
                router.push('/admin/dashboard');
              }
         }).catch(data => {
            loading.value = false;
           if(data === 'error') {
              loginError.value = store.state.user.message;
            } 
         })
}

</script>
<template>
  <AuthLayout>
    <div class="login-container d-sm-block p-5 mt-5 mt-sm-2">

      <form>
  
      <div class="mb-4">
        <h3 class="text-light">AUTHENTICATION</h3>
      </div>

      <div class="mb-3">
        <p class="alert alert-danger" v-show="loginError" >{{loginError}}</p>
      </div>

      <div class="mb-3">
        <input
         type="email"
          v-model="email"
          class="form-control"
          id="emailInput"
          placeholder="xyz@test.com"
        />
      </div>
      <div class="mb-3">
        <input
          type="password"
          v-model="password"
          class="form-control"
          id="passwordInput"
          placeholder="Password"
        />
      </div>

      <div class="mb-3">
        <button
         :disabled="loading"
          @click.prevent="login"
          :class="{'btn btn-lg btn-primary':!loading,'btn btn-lg btn-danger':loading}"
          type="button"
        >
          Login
        </button>
      </div>
       </form>
    </div>
  </AuthLayout>
</template>

<style>
.login-container {
  border-radius: 1rem;
  border: solid 1px #222;
  width: 40%;
  margin: auto;
  background: var(--bs-dark);
  color: #fff;
}

@media (max-width: 645px) {
  .login-container {
    width: 100%;
  }
}
</style>