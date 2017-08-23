<script>

export default {
  props: ['day'],
  methods: {
    route: ({date}) => ({ name: 'slots',  params: { date: date } })
  }
}

</script>

<template>
  <div v-if="day.has_slots">
    <router-link :to="route(day)">
      {{ day.date }}
    </router-link>
  </div>
  <div v-else class="text-muted">
    {{ day.date }}
    <span class="label label-danger">Fully booked</span>
  </div>
</template>
