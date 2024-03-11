import {TOKEN_USER, ISAUTHENTICATE, LOGIN_DATA,USER_REQUEST_FAILURE} from '../types';
import { login, logout, getUsers, getRoles, register } from '../../api/user';

export const userModule = {
    state () {
        return {
            isAuthenticated: false,
            token: '',
            loginData:{ },
            message:''
        }
        
    },
    mutations: {
        authenticate(state, data) {
            state.isAuthenticated = data;
        },
        updateLoginInput (state,inputName, value) {
            switch (inputName) {
                case 'email' :
                    state.loginData.email = value
                    break;
                case 'password':
                    state.loginData.password = value
                    break;
                default:
                    break;
            }
            
        },

        setToken(state, data) {
            state.token = data
        },

        setLoginData(state, data) {
            state.loginData = data
        },
        userRequestFailure(state, data) {
            state.message = data
        }

    },
    actions: {
       async loginUser ({ commit  }, data) {
            return new Promise((resolve, reject) => {
                login(data).then(response => {
                    commit(TOKEN_USER, response.data.token)
                    commit(ISAUTHENTICATE, true)
                    commit(LOGIN_DATA, response.data)
                    setTimeout(() => {
                        resolve('success')
                    },300);
                }).catch(err => {
                  
                    if (err.status === 401) {
                        commit(USER_REQUEST_FAILURE, 'Credentials is incorrect.')
                    } else {
                        commit(USER_REQUEST_FAILURE, 'Failed to login user.')
                    }
                    setTimeout(() => {
                        reject('error')
                    },300);

                })
            })
      
        },

        async registerUser ({ commit }, data) {
            return new Promise((resolve, reject) => {
                register(data).then((response) => {
                    setTimeout(() => {
                        resolve(response)
                    },300);
                }).catch(err => {
                  
                    if (err.status === 400) {
                        commit(USER_REQUEST_FAILURE, err.message)
                    } else {
                        commit(USER_REQUEST_FAILURE, 'Failed to login user.')
                    }
                    setTimeout(() => {
                        reject('error')
                    },300);

                })
            })
      
        },
        async logoutUser ({commit}) {

            return new Promise((resolve, reject) => {
                logout().then(() => {
                    
                    setTimeout(()=> {
                        commit(TOKEN_USER, '')
                        commit(ISAUTHENTICATE, false)
                        commit(LOGIN_DATA, {})
                        resolve('success')
                    },500);

                }).catch(() => {
                    reject('error')
                })
            })
        },

        async getUsersList() {
            return getUsers().then(response => response.data).catch(() => [])
        },

        async getRolesList() {
            return getRoles().then(response => response.data).catch(() => [])
        }

    },

    getters : {
     
    }
};