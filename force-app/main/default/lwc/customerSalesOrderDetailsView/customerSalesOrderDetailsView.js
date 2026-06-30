import { LightningElement,api } from 'lwc';
import getSalesOrderData from '@salesforce/apex/CustomSalesOrderDetailsController.getSalesOrderData';
import salesLineItemsPopup from 'c/customerSalesOrderPopup';

export default class CustomerSalesOrderDetailsView extends LightningElement {

    @api customerData;
    salesOrdersData;
    displayMessage;
    displayData ;
    columns = [
               {label:'Name',  fieldName:'Id',type:'button',
               typeAttributes:{
                label:{fieldName:'Name'},
                variant:'base'
               } },
               {label:'Order Date',fieldName: 'Order_Date_',type:'date'},
                {label:'Total Items',fieldName: 'Total_Items__c'},
                 {label:'Total Quantity',fieldName: 'Total_Quantity__c'},
                 {label:'Total Amount',fieldName: 'Total_Amount__c',type:'currency'}
];
    getSalesOrders(){
        this.displayMessage = false;
        this.displayData = false;
         getSalesOrderData({sCustomerId:this.customerData.Id})
      .then(result =>{
      const cSalesOrderSize = result.length;
      if(cSalesOrderSize>0){
        this.salesOrdersData=result;
      }
      else{ 
        this.displayMessage = true; 
      }
      this.displayData = true;
      })
      .catch(error =>{

      })     
    }
    handleRowAction(event){
      const row = event.detail.row;
      salesLineItemsPopup.open({
        size:'small',
        header:'View-'+row.Name+'-sale order line items',
        salesorderLineItemsData:row.Sales_Order_Line_Items__r 
      })
    }
}