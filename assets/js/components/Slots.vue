<script>

export default {
  props: ['date'],
  computed: {
    slots () {
      return this.$store.getters.slots(this.date)
    }
  },
  methods: {
    bookSlot (id) {
      alert('@TODO trigger websocket update')
    }
  }
}

</script>

<template>
  <div>
    <h2>Slots for {{ date }}</h2>

    <button v-for="slot in slots"
            v-if="!slot.is_booked"
            @click="bookSlot(slot.id)"
            class="btn btn-default">
      {{ slot.time }}
    </button>

    <router-link to="/" class="btn btn-default">
      Back to schedule
    </router-link>
  </div>
</template>
