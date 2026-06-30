import {api} from 'lwc'; 
 import LightningModal from 'lightning/modal';

export default class customerSalesOrderPopup extends LightningModal {
 
    @api header;
    @api salesorderLineItemsData;
     columns=[
        {label:'Product Name',fieldName:'Product_Name__c'},
         {label:'Quantity',fieldName:'Quantity__c'},
          {label:'Discount',fieldName:'Discount__c'}
    ]; 

    handleOkay() {
        this.close('okay');
    }
}