import { LightningElement ,wire } from 'lwc';
import CASERECORDS from '@salesforce/apex/caseController.getCaseRecord';

export default class FetchCaseRecords extends LightningElement {
    caseList;
    errorMessage;
    @wire(CASERECORDS)
    wiredRecords({ data,error }){
       
        if(data){
            this.caseList= data;
            this.errorMessage = undefined;
        }
        else if(error){
            this.errorMessage = error.body.message;
            this.caseList = undefined;
        }
    }
}