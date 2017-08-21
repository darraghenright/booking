<script>

export default {
  props: ['day']
}

</script>

<template>
  <button class="btn btn-default" v-bind:disabled="!day.has_slots">
    {{ day.date }}
  </button>
</template>
