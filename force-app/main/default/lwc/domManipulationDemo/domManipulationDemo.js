import { LightningElement } from 'lwc';

export default class DomManipulationDemo extends LightningElement {

    isRendered = false;

    renderedCallback() {

        if (this.isRendered) {
            return;
        }

        this.isRendered = true;

        const messageDiv = this.template.querySelector('.message');

        if (messageDiv) {
            messageDiv.style.border = '2px solid green';
            messageDiv.style.padding = '10px';
        }

        console.log('DOM updated after render');
    }
}