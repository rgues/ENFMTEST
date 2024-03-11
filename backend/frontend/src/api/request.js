import { get, post, put } from './index';


// Get all categories
export  async function getCategories () {
    return get(`api/categories`)
            .then(response =>  response.data)
            .catch({})
}

// Save a request
export  async function saveRequest (data) {
    return post(`api/request`, data)
            .then(response =>  response.data)
            .catch({})
}

// Customer response
export  async function getResponses (requestId) {
    return get(`api/request/${requestId}`)
            .then(response =>  response.data)
            .catch({})
}


// Get all Request // limit = 10, start = 0, order = 'updated_at'
export  async function getRequest () {
    return get(`api/request`)
            .then(response =>  response.data)
            .catch({})
}

/*================ ASSIGNATION ====================*/

// Assign a request
export  async function assignRequest (data) {
    return post(`api/assignation`, data)
            .then(response =>  response.data)
            .catch({})
}


// Assignation detail
export  async function getAssignation (assignationId) {
    return get(`api/assignation/${assignationId}`)
            .then(response =>  response.data)
            .catch({})
}


// Get all Assignation 
export  async function getAssignations () {
    return get(`api/assignation`)
            .then(response =>  response.data)
            .catch({})
}


/*================ ANSWERS ====================*/

// Answer a request
export  async function answerRequest (data) {
    return post(`api/answer`, data)
            .then(response =>  response.data)
            .catch({})
}


// Update answer state
export  async function updateAnswer (data, answerId) {
    return put(`api/answer/${answerId}`, data)
            .then(response =>  response.data)
            .catch({})
}

// Get  Answer Detail
export  async function getAnswer (answerId) {
    return get(`api/answer/${answerId}`)
            .then(response =>  response.data)
            .catch({})
}


// Get all answers
export  async function getAnswers () {
    return get(`api/answer`)
            .then(response =>  response.data)
            .catch({})
}
