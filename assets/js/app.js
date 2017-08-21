import 'phoenix_html'
import socket from './socket'

import Vue       from 'vue'
import Vuex      from 'vuex'
import VueRouter from 'vue-router'

import Booking   from './components/Booking.vue'
import Schedule  from './components/Schedule.vue'
import Slots     from './components/Slots.vue'

Vue.use(Vuex)
Vue.use(VueRouter)


// WIP

const channel = socket.channel('schedule', {});

channel.join()
  .receive('error', () => console.log('Unable to join'))
  .receive('ok',    () => console.log('Joined'))

channel.on('slot_booked', data => {
  console.log('slot_booked', data)
})

channel.push('book_slot', { id: 1 })

//

const websocketSync = store => {
  store.subscribe((mutation, state) => {
    // @TODO
  })
}

const store = new Vuex.Store({
  plugins: [websocketSync],
  state: {
    days: [
      {
        id: 1,
        date: '2017-09-07',
        has_slots: true,
        slots: [
          { id: 1, time: '10:00', is_booked: true },
          { id: 2, time: '10:20', is_booked: false },
          { id: 3, time: '10:40', is_booked: false }
        ]
      },
      {
        id: 2,
        date: '2017-09-08',
        has_slots: false,
        slots: [
          { id: 4, time: '10:00', is_booked: true },
          { id: 5, time: '10:20', is_booked: true },
          { id: 6, time: '10:40', is_booked: false }
        ]
      }
    ]
  },
  getters: {
    days:  (state) => state.days.map(({date, has_slots}) => ({date, has_slots})),
    slots: (state) => (date) => {
      for (let day of state.days) {
        if (date === day.date) {
          return day.slots
        }
      }
    },
  }
})

const router = new VueRouter({
  // mode: 'history',
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

const app = new Vue({
  el: '#app',
  render: h => h(Booking),
  router,
  store
});
