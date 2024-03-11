<script setup>
  import HeaderComponent from '../components/Header.vue'
  import FooterComponent from '../components/Footer.vue'
  import './layout.css'
</script>

<template>
<div>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet" />
  
   <HeaderComponent />
   
    <div class="main">
        <main class="content">
            <div class="container-fluid p-0">
                <div class="row mb-2 mb-xl-3">
                    <slot />
                </div>
            </div>
        </main>
       
    </div>
      <FooterComponent /> 
</div>
</template>



