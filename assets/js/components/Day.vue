<script>

import moment from 'moment'

export default {
  props: ['day'],
  methods: {
    humanDate: ({date}) => moment(date).format('ddd Do MMMM'),
    route: ({date}) => ({ name: 'slots',  params: { date: date } })
  }
}

</script>

<template>
  <div v-if="day.has_slots">
    <router-link :to="route(day)">
      {{ humanDate(day) }}
    </router-link>
  </div>
  <div v-else class="text-muted">
    {{ humanDate(day) }}
    <span class="label label-danger">Fully booked</span>
  </div>
</template>
