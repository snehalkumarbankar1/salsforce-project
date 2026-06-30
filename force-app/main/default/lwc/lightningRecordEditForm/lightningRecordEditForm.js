import { LightningElement,api } from 'lwc';

export default class LightningRecordEditForm extends LightningElement {
    @api recordId;
    objectApiName = 'Case';
     handleFormSuccess(event){
 this.template.querySelector('lightning-record-edit-form').reset();
         
    }
}