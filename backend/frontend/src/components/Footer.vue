<script setup>
   import { ref } from 'vue';
   const  msg =  ref('(c)2024 ENFM All rights reserved.')
</script>

<template>
 <div class="footer">
    <h6>{{ msg }}</h6>
</div>
</template>

<style>

.footer {
        display: flex;
        width: 100%;
        flex-direction: row;
        background: var(--bs-dark);
}

.footer h6{ 
        text-align: center;
        color: #fff;
        margin: auto;
        padding: 1rem;
}

</style>