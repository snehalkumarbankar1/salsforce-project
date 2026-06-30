import { LightningElement } from 'lwc';

export default class CaseFormWithEvents extends LightningElement {

    objectApiName= 'Case';

    handleSubmit(event) {
        console.log('onsubmit event:' + JSON.stringify(event.detail));
    }

    handleSuccess(event) {
      alert('Case created successfully!'+ event.detail.id);
    }
   
}