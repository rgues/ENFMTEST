
<script setup>
import { LOGOUT_USER } from '../store/types'
import store from '../store'
import router from '../routes'

function logout() {
    store.dispatch(LOGOUT_USER).then(data => {
        if(data === 'success') {
            router.push('/auth/login')
        }
    }).catch(data => {
        if(data === 'error') {
            alert('Failed to log out.')
        }
    });
}

function getUsername() {
    return store.state.user && store.state.user.loginData && store.state.user.loginData.user ? 
    store.state.user.loginData.user.firstname + ' ' + store.state.user.loginData.user.lastname : '';
}
</script>

<template>
<nav class="navbar navbar-expand navbar-light navbar-bg">
    <a class="sidebar-toggle d-flex">
        <i class="hamburger align-self-center"></i>
    </a>

    <form class="d-none d-sm-inline-block">
        <div class="input-group input-group-navbar">
            <input type="text" class="form-control" placeholder="Search…" aria-label="Search" />
            <button class="btn" type="button">
                <i class="align-middle" data-feather="search"></i>
            </button>
        </div>
    </form>

    <div class="navbar-collapse collapse">
        <ul class="navbar-nav navbar-align">
        
            <li class="nav-item dropdown">
                <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
                    <i class="align-middle" data-feather="settings"></i>
                </a>

                <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
                    <img
                        src="../assets/images/avatar-male.png"
                        class="avatar img-fluid rounded me-1"
                        alt="Charles Hall"
                    />
                    <span class="text-dark">{{getUsername()}}</span>
                </a>
                <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="user"></i> Profile</a>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#" @click="logout">Log out</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
  
</template>

