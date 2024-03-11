<script setup>
import SidebarComponent from '../components/Sidebar.vue'
import NavbarComponent from '../components/Navbar.vue'
import './layout.css'
</script>

<template>

<div class="wrapper">
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet" />

    <SidebarComponent />

    <div class="main">

        <NavbarComponent />

        <main class="content">
            <div class="container-fluid p-0">
                <div class="row mb-2 mb-xl-3">
                    <slot />
                </div>
            </div>
        </main>
    </div>
</div>
    
</template>
