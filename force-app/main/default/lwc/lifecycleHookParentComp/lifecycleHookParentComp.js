import { LightningElement,api,track } from 'lwc';

export default class LifecycleHookParentComp extends LightningElement {
    @track name;
    @track blogName;
    @track hasRendered=true;
    constructor(){
        super();
        console.log("Yes i am Parent Component");
    }

    connectedCallback(){
        console.log("Yes I am In Parent Connected call Back");
    }

    connectedCallback(){
        
    }
    renderedCallback(){
        if(this.hasRendered){
            this.blogName='rendedCallback method';
            this.hasRendered = false;
        }

    }
    handleClick(){
        this.blogName='SFDC Hyderabad';
    }
    
}