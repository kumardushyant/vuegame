<template>
    <div>
        <Header :you=youVal :monster=monsVal />
        <HeadBtn ref="btnHead" :showBtns=isBtn @attack="attack" @specattack="specattack" @heal="heal" @startNew="startNew" @giveUp="giveUp" />
        <ActionWindow ref="actionWindow" :style="{ marginTop: '10px' }" />
        <b-modal id="resultModal" ok-only>
          <p>{{ result }}</p>
        </b-modal>
    </div>
</template>

<script lang="ts">
import { Component, Vue, Watch } from 'vue-property-decorator';
import Header from './Header.vue';
import HeadBtn from './HeadBtn.vue';
import ActionWindow from './ActionWindow.vue';
import { BootstrapVue } from 'bootstrap-vue';
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';

Vue.use(BootstrapVue);

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
  result = "In Progress";

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

  @Watch("youVal",{
    immediate: true
  })
  checkYouVal(newVal: number) {
    if(newVal <= 0) {
      this.disableBtns();
      this.$bvModal.msgBoxOk("You have died. Monstor killed you.").then(() => {
        const actionWin = this.$refs.actionWindow as ActionWindow;
        actionWin.cleanMessages();
        this.init(); 
      }).catch(err => console.log(err));
    }
  }

  @Watch("monsVal", {
    immediate: true
  })
  checkMonsVal(newVal: number) {
    if(newVal <= 0) {
      this.disableBtns();
      this.$bvModal.msgBoxOk("You have won. Monstor is slayed.").then(() => {
        const actionWin = this.$refs.actionWindow as ActionWindow;
        actionWin.cleanMessages();
        this.init(); 
      }).catch(err => console.log(err));
    }
  }
  private disableBtns (): void {
    const btnHead = this.$refs.btnHead as HeadBtn;
    btnHead.disableBtns();
  }
  heal (): void {
    const actionWin = this.$refs.actionWindow as ActionWindow;
    
    if(this.youVal >= 100) {
      this.youVal = 100
      actionWin.addMessage("You alreay are fully healed.", true);
      return;
    }
    
    const healVal = Math.floor(Math.random()*20);
    this.youVal += healVal;
    if(this.youVal > 100)
      this.youVal = 100
    actionWin.addMessage("You have healed with "+healVal+" health points.", true);
  }
  startNew (): void { 
    const actionWin = this.$refs.actionWindow as ActionWindow;
    actionWin.cleanMessages();
    this.init();
  }
  giveUp (): void {
    this.$bvModal.msgBoxOk("You are coward. You have fled battle field.").then(() => {
      const actionWin = this.$refs.actionWindow as ActionWindow;
      actionWin.cleanMessages();
      this.init(); 
    }).catch(err => console.log(err));
     
  }
  private init (): void {
    this.youVal = 100;
    this.monsVal = 100;
    this.isBtn = true;
  }
}
</script>

<style scoped>
</style>