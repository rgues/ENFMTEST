import axios from 'axios'
import store from '../store';

function call(method,url, data) {

 let header  = {
        method: `${method}`,
        url: `${process.env.VUE_APP_BACKEND_URL}/${url}`
}

if (data){
    header['data'] = data;
 }
   
 if (store.state.user.token) {
     header['headers'] =   {
        "Access-Control-Allow-Origin" : "*",
        "Content-type": "Application/json",
        "Authorization": `Bearer ${store.state.user.token}`
    } 
 } 

  return  axios(header)
}

export function get (url) {
    return call('get',url)
}

export function post (url, data) {
    return call('post',url, data)
}

export function put (url, data) {
    return call('put',url, data)
}

export function deleteRequest (url, data) {
    return call('delete',url, data)
}

