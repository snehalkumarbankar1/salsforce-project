import { LightningElement } from 'lwc';

export default class RenderedCallbackDemo extends LightningElement {

    isRendered = false;

    renderedCallback() {

        if(this.isRendered) {
            return;
        }

        this.isRendered = true;

        console.log('renderedCallback executed');

        // Focus the input field
        const inputField =
            this.template.querySelector('lightning-input');

        if(inputField) {
            inputField.focus();
        }

        // Change text and style
        const msg =
            this.template.querySelector('.message');

        if(msg) {

            msg.innerText =
                'This text was changed from renderedCallback()';

            msg.style.color = 'green';
            msg.style.fontSize = '20px';
            msg.style.fontWeight = 'bold';
            msg.style.border = '2px solid green';
            msg.style.padding = '10px';
        }
    }
}