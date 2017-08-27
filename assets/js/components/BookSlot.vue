<script>

export default {
  props: ['slot_id'],
  data () {
    return {
      showForm: false,
      email: ''
    }
  },
  computed: {
    isValidBooking () {
      return !!this.email.length && this.$refs.email.checkValidity()
    }
  },
  methods: {
    showBookingForm () {
      this.showForm = true
    },
    hideBookingForm () {
      this.showForm = false
      this.email = ''
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
          <input type="email"
                 class="form-control"
                 placeholder="Enter your email"
                 autofocus
                 required
                 v-model="email"
                 ref="email">

          <button type="button"
                  class="btn btn-success"
                  @click="bookSlot"
                  :disabled="!isValidBooking">Book</button>

          <button type="button"
                  class="btn btn-default"
                  @click="hideBookingForm">Cancel</button>

        </div>
      </div>
      <small class="text-muted">For confirmation only. Your email won't be shared or used for any other purpose.</small>
    </div>
    <button v-else type="button" name="button" class="btn btn-info btn-sm" @click="showBookingForm">
      <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> Request this time
    </button>
  </div>
</template>
