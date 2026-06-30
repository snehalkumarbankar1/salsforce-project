import { LightningElement,api } from 'lwc';

export default class EditRecordUsingRecordForm extends LightningElement {

    @api recordId;
    objectApiName = 'Case';
    fields=['CaseNumber','Type','Origin'];
}