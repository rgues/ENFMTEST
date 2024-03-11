import { get, post } from './index';

// Login user
export  async function login (data) {
    return post(`api/login`, data)
            .then(response =>  response.data)
            .catch({})
}

// Create user account
export  async function register (data) {
    return post(`api/register`, data)
            .then(response =>  response.data)
            .catch({})
}

// Log out user
export  async function logout () {
    return post(`api/logout`, {})
            .then(response =>  response.data)
            .catch({})
}

// Get user information
export  async function getUser () {
    return get(`api/user`)
            .then(response =>  response.data)
            .catch({})
}

// Get all roles
export  async function getRoles () {
    return get(`api/roles`)
            .then(response =>  response.data)
            .catch({})
}


// Get IT users  // limit = 10, start = 0, order = 'updated_at'
export  async function getUsers () {
    return get(`api/users`)
            .then(response =>  response.data)
            .catch({})
}