import 'phoenix_html'
// import socket from './socket'

import Vue       from 'vue'
import VueRouter from 'vue-router'
import Booking   from './components/Booking.vue'
import Schedule  from './components/Schedule.vue'
import Slots     from './components/Slots.vue'

Vue.use(VueRouter)

const router = new VueRouter({
  routes: [
    {
      path: '/slots/:date',
      name: 'slots',
      props: true,
      component: Slots
    },
    {
      path: '/',
      component: Schedule
    }
  ]
})

new Vue({
  el: '#app',
  render: h => h(Booking),
  router
});
