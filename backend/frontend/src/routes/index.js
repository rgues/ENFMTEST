import { createRouter, createWebHistory } from 'vue-router';
import { PublicRoutes } from './PublicRoutes';
import store from '../store';

const router = createRouter({
    history: createWebHistory(),
    routes: [...PublicRoutes],
});

router.beforeEach((to) => {
   
    if (to.name !== 'auth.login' &&  !store.state.user.isAuthenticated) {
        return { name: 'auth.login' }
    }
});

export default router;