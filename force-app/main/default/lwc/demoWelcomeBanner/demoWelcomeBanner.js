import { LightningElement,api } from 'lwc';

export default class DemoWelcomeBanner extends LightningElement {
      // Values configurable from Lightning App Builder
    @api title = 'Welcome';
    @api message = 'Welcome to Salesforce';
    @api backgroundColor = '#1589EE';
    @api showButton = false;

    get bannerStyle() {
        return `
            background-color:${this.backgroundColor};
            padding:20px;
            border-radius:10px;
            color:white;
            text-align:center;
        `;
    }

    handleClick() {
        alert('Support team contacted!');
    }
}