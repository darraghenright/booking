<script>

import Day from './Day.vue'

export default {
  mounted () {
    this.$store.dispatch('updateDays')
  },
  components: {
    Day
  },
  computed: {
    days () {
      return this.$store.getters.days;
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
