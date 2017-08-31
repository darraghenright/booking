<script>

export default {
  props: ['currentSlot'],
  data () {
    return {
      showForm: false,
      email: ''
    }
  },
  computed: {
    availableSeats () {
      return this.currentSlot.seats
        .filter(seat => !seat.is_booked).length
    },
    isValidBooking () {
      return !!this.email.length
          && this.currentSlot.seats.filter(seat => !!seat.name).length
          && this.$refs.email.checkValidity()
    }
  },
  methods: {
    showBookingForm () {
      this.showForm = true
      this.lockSlot(this.currentSlot.id)
    },
    hideBookingForm () {
      this.showForm = false
      this.email = ''
      this.unlockSlot()
    },
    lockSlot (id) {
      this.$store.commit('lockSlot', id)
      this.$store.dispatch('lockSlot', {
        slot_id: id
      })
    },
    unlockSlot () {
      this.$store.commit('unlockSlot')
      this.$store.dispatch('unlockSlot', {
        slot_id: this.currentSlot.id
      })
    },
    bookSlot () {
      let slot = this.currentSlot;

      slot.seats = slot.seats
        .map(seat => {
          if (!!seat.name) {
            seat.is_booked = true
            if (!seat.email) {
              seat.email = this.email
            }
          }
          return seat
        })

      slot.is_booked = (slot.seats.filter(seat => seat.is_booked).length === 3)

      console.log('slot booked!', slot)
      this.$store.dispatch('bookSlot', {
        slot: slot
      })
      this.$store.commit('unlockSlot')
      this.showForm = false
      this.email = ''
      window.alert(`Thanks ${this.email}! You've been booked`)
    }
  }
}

</script>

<template>
  <div>
    <div v-if="showForm" class="col-xs-12">
      <h4>Book this Time</h4>
      <p>Your email is required to confirm your booking. It will not be shared or used for any other purpose.</p>
      <div class="form-group">
        <label for="email" class="sr-only">Email</label>
        <input type="email"
               class="form-control"
               placeholder="Enter your email"
               required
               v-model="email"
               ref="email">
      </div>
      <p>You may book up to {{ availableSeats }} seats for this slot. Please enter a name for each attendee.</p>
      <div class="form-group" v-for="seat in currentSlot.seats" v-if="!seat.is_booked">
        <label for="email" class="sr-only">Email</label>
        <input type="text"
               class="form-control"
               placeholder="Enter a name"
               v-model="seat.name">
      </div>
      <div class="form-group">
        <button type="button"
                class="btn btn-success"
                @click="bookSlot"
                :disabled="!isValidBooking">Book</button>

        <button type="button"
                class="btn btn-default"
                @click="hideBookingForm">Cancel</button>
      </div>
    </div>
    <div class="col-xs-9" v-else>
      <div class="pull-right">
        <button type="button" name="button" class="btn btn-info btn-sm" @click="showBookingForm">
          <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> Request this time
        </button>
      </div>
    </div>
  </div>
</template>
