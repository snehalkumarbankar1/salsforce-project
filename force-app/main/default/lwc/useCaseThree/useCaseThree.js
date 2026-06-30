import { LightningElement,api,track} from 'lwc';
import getRelatedRecords from '@salesforce/apex/childRecordController.getRelatedRecords';

export default class UseCaseThree extends LightningElement {
@api recordId;
     @api childApiName='Contact';
       @api fieldList= 'Id,FirstName,LastName,Phone';
       @api lookupFieldApiName = 'accountId';
       @api limitSize= 2 ;
        @track data=[];
        errorMessage ='';

        connectedCallback(){
            this.loadChildRecord();
        }

 async loadChildRecord(){
    try{
    const result = await getRelatedRecords({
        recordId : this.recordId,
        childApiName : this.childApiName,
        fieldList : this.fieldList,
        lookupFieldApiName : this.lookupFieldApiName,
        limitSize : this.limitSize
     });
     this.data = result;
    }
    catch(error){
       this.errorMessage = error.body.message;
       this.data = [];
    }
 }
   get columns(){
        const fields = this.fieldList.split(',').map(f=> f.trim()).filter(Boolean);
        return fields.map(field=> ({label : field , fieldName: field}));
   }
}