import { LightningElement } from 'lwc';
import getCustomerData from '@salesforce/apex/CustomSalesOrderDetailsController.getCustomerData';

export default class CustomerSalesOrderDetails extends LightningElement {

    phone;
    email;
    message;
   dynamicClass;
   customerData;

    handleChange(event){
       const cName = event.target.name;
       const cValue = event.target.value;

      if(cName =='PHONE'){
        this.phone = cValue;
      } 
      else {
        this.email = cValue;
      }
    }
    getCustomerData(){
       const isValidate =  this.validateData();
       if(!isValidate){
         getCustomerData({sPhone:this.phone,sEmail:this.email})
         .then(result =>{
             this.customerData = result;
             this.message= '';
         })
         .catch(error =>{
           this.customerData = '';
          this.dynamicClass = 'greyColor';
           this.message = 'Info: No record found with this phone number or Email';
         })
       }  
    }
    validateData(){
          this.message = '';
          this.customerData = '';
          if((this.phone =='' || this.phone == undefined) && (this.email =='' || this.email == undefined)){
            this.dynamicClass = 'redColor';
            this.message = 'Error : Please enter either phone number or email address';
            return true;
          }
          return false;
    }
}