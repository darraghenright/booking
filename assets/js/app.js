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




const channel = socket.channel('schedule', {});

const websocketSync = store => {
  channel.join()
    .receive('error', () => console.log('Unable to join'))
    .receive('ok', r => store.commit('update', JSON.parse(r.days)))

  store.subscribe((mutation, state) => {
    console.log('subscribe')
  })
}

const store = new Vuex.Store({
  plugins: [websocketSync],
  state: {
    days: []
  },
  actions: {
    bookSlot (commit, id) {
      channel.push('book_slot', { id: id })
    }
  },
  mutations: {
    update (state, days) {
      console.log(days)
      state.days = days
    }
  },
  getters: {
    days: (state) => state.days.map(({date, has_slots}) => ({date, has_slots})),
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
