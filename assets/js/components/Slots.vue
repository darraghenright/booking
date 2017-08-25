<script>

import moment from 'moment'
import BookSlot from './BookSlot.vue'

export default {
  props: ['date'],
  components: {
    BookSlot
  },
  computed: {
    humanDate () {
      return moment(this.date).format('ddd Do MMMM')
    },
    slots () {
      return this.$store.getters.slots(this.date)
    }
  },
  methods: {
    humanTime: ({time}) => time.split(':').slice(0,2).join(':') // :P
  }
}

</script>

<template>
  <div>
    <h2>Times for {{ humanDate }}</h2>
    <router-link to="/" class="btn btn-default">
      <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> View all days
    </router-link>
    <table class="table table-hover">
      <thead>
        <tr>
          <th style="width: 50%">Time</th>
          <th>Availablity</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="slot in slots">
          <td>
            <span class="glyphicon glyphicon-time" aria-hidden="true"></span> {{ humanTime(slot) }}</td>
          <td>
            <book-slot v-if="!slot.is_booked" v-bind:slot_id="slot.id"></book-slot>
            <span v-else class="text-danger">This time is not available</span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
