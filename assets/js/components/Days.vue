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
    <h2>September Schedule</h2>
    <table class="table table-hover">
      <thead>
        <tr>
          <th>Date</th>
          <th>Availablility</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="day in days">
          <td>{{ humanDate(day) }}</td>
          <td>
            <router-link v-if="day.has_slots" :to="route(day)" class="btn btn-success btn-sm">
              View Slots
            </router-link>
            <span v-else class="label label-danger">Fully booked</span>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
