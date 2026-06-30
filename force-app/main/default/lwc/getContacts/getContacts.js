import { LightningElement ,track} from 'lwc';
import getRecords from '@salesforce/apex/ContactController.getRecords';

export default class GetContacts extends LightningElement {

     
     errorMessage = '';
    @track data = [];
   phoneOrEmail = '';
    
     handleChange(event){
        
        this.phoneOrEmail= event.target.value;
     }

    handleClick(){
        getRecords({inputValue:this.phoneOrEmail})
      .then(record=>{

          this.data = record;
          this.errorMessage = '';
      })
     .catch(e => {
         this.errorMessage =  e.body.message;
         this.data = '';
      });
    }
}