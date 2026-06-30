import { LightningElement, wire } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

import CASE_OBJECT from '@salesforce/schema/Case';
import DESCRIPTION from '@salesforce/schema/Case.Description';
import SUBJECT from '@salesforce/schema/Case.Subject';
import PRIORITY from '@salesforce/schema/Case.Priority';
import RECID from '@salesforce/schema/Case.RecordTypeId';

export default class CustomCaseCreater extends NavigationMixin(LightningElement) {

    subject = '';
    priority = '';
    description = '';
    recordTypeId = '';

    @wire(getObjectInfo, { objectApiName: CASE_OBJECT })
    caseRecord({ data, error }) {
        if (data) {
            let recordTypeDetails = data.recordTypeInfos;
            Object.keys(recordTypeDetails).forEach((key) => {
                const recordTypeInfo = recordTypeDetails[key];
                if (recordTypeInfo.name == 'SMS Community Cases') {
                    this.recordTypeId = recordTypeInfo.recordTypeId;
                }
            })
        }
        else if (error) {
    console.error('Error fetching object info', error);
}
    }

    get options() {
        return [
            { label: 'Low', value: 'Low' },
            { label: 'Medium', value: 'Medium' },
            { label: 'High', value: 'High' },
        ];
    }
    populateSubject(event) {
        this.subject = event.target.value;
    }

    populatePriority(event) {
        this.priority = event.detail.value;
    }
    populateDescription(event) {
        this.description = event.target.value;
    }
    async createCase() {
        try {
            const fields = {
                [SUBJECT.fieldApiName]: this.subject,
                [PRIORITY.fieldApiName]: this.priority,
                [DESCRIPTION.fieldApiName]: this.description,
                [RECID.fieldApiName]: this.recordTypeId
            };


            const recordInput = { apiName: CASE_OBJECT.objectApiName, fields };

            const record = await createRecord(recordInput);
            console.log(record.id);
           this.showToast('Success','Case Record is Created','success');
           this.navigateToRecord(record.id);
        } catch (error) {
            this.showToast('Error','Error occurs',+ (error.body.message),+ 'error');
        }
    }
     navigateToRecord(recordId){
      this[NavigationMixin.Navigate] ({
         type: 'standard__recordPage',
         attributes:{
            recordId:recordId,
            objectApiName: 'Case',
            actionName: 'view'
         }
      });
     }  

    showToast(title,message,variant){
        const event = new ShowToastEvent({
            title : title,
            message : message,
            variant : variant
        });
        this.dispatchEvent(event);
    }
}