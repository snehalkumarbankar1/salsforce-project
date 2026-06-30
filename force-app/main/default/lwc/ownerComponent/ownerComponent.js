import { LightningElement } from 'lwc';

export default class OwnerComponent extends LightningElement {
    productList=[
        {id:1,name:'macbook air',rating:'3'},
        {id:2,name:'macbook pro',rating:'4'},
        {id:3,name:'humanity',rating:'5'},
    ];
    callChildMethod(){
        
        this.template.querySelector('c-container-component').handleParentCall();
    }
}