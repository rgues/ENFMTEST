import { getRequest, getCategories, saveRequest, assignRequest, 
    getAssignations, getAnswers, getResponses, updateAnswer, answerRequest } from '../../api/request';
import { LIST_REQUEST, REQUEST_FAILURE, ASSIGNATIONS_LIST, LIST_ANSWERS, LIST_REQUEST_ANSWERS } from '../types';

export const requestModule = {
    state() {
        return {
            listRequest: [],
            listAssignations:[],
            listAnswers:[],
            listRequestAnswers:[],
            categories: [],
            message: ''
        }
    },
    mutations: {
        setRequest(state, data) {
            state.listRequest = data
        },
        setAssignation(state, data) {
            state.listAssignations = data
        },
        listAnswers(state, data) {
            state.listAnswers = data
        },
        listRequestAnswers(state, data) {
            state.listRequestAnswers = data
        },
        listCategories(state, data) {
            state.categories = data
        }
        ,
        setRequestFailure(state, data) {
            state.message = data
        }
    },
    actions: {
        async getRequests({ commit, state }) {
         return new Promise((resovle) => {
            getRequest().then(response => {
                    commit(LIST_REQUEST, response.data)
                    setTimeout(()=> {
                          resovle(state.listRequest);
                    },300)
               
            }).catch(() => resovle([]))

        })

        },

        async getAssignationList({ commit, state }) {
            return new Promise((resovle) => {
                getAssignations().then(response => {
                       commit(ASSIGNATIONS_LIST, response.data)
                       setTimeout(()=> {
                             resovle(state.listAssignations);
                       },300)
                  
               }).catch(() => resovle([]))
   
           })
   
           },

           async getAllAnswers({ commit, state }) {
            return new Promise((resovle) => {
                getAnswers().then(response => {
                       commit(LIST_ANSWERS, response.data)
                       setTimeout(()=> {
                             resovle(state.listAnswers);
                       },300)
                  
               }).catch(() => resovle([]))
   
           })
   
           },

           async getRequestAnswers({ commit, state }, requestId) {
            return new Promise((resovle) => {
                getResponses(requestId).then(response => {
                       commit(LIST_REQUEST_ANSWERS, response.data.answers)
                       setTimeout(()=> {
                             resovle(state.listRequestAnswers);
                       },300)
                  
               }).catch(() => resovle([]))
   
           })
   
           },

        async getCategoriesList() {
            return getCategories().then(response => response.data).catch(() => [])
         },

        async sentRequest({ commit }, data) {
            return new Promise((resolve, reject) => {
                saveRequest(data).then(response => {
                    setTimeout(() => {
                        resolve(response)
                    }, 300);
                }).catch(() => {

                    commit(REQUEST_FAILURE, 'Failed to save request.');
                    setTimeout(() => {
                        reject('error')
                    }, 300);

                })
            })

        },

        async saveAssignation({ commit }, data) {
            return new Promise((resolve, reject) => {
                assignRequest(data).then(response => {
                    setTimeout(() => {
                        resolve(response)
                    }, 300);
                }).catch(() => {

                    commit(REQUEST_FAILURE, 'Failed to add assignation.');
                    setTimeout(() => {
                        reject('error')
                    }, 300);

                })
            })

        },

        async approveAnswer({ commit }, data) {
            return new Promise((resolve, reject) => {
                updateAnswer(data, data.id).then(response => {
                    setTimeout(() => {
                        resolve(response)
                    }, 300);
                }).catch(() => {

                    commit(REQUEST_FAILURE, 'Failed. Cannot approve this answer.');
                    setTimeout(() => {
                        reject('error')
                    }, 300);

                })
            })

        },

        async sentAnswer({ commit }, data) {
            return new Promise((resolve, reject) => {
                answerRequest(data).then(response => {
                    setTimeout(() => {
                        resolve(response)
                    }, 300);
                }).catch(() => {

                    commit(REQUEST_FAILURE, 'Failed. Cannot answer this request.');
                    setTimeout(() => {
                        reject('error')
                    }, 300);

                })
            })

        }
    },

    getters: {

    }
};