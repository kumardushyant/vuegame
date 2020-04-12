<template>
    <div>
        <Header :you=youVal :monster=monsVal />
        <HeadBtn :showBtns=isBtn @attack="attack" @specattack="specattack" @heal="heal" @startNew="startNew" @giveUp="giveUp" />
        <ActionWindow ref="actionWindow" :style="{ marginTop: '10px' }" />
    </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import Header from './Header.vue';
import HeadBtn from './HeadBtn.vue';
import ActionWindow from './ActionWindow.vue';

@Component({
  components: {
    Header,
    HeadBtn,
    ActionWindow
  }
})
export default class Mainpage extends Vue {
  isBtn = true;
  youVal = 100;
  monsVal = 100;

  attack (): void {
    const actionWin = this.$refs.actionWindow as ActionWindow;
    let hitVal = Math.floor(Math.random()*10);
    this.monsVal -= hitVal;
    actionWin.addMessage("You have attacked Monster. Monstor lost "+hitVal+" health points.", true);
    if(this.monsVal > 0) {
      hitVal = Math.floor(Math.random()*10);
      this.youVal -= hitVal;
      actionWin.addMessage("Monster attacked you. You have lost "+hitVal+" health points.", false);  
    }
  }
  specattack (): void {
    const actionWin = this.$refs.actionWindow as ActionWindow;
    let hitVal = Math.floor(Math.random()*20);
    this.monsVal -= hitVal;
    actionWin.addMessage("You have attacked Monster. Monstor lost "+hitVal+" health points.", true);
    if(this.monsVal > 0) {
      hitVal = Math.floor(Math.random()*10);
      this.youVal -= hitVal;
      actionWin.addMessage("Monster attacked you. You have lost "+hitVal+" health points.", false);  
    }
  }
  heal (): void {
    if(this.youVal >= 100) {
      this.youVal = 100
      return;
    }
    const actionWin = this.$refs.actionWindow as ActionWindow;
    const healVal = Math.floor(Math.random()*20);
    this.youVal += healVal;
    if(this.youVal > 100)
      this.youVal = 100
    actionWin.addMessage("You have healed with "+healVal+" health points.", true);
  }
  startNew (): void { 
    const actionWin = this.$refs.actionWindow as ActionWindow;
    actionWin.cleanMessages();
    this.youVal = 100;
    this.monsVal = 100;
  }
  giveUp (): void {
    console.log("giveUp");
  }

}
</script>

<style scoped>
</style>