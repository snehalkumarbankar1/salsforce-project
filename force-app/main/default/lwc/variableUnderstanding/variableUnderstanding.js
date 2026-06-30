import { LightningElement,api } from 'lwc';

export default class VariableUnderstanding extends LightningElement {
    @api memberName = 'snehal';
    @api age = 24;

    myDate={
        day: 6,
        month: 'long',
        year: 'numeric',
        hour: 'numeric',
        minute: 'numeric'
    };
}