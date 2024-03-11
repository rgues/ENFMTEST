import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap";
import '@fortawesome/fontawesome-free/css/all.min.css';
import { createApp } from 'vue';
import store from './store';
import routes from './routes'
import App from './modules/App.vue';

createApp(App).use(store).use(routes).mount('#app')
