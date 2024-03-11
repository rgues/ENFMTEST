<script setup>
import { ref } from 'vue'
import store from '../store'
const appName = ref(process.env.VUE_APP_NAME)
const role = store.state.user.loginData.user.role_id
</script>

<template>
<nav id="sidebar" class="sidebar js-sidebar">
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="#">
            <span class="align-middle">{{ appName }}</span>
        </a>

        <ul class="sidebar-nav">
            
            <li class="sidebar-item ">
                <router-link :to="{ name: 'admin.requests' }" class="sidebar-link">
                    <i class="fas fa-tachometer-alt align-middle"></i>
                    <span class="align-middle">Dashboard</span>
                </router-link>
            </li>

            <li class="sidebar-item" v-if="role===2">
                <a data-bs-target="#auth" data-bs-toggle="collapse" class="sidebar-link collapsed">
                    <i class="fas fa-person align-middle"></i>
                    <span class="align-middle">Users</span>
                </a>
                <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                    <li class="sidebar-item">
                        <router-link :to="{ name: 'admin.addUser' }" class="sidebar-link" href="#">Add</router-link>
                    </li>
                    <li class="sidebar-item">
                        <router-link :to="{ name: 'admin.users' }" class="sidebar-link" href="#">List</router-link>
                    </li>
                </ul>
            </li>


            <li class="sidebar-item" v-if="role===1 || role===2">
                <a data-bs-target="#request" data-bs-toggle="collapse" class="sidebar-link collapsed">
                    <i class="fas fa-info align-middle"></i>
                    <span class="align-middle">Requests</span>
                </a>
                <ul id="request" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                    <li class="sidebar-item" v-if="role===1 || role===2">
                        <router-link :to="{ name: 'admin.sentRequest' }" class="sidebar-link" href="#">Add</router-link>
                    </li>

                    <li class="sidebar-item" v-if="role===2">
                        <router-link :to="{ name: 'admin.addAssignation' }" class="sidebar-link" href="#">Assign</router-link>
                    </li>
                    <li class="sidebar-item">
                        <router-link :to="{ name: 'admin.requests' }" class="sidebar-link" href="#">List</router-link>
                    </li>
                  
                </ul>
            </li>

            <li class="sidebar-item" v-if="role===2 || role===3">
                <router-link :to="{ name: 'admin.assignations' }" class="sidebar-link" href="#">
                    <i class="fas fa-mail-forward align-middle"></i>
                    <span class="align-middle">Assignations</span>
                </router-link>
            </li>

            <li class="sidebar-item" v-if="role===2 || role===3">
                <router-link :to="{ name: 'admin.answer' }" class="sidebar-link" href="#">
                    <i class="fas fa-mail-reply align-middle"></i>
                    <span class="align-middle">Answers</span>
                </router-link>
            </li>
        </ul>
    </div>
</nav>

</template>

