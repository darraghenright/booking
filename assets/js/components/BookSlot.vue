<script>

export default {
  props: ['slot_id'],
  data () {
    return {
      showForm: false,
      email: null
    }
  },
  methods: {
    startBooking () {
      this.showForm = true
    },
    cancel () {
      this.showForm = false
      this.email = null
    },
    bookSlot () {
      this.$store.dispatch('bookSlot', {
        slot_id: this.slot_id,
        email: this.email
      })
      window.alert(`Thanks ${this.email}! You've been booked`)
    }
  }
}

</script>

<template>
  <div>
    <div v-if="showForm" class="form-inline">
      <div class="form-inline">
        <div class="form-group">
          <label for="email" class="sr-only">Email</label>
          <input type="email" class="form-control" placeholder="Enter your email" v-model="email" autofocus>
        </div>
        <button type="button" @click="bookSlot" class="btn btn-success" :disabled="!email">
          Book
        </button>
        <button type="button" @click="cancel" class="btn btn-default">
          Cancel
        </button>
      </div>
      <small class="text-muted">For confirmation only. Your email won't be shared or used for any other purpose.</small>
    </div>
    <button v-else type="button" name="button" class="btn btn-info btn-sm" @click="startBooking">
      <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> Request this time
    </button>
  </div>
</template>
