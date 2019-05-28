<template>
  <div>
    <nuxt/>
    <!-- <m-button>test</m-button> -->
  </div>
</template>

<script lang="ts">
import Vue from 'vue'
import MButton from 'material-components-vue/dist/button'

Vue.use(MButton)

export default Vue.extend({
  components: {
    // MButton
  }
})
</script>
