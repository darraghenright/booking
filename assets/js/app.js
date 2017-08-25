import 'phoenix_html'
import socket from './socket'

import Vue       from 'vue'
import Vuex      from 'vuex'
import VueRouter from 'vue-router'

import Schedule from './components/Schedule.vue'
import Days     from './components/Days.vue'
import Slots    from './components/Slots.vue'

Vue.use(Vuex)
Vue.use(VueRouter)

const schedule = socket.channel('schedule', {});

schedule.join()
  .receive('error', () => console.log('[schedule] error'))
  .receive('ok',    () => console.log('[schedule] ok'))

const store = new Vuex.Store({
  state: {
    days: []
  },
  actions: {
    updateDays (context) {
      schedule.push('update_days')
      schedule.on('update_days', data => {
        try {
          context.commit('updateDays', JSON.parse(data.days))
        } catch (e) {
          window.alert('Error updating data!')
        }
      });
    },
    bookSlot (context, slot) {
      schedule.push('book_slot', slot)
    }
  },
  mutations: {
    updateDays (state, days) {
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
      component: Days
    }
  ]
})

const app = new Vue({
  el: '#app',
  render: h => h(Schedule),
  router,
  store
});
