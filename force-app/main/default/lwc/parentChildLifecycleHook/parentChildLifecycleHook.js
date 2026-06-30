import { LightningElement } from 'lwc';

export default class ParentChildLifecycleHook extends LightningElement {
    constructor(){
        super();
        console.log('parent constructor called');
    }
    connectedCallback(){
        console.log('parent connectedCallback called');
    }
    renderedCallback(){
        console.log('parent renderedCallback called');
    }
    disconnectedCallback(){
        console.log('parent disconnectedCallback called');
    }
    errorCallback(error, stack){
        console.log('errorCallback called', error, stack);
    }
}