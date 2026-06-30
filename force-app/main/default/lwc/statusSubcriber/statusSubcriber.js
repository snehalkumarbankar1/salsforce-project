import { LightningElement ,wire} from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import STATUS_CHANNEL from '@salesforce/messageChannel/statusMessageChannel__c';

export default class StatusSubcriber extends LightningElement {
 
  recievedmMessage='';

    @wire(MessageContext)
    message;

      connectedCallback(){
        this.subscribeToStatusChange();
      } 
      
    subscribeToStatusChange(){
        subscribe(this.message,STATUS_CHANNEL,
            (payload)=>this.handleStatus(payload));
    }
    handleStatus(payload){
       this.recievedmMessage = payload.status;
    }
    
}