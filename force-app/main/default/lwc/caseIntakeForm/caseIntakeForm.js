import { LightningElement,track } from 'lwc';
import getClientDetails from '@salesforce/apex/CaseClientController.getClientDetails';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CaseIntakeForm extends LightningElement {

     @track caseRecord = {
        Client__c : null,
        Client_Email__c : '',
        Client_Phone__c : '',
        Client_Address__c :''
     };
    handleClientSelected(event){
      const selectedRecordId = event.detail.recordId;
      this.caseRecord.Client__c = selectedRecordId;

      if(selectedRecordId){
        getClientDetails({clientId : selectedRecordId})
        .then(result => {
            this.caseRecord = {
                ...this.caseRecord,
                Client_Email__c : result.Email__c || '',
                Client_Phone__c : result.Phone__c || '',
                Client_Address__c : result.Address__c || ''
            }
        })
        .catch(error =>{
            this.dispatchEvent(new ShowToastEvent({
                title : 'Error',
                message : 'Failed to load client details',
                variant : 'error'
            }) 
            )
        })
      }
      else {
             this.caseRecord = {
                ...this.caseRecord,
                Client_Email__c : '',
                Client_Phone__c : '',
                Client_Address__c : ''
            }
      }
    }
    handleSubmit(event){
        event.preventDefault();
        const fields = event.detail.fields;

         fields.Client__c = this.caseRecord.Client__c;
        fields.Client_Email__c = this.caseRecord.Client_Email__c;
        fields.Client_Phone__c = this.caseRecord.Client_Phone__c;
        fields.Client_Address__c = this.caseRecord.Client_Address__c;

        this.template.querySelector('lightning-record-edit-form').submit(fields);
    }
    handleSuccess(event){
    const inputFields =this.template.querySelectorAll('lightning-input-field');
     
    if(inputFields){
        inputFields.forEach(field => {
            field.reset();
        })
      }
         const recordPicker = this.template.querySelector('lightning-record-picker');

         if(recordPicker){
            recordPicker.clearSelection();
         }
           this.dispatchEvent(new ShowToastEvent({
                title : 'Success',
                message : 'Case created successfully',
                variant : 'success'
            }) 
            )
             this.caseRecord = {
                 Client__c : '',
                Client_Email__c : '',
                Client_Phone__c : '',
                Client_Address__c : ''
            }
    }
    handleError(event){
          this.dispatchEvent(new ShowToastEvent({
                title : 'Error',
                message : event.detail?.message || 'An error ocurred while saving the case',
                variant : 'error'
          })
        )
    }
}