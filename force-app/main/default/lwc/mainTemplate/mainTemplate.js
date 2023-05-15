import { LightningElement } from 'lwc';
import template1 from "./template1.html";
import template2 from "./template2.html";
export default class MainTemplate extends LightningElement {
    template2 = true;
    render(){
        return this.template1?template1:template2;
    }
}