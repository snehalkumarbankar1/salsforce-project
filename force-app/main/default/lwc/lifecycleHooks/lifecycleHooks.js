import { LightningElement } from 'lwc';

export default class LifecycleHooks extends LightningElement {
    userName = "snehal";

    handleNameChange(){
        this.userName= "subhash";
    }
    constructor(){
        super();
        console.log('constructor called');
    }
    connectedCallback(){
        console.log('connectedCallback called');
    }
    renderedCallback(){
        console.log('renderedCallback called');
    }
    disconnectedCallback(){
        console.log('disconnectedCallback called');
    }
    errorCallback(error, stack){
        console.log('errorCallback called', error, stack);
    }
}