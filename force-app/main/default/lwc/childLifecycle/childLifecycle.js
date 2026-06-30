import { LightningElement } from 'lwc';

export default class ChildLifecycle extends LightningElement {
    constructor(){
        super();
        console.log('child constructor called');
    }
    connectedCallback(){
        console.log('child connectedCallback called');
    }
    renderedCallback(){
        console.log('child renderedCallback called');
    }
    disconnectedCallback(){
        console.log('child disconnectedCallback called');
    }
    errorCallback(error, stack){
        console.log('errorCallback called', error, stack);
    }
}