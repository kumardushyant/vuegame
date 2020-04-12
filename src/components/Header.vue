<template>
  <div id="header" class="header">
    <div id="you">
      <div class="row">
        <div class="title">
          <h1>You</h1>
        </div>
      </div>
      <div class="row">
        <div class="progessContain">
          <b-progress :max="100" class="w-100" variant="success" :value="you" show-progress></b-progress>
        </div>
      </div>
    </div>
    <div id="monster">
      <div class="title row">
        <h1 class="cell">Monster</h1>
      </div>
      <div class="row">
        <div class="progessContain">
          <b-progress :max="100" class="w-100" variant="danger" :value="monster" show-progress></b-progress>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Vue, Prop } from "vue-property-decorator";
import { BootstrapVue } from 'bootstrap-vue';
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';

Vue.use(BootstrapVue);

@Component
export default class Header extends Vue {
  @Prop({default: 100}) you: number;
  @Prop({default: 100}) monster: number;
}
</script>

<style scoped>
div.header {
  display: flex;
  margin-left: 10%;
  margin-right: 10%;
}
div.row {
  text-align: center;
  justify-content: center;
}
div.progessContain {
  width: 80%;
  text-align: center;
  display: inline-flex;
}
div.cell {
  display: table-cell;
  text-align: center;
}
div.progress {
  border: 2px solid black;
  border-collapse: collapse;
  min-height: 30px;
  height: 30px;
  text-align: center;
}
div.health {
  font-weight: 800;
  margin-top: 3px;
}
div.header #you {
  width: 50%;
  display: block;
  border: none;
  margin-right: 5px;
  min-width: 50%;
  text-align: center;
}
div.header #monster {
  width: 50%;
  display: table;
  border: none;
  margin-left: 5px;
  min-width: 50%;
  text-align: center;
}
div.title {
  font-size: 1rem;
  width: 100%;
  display: inline-block;
}
</style>