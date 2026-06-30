import { LightningElement } from 'lwc';

export default class ErrorHandlingUseCase2 extends LightningElement {

    name ='';
    email ='';
    phone ='';
    age ='';

    errors=[];
    [ 
       {fieldName:'', errorMessage:''}
    ];

    handleOnChange(event){
       const field = event.target.dataset.field;
       this[field] = event.target.value;
       console.log(this[field]);
    }

    validate(){
        const errs = [];
        if(!this.name){
            errs.push({fieldName:'name', errorMessage:'Name should not be blank'});
        }
         if(!this.email){
            errs.push({fieldName:'email', errorMessage:'email should not be blank'});
        }
         if(!this.phone){
            errs.push({fieldName:'phone', errorMessage:'phone should not be blank'});
        }
         if(!this.age){
            errs.push({fieldName:'age', errorMessage:'age should not be blank'});
        }
        const fullName = this.name.trim().length;
        if(fullName<3){
           errs.push({fieldName:'name', errorMessage:'Length of Name is not less than three character'});
        }
        if(this.age > 100 || this.age < 15){
            errs.push({fieldName:'age', errorMessage:'age should not be greater than 100 and less than 15'}); 
        }
        return errs;

    }

    handleOnClick(){
          this.errors = this.validate();
          if(this.errors.length){
            this.errors;
          }
          else{
            this.resetFields();
          }
    }
    resetFields(){
   this.name = '';
    this.email ='';
    this.phone ='';
    this.age ='';
    }
}