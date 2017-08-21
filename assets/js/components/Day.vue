<script>

export default {
  props: ['day'],
  methods: {
    route: ({date}) => ({ name: 'slots',  params: { date: date } })
  }
}

</script>

<template>

  <div>
    <router-link :to="route(day)">
      {{ day.date }}
    </router-link>
  </div>

</template>
