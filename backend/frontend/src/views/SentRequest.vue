
<script setup>
import { onMounted, ref } from 'vue';
import { SENT_REQUEST, GET_CATEGORIES } from "../store/types";
import store from '../store'
import router from '../routes'

const category_id = ref("")
const  description = ref("")
const  requestError = ref("")
const  loading = ref(false)
const  categories = ref([])

  onMounted(async () => {
     categories.value = await store.dispatch(GET_CATEGORIES);
  })

    function saveRequest() {
   
      loading.value = true;
      const data = {
        category_id: category_id.value,
        description: description.value,
      };

        store
        .dispatch(SENT_REQUEST, data)
        .then((data) => {
          loading.value = false;
          if (data.status === "success") {
            router.push("/admin/dashboard");
          }
        })
        .catch((data) => {
          loading.value = false;
          if (data === "error") {
            requestError.value = store.state.request.message;
          }
        })
    }
</script>

<template>
  <form class="m-10 p-5">
    <div class="mb-4">
      <h3 class="text-dark">SENT REQUEST</h3>
    </div>

    <div class="mb-3">
      <p class="alert alert-danger" v-show="requestError">{{ requestError }}</p>
    </div>

    <div class="mb-3">
      <select class="form-control" id="#category" v-model="category_id">
        <option for="category" value="" :disabled="true">
          Select category
        </option>
        <option v-for="cat in categories" :key="cat.id" :value="cat.id">
          {{ cat.name }}
        </option>
      </select>
    </div>
    <div class="mb-3">
      <textarea
        rows="5"
        v-model="description"
        class="form-control"
        id="passwordInput"
        placeholder="Enter a complaint"
      />
    </div>

    <div class="mb-3">
      <button
        :disabled="loading"
        @click.prevent="saveRequest"
        :class="{'btn btn-lg btn-dark':!loading,'btn btn-lg btn-danger':loading}"
        type="button"
      >
        Save
      </button>
    </div>
  </form>
</template>
