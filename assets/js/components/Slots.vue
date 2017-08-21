<script>

export default {
  props: ['date']
}

</script>

<template>
  <div>
    <h2>Slots for {{ date }}</h2>
    <router-link to="/" class="btn btn-default">
      Back to schedule
    </router-link>
  </div>
</template>
