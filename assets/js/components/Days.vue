<script>

import moment from 'moment'

export default {
  computed: {
    days () {
      return this.$store.getters.days;
    }
  },
  methods: {
    humanDate: ({date}) => moment(date).format('dddd Do'),
    route: ({date}) => ({ name: 'slots',  params: { date: date } })
  }
}

</script>

<template>
  <div>
    <h2>Showing from the 7th to 30th September</h2>
    <p class="lead">Choose a date to view available times and make a booking</p>
    <table class="table table-hover">
      <tbody>
        <tr v-for="day in days">
          <td>
            <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> {{ humanDate(day) }}
          </td>
          <td>
            <router-link v-if="day.has_slots" :to="route(day)" class="btn btn-success btn-sm">
              <span class="glyphicon glyphicon-time" aria-hidden="true"></span> View Times
            </router-link>
            <span v-else class="text-danger">This day is not available</span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
