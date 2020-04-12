<template>
    <div class="auditContainer">
        <div v-for="(msg,idx) in msgs" :key="idx" :class=msg.cls class="msgText" ><span>{{msg.text}}</span></div>
    </div>
</template>

<script lang="ts">
import Vue from 'vue';
import { Component } from 'vue-property-decorator';

class MsgObj {
    text: string;
    cls: string;
}

@Component
export default class ActionWindow extends Vue {

    msgs: MsgObj[] = [];

    public addMessage (msg: string, isYou: boolean): void {
        if(isYou) {
            this.msgs.push({
                "text": msg,
                "cls": "youText"
            });
        } else {
            this.msgs.push({
                "text": msg,
                "cls": "monsText"
            });
        }
    }

    public cleanMessages (): void {
        this.msgs = [];
    }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Baloo+Paaji+2:wght@500&display=swap');

div.auditContainer {
    border: 1px solid rgba(212, 209, 209, 0.692);
    display: grid;
    box-shadow: 2px 2px #e2e1e1;
    min-height: 40px;
    min-height: 40px;
    width: 90%;
    margin-left: 5%;
    margin-right: 5%;
    margin-top: 10px;
}

div.msgText span {
    font-family: 'Baloo Paaji 2';
    font-size: 15px;
    font-weight: bolder;
}

div.msgText {
    padding-block: 4em 1em;
    margin-left: 10%;
    margin-right: 10%;
    margin-top: 10px;
    margin-bottom: 10px;
    display: block;
}

div.youText {
    background-color: rgb(170, 241, 218);
    border: 1px solid rgb(0, 255, 55);
}

div.monsText {
    background-color: coral;
    border: 1px solid red;
}
</style>