
<script setup>
import { SENT_ANSWER } from "../store/types"

import router from '../routes'
import { onMounted, ref, watchEffect } from 'vue'
import store from '../store'
import { useRoute } from 'vue-router'

const route = useRoute()
const assignation_id = ref("")
const description = ref("")
const answerError = ref("")
const loading = ref(false)


    onMounted(() => {
      assignation_id.value = route.params.id;
    })

    // execute when request reassign 
     watchEffect(() => route.params.id,
      async newId => {
      if (newId) {
          assignation_id.value = newId;
      }
      })

  function sentAnswerRequest() {
      loading.value = true;
      const data = {
        assignation_id: assignation_id.value,
        description: description.value
      };
        store
        .dispatch(SENT_ANSWER, data)
        .then((data) => {
          loading.value = false;
          if (data.status === "success") {
            router.push("/admin/dashboard/assignations");
          }
        })
        .catch((data) => {
          loading.value = false;
          if (data === "error") {
            answerError.value = store.state.request.message;
          }
        });
    }

</script>

<template>
  <form class="m-10 p-5">
    <div class="mb-4">
      <h3 class="text-dark">ANSWER REQUEST</h3>
    </div>

    <div class="mb-3">
      <p class="alert alert-danger" v-show="answerError">{{ answerError }}</p>
    </div>

    <div class="mb-3">
      <textarea
        rows="5"
        v-model="description"
        class="form-control"
        id="passwordInput"
        placeholder="Enter a answer"
      />
    </div>

    <div class="mb-3">
      <button
        :disabled="loading"
        @click.prevent="sentAnswerRequest"
       :class="{'btn btn-lg btn-dark':!loading,'btn btn-lg btn-danger':loading}"
        type="button"
      >
        Save
      </button>
    </div>
  </form>
</template>
