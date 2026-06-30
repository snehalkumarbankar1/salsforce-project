import { LightningElement } from 'lwc';

export default class ChildToParentEvents extends LightningElement {

    showFinalValue={};
    eventReceived = false;

    handleProductSelection(event){
   this.showFinalValue = event.detail;
   this.eventReceived = true;
    }
}