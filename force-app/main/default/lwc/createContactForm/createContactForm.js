import { LightningElement,track } from 'lwc';
import getFilteredAccountIds from '@salesforce/apex/ContactCreationController.getFilteredAccountIds';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateContactform extends LightningElement {

    leadSourceValue='';
   @track accountIdList=[];
   selectedAccountId='';
    handleLeadSourceChange(event){
             this.leadSourceValue= event.detail.value;
            if(this.leadSourceValue){
             this.fetchFilteredAccounts();
            }
            else{
                 this.accountIdList=[];
            }
    }

    fetchFilteredAccounts(){
        getFilteredAccountIds({leadSource: this.leadSourceValue})
     .then(result=>{
        this.accountIdList= result;
     })
     .catch(error=>{
        console.error('error',error?.body?.message || error.message);
     });
        
    }
    get hasAccounts() {
    return this.accountIdList && this.accountIdList.length > 0;
}

   get accountFilter(){
        return  this.accountIdList.length>0?{
           criteria:[
                 { fieldPath :'Id',
                    operator :'in',
                    value : this.accountIdList
                 }
           ] 
        }: null;
    }
      handleAccountChange(event){
       this.selectedAccountId = event.detail.recordId;
      }
      handleError(event){
       this.dispatchEvent(new ShowToastEvent({
            title:'Error',
            message:'Contact Not Created Check Isuue',
             variant:'error'
        }))
      }
      handleSuccess(event){
        this.dispatchEvent(new ShowToastEvent({
            title:'Success',
            message:'Contact Created succefully',
             variant:'success'
        }))
      }
      handleSubmit(event){
        event.preventDefault();
        const recordForm = this.template.querySelector('lightning-record-edit-form');
        const fields = {};
        const inputFields= recordForm.querySelectorAll('lightning-input-field');
        inputFields.forEach(field=>{
            fields[field.fieldName] = field.value;
        });
          fields['AccountId']=this.selectedAccountId;
          this.template.querySelector('lightning-record-edit-form').submit(fields);
      }
}