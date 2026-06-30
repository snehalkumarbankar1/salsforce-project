Global class AccountBatchRevenue implements System.Schedulable{

    Global void Execute(System.SchedulableContext sContext){
        
         AccountBatchTotalAnnualRevenue revenueBatch = new  AccountBatchTotalAnnualRevenue();
        Database.ExecuteBatch(revenueBatch,5);
    }
}