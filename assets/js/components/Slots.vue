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
    <h2>Available Slots for {{ humanDate }}</h2>
    <router-link to="/" class="btn btn-default">
      Back to schedule
    </router-link>
    <table class="table table-hover">
      <tbody>
        <tr v-for="slot in slots">
          <td>{{ humanTime(slot) }}</td>
          <td>
            <book-slot v-if="!slot.is_booked" v-bind:slot_id="slot.id"></book-slot>
            <span v-else class="text-muted">Booked</span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
