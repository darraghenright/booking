<script media="screen">

export default {
  mounted () {
    this.$store.dispatch('updateDays')
  }
}

</script>

<template>
  <router-view></router-view>
</template>

<style>

.table td {
  width: 50%;
}
</style>
