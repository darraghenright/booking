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
    <h2>Times for {{ humanDate }} <router-link to="/" class="btn btn-default">
      <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> View all days
    </router-link></h2>
    <p class="lead">Choose an available time to book. This 3-channel video piece is in a custom built viewing room that accommodates a maximum of three people per 20 minute viewing. You must arrive at the gallery at least 20 minutes before your booking. Late-comers cannot be admitted.</p>
    <table class="table table-hover">
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
