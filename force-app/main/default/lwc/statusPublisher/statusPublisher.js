import { LightningElement, track, wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import STATUS_CHANNEL from '@salesforce/messageChannel/statusMessageChannel__c';

export default class StatusPublisher extends LightningElement {

    status='Offline';

    options=[
        {label:'Online',value:'Online'},
          {label:'Offline',value:'Offline'}
    ];
    
    @wire(MessageContext)
     message;

    handleChange(event){
     this.status = event.detail.value;
    }

    publishStatus(){
      const payload = {
        status: this.status
      }
      publish(this.message,STATUS_CHANNEL, payload);
    }
}