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
      this.$store.dispatch('bookSlot', {slot_id: id, email: 'dev@merchkitty.com'})
    }
  }
}

</script>

<template>
  <div>
    <h2>Slots for {{ date }}</h2>
    <router-link to="/" class="btn btn-default">
      Back to schedule
    </router-link>
    <table class="table table-hover">
      <tbody>
        <tr v-if="!slot.is_booked" v-for="slot in slots">
          <td>{{ slot.time }}</td>
          <td>
            <button @click="bookSlot(slot.id)" class="btn btn-success btn-sm">
              Request booking
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
