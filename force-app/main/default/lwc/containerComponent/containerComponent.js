import { LightningElement ,api } from 'lwc';

export default class ContainerComponent extends LightningElement {
   @api productsFound = false;   
    @api productList;
   parentCalled = false;
    @api handleParentCall(){
        this.parentCalled = true;
    }
}