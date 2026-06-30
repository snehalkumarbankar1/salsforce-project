import createAccount from '@salesforce/apex/AccountController.createAccount';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { LightningElement } from 'lwc';

export default class ShowToasts extends LightningElement {
    accountName;
    errorMessage;

    handleChange(event){
        this.accountName = event.target.value;
       
    }
    handleClick(){
        createAccount({accountName: this.accountName})
       .then(result=>{
         this.showToast('Success','Account Craeted Succefully','success');
       }) 
       .catch(error=>{
                 this.errorMessage= error.body.message;
                 this.showToast('Error','failed to Craete Account','error');
       })
       
    }
    showToast(title,message,variant){
        const event = new ShowToastEvent({
            title:title,
            message : message,
            variant : variant
        })
        this.dispatchEvent(event);
    }
}