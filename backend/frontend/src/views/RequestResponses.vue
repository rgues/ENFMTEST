<script setup>
import {
  GET_REQUESTS,
  GET_ASSIGNATIONS,
  GET_CATEGORIES,
  GET_REQUEST_ANSWERS,
  GET_USERS,
} from "../store/types";
import { format } from "date-fns";
import store from "../store";
import { onMounted, ref, watchEffect } from "vue";
import { useRoute } from 'vue-router'

const route = useRoute()
const categories = ref([]);
const users = ref([]);
const requests = ref([]);
const assignations = ref([]);
const answers = ref([]);
const currentUser = ref(null);

onMounted(async () => {
  categories.value = await store.dispatch(GET_CATEGORIES);
  users.value = await store.dispatch(GET_USERS);
  requests.value = await store.dispatch(GET_REQUESTS);
  assignations.value = await store.dispatch(GET_ASSIGNATIONS);
  answers.value = await store.dispatch(GET_REQUEST_ANSWERS, route.params.id);
  currentUser.value = store.state.user.loginData.user;
});

watchEffect(() => route.params.id,
  async newId => {
  answers.value = await store.dispatch(GET_REQUEST_ANSWERS, newId);
})

function categoryName(id) {
  return id
    ? categories.value
        .filter((item) => parseInt(item.id) === parseInt(id))
        .map((item) => (item ? item.name : ""))[0]
    : "";
}

function request(id) {
  return id
    ? requests.value.find((item) => parseInt(item.id) === parseInt(id))
    : null;
}

function assignation(id) {
  return id
    ? assignations.value.find((item) => parseInt(item.id) === parseInt(id))
    : null;
}

function formatDate(date) {
  return format(date, "yyyy-MM-dd");
}
</script>


<template>
  <div class="admin-container mt-5">
    <div className="admin_table">
      <table class="table">
        <thead>
          <tr class="table-secondary">
            <th scope="col">Ticket</th>
            <th scope="col">Category</th>
            <th scope="col">Description</th>
            <th scope="col">Status</th>
            <th scope="col">Comment</th>
            <th scope="col">Response</th>
            <th scope="col">IT</th>
            <th scope="col">Date</th>
          </tr>
        </thead>
        <tbody>
          <tr class="table-light" v-for="item in answers" :key="item.id">
            <td>
              {{
                assignation(item.assignation_id)
                  ? request(assignation(item.assignation_id).request_id).title
                  : ""
              }}
            </td>
            <td>
              <span class="fw-bold">
                {{
                  assignation(item.assignation_id)
                    ? categoryName(
                        request(assignation(item.assignation_id).request_id)
                          .category_id
                      )
                    : ""
                }}
              </span>
            </td>

            <td>
              {{
                assignation(item.assignation_id)
                  ? request(assignation(item.assignation_id).request_id)
                      .description
                  : ""
              }}
            </td>
            <td>
              <span
                :class="{
                  'badge bg-danger': item.state === 'in_approval',
                  'badge bg-success': item.state === 'approve',
                }"
              >
                {{ item.state }}
              </span>
            </td>
            <td>
              <span class="fs-6">
                {{
                  assignation(item.assignation_id)
                    ? assignation(item.assignation_id).comment
                    : ""
                }}
              </span>
            </td>

            <td>{{ item.description ? item.description : "" }}</td>

            <td>{{ item.name ? item.name : "" }}</td>

            <td>{{ item.date_answer ? formatDate(item.date_answer) : "" }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>
