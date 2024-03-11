import { createStore } from 'vuex';
import { requestModule } from './modules/request.module';
import  { userModule } from './modules/user.module';

export default createStore({
    modules: {
       user: userModule,
       request: requestModule
    }
});