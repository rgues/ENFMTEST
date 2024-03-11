import RequestComponent from '../views/Request.vue';

export const PublicRoutes = [
    {
        path: '/',
        name: 'home',
        redirect: '/auth/login',
    },
    {
        path: '/auth/login',
        name: 'auth.login',
        component: () => import('../modules/Home.vue')
    },
    {
        path: '/admin/dashboard',
        component: () => import('../modules/Dashboard.vue'),
        children: [
            {
                path: '',
                name: 'admin.requests',
                component: RequestComponent
            },
            {
                path: 'users',
                name: 'admin.users',
                component: () => import('../views/Users.vue')
            },
            {
                path: 'assignations',
                name: 'admin.assignations',
                component: () => import('../views/Assignation.vue')
            },
            {
                path: 'answer',
                name: 'admin.answer',
                component: () => import('../views/Answer.vue')
            }
            ,
            {
                path: 'sentRequest',
                name: 'admin.sentRequest',
                component: () => import('../views/SentRequest.vue')
            }
            ,
            {
                path: 'sentAnswer/:id',
                name: 'admin.sentAnswer',
                component: () => import('../views/SentAnswer.vue')
            }
            ,  
            {
                path: 'requestResponses/:id',
                name: 'admin.requestResponses',
                component: () => import('../views/RequestResponses.vue')
            }
            ,
            {
                path: 'addAssignation',
                name: 'admin.addAssignation',
                component: () => import('../views/AddAssignation.vue')
            }
            ,
            {
                path: 'reassign/:id/:user',
                name: 'admin.reassign',
                component: () => import('../views/AddAssignation.vue')
            }
            ,
            {
                path: 'addUser',
                name: 'admin.addUser',
                component: () => import('../views/AddUser.vue')
            }


        ]
    },
    {
        path: '/*',
        name: 'notfound',
        redirect: '/auth/login'
    },
];
