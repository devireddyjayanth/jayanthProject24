import { LightningElement } from 'lwc';

export default class LifecycleHookChildComp extends LightningElement {
    constructor(){
        super();
        console.log("Yes I am In Child Component");
    }

    connectedCallback(){
        console.log("Yes I am in Child Connected callback");
    }
}