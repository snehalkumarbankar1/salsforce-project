import { LightningElement, api } from 'lwc';

export default class EmployeeDashboard extends LightningElement {

    @api cardTitle;
    @api recordLimit;

}