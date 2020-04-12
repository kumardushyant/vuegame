<template>
    <div class="btnrow">
        <div v-if="showBtns" class="contain">
            <b-button-group>
                <b-button :variant="btn.vary" size="md" v-for="btn in actionBtns" :key="btn.text" @click="triggerAction(btn.id)">{{ btn.text }}</b-button>
            </b-button-group>
        </div>
        <div v-else  class="contain">
            <button @click="triggerAction()">Start New Game</button>
        </div>
    </div>    
</template>

<script lang="ts">
import Vue from 'vue';
import { Component, Prop } from 'vue-property-decorator';
import { BootstrapVue } from 'bootstrap-vue';
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';

Vue.use(BootstrapVue);

@Component({
})
export default class HeadBtn extends Vue {
    @Prop({default: false, required: true}) 
    showBtns: boolean;

    actionBtns = [
        {
            "text": "Attack",
            "id": 1,
            "vary": "primary"
        },
        {
            "text": "Special Attack",
            "id": 2,
            "vary": "info"
        },
        {
            "text": "Heal",
            "id": 3,
            "vary": "success"
        },
        {
            "text": "Give Up",
            "id": 4,
            "vary": "danger"
        }
    ]

    triggerAction (act: number): void {
        switch (act) {
            case 1:
                this.$emit('attack');
                break;
            case 2:
                this.$emit('specattack');
                break;
            case 3:
                this.$emit('heal');
                break;
            case 4:
                this.$emit('giveUp');
                break;
            default:
                this.$emit('startNew');
                break;
        }
    }
}
</script>

<style scoped>

div.btnrow {
    border: 1px solid rgba(212, 209, 209, 0.692);
    display: flex;
    box-shadow: 2px 2px #e2e1e1;
    min-height: 40px;
    height: 50px;
    width: 90%;
    margin-left: 5%;
    margin-right: 5%;
    margin-top: 10px;
}
div.btnrow button {
    text-transform: uppercase;
    font-size: 1rem;
}
div.btnrow div.contain {
    display: inline-block;
    flex-wrap: wrap;
    align-content: center;
    width: 100%;
    min-width: 100%;
}
div.btnrow div.contain button {
    margin-top: 6px;
}

</style>