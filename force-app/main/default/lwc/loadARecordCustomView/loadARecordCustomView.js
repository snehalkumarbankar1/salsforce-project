import { LightningElement,api } from 'lwc';

export default class LoadARecordCustomView extends LightningElement {
   @api recordId;
    objectApiName='Account';
}