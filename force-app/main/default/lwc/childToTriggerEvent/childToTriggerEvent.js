import { LightningElement } from 'lwc';

export default class ChildToTriggerEvent extends LightningElement {
   product={};
    handleButtonclick(){
  this.product = {id:1 ,name:'geely coolray'};

  const event = new CustomEvent('sendproduct', {
  detail: this.product
  });  
     this.dispatchEvent(event);
    }

}