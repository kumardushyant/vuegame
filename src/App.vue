<template>
  <div id="app">
    <Mainpage />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import Mainpage from './components/Mainpage.vue';

@Component({
  components: {
    Mainpage
  }
})
export default class App extends Vue {

}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Open+Sans&display=swap');

#app {
  font-family: "Open Sans";
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
