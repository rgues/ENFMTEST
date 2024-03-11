
<script setup>
   import { ref } from 'vue';
   const  msg = ref('ENFM CUSTOMER SUPPORT')
</script>

<template>
 <div class="header">
    <h1>{{ msg }}</h1>
</div>
</template>

<style>
.header {
        display: flex;
        width: 100%;
        flex-direction: row;
        background: var(--bs-dark);
}

.header h1{ 
        text-align: center;
        color: #fff;
        margin: auto;
        padding: 1rem;
}
</style>