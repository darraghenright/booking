<script>

import Day from './Day.vue'

export default {
  components: {
    Day
  },
  data () {
    return {
      days: [
        {
          date: '2017-09-07',
          has_slots: true,
          slots: [
            { id: 1, time: '10:00', is_booked: true },
            { id: 2, time: '10:20', is_booked: false },
            { id: 3, time: '10:40', is_booked: false }
          ]
        },
        {
          date: '2017-09-08',
          has_slots: false,
          slots: [
            { id: 4, time: '10:00', is_booked: true },
            { id: 5, time: '10:20', is_booked: true },
            { id: 6, time: '10:40', is_booked: true }
          ]
        }
      ]
    }
  }
}

</script>

<template>
  <div>
    <h2>Schedule</h2>
    <day v-for="day in days" v-bind:day="day"></day>
  </div>
</template>
