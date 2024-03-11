<script setup>
import AdminComponent  from '../layouts/Admin.vue'

</script>
<template>
   <AdminComponent>
       <!-- Use this block to manage container -->
       <!--<div class="col-auto d-none d-sm-block">
        </div> -->
          <router-view></router-view>
    </AdminComponent>
</template>
