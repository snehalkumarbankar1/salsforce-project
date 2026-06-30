import { LightningElement } from 'lwc';

export default class Reactivitycheck extends LightningElement {
    userAddress = "India";
    
    updateAddress() {
        this.userAddress = "USA";
        
    }

}