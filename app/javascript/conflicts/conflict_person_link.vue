<template>
  <router-link :to="'/people/availability/' + person.id">{{person.published_name}}</router-link>
</template>

<script>
export default {
  name: "ConflictPersonLink",
  props: {
    person: {
      required: true,
      type: Object
    }
  }
}
</script>

<style>

</style>
