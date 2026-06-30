public class AccountQueueableHelper implements Queueable {
	
    public void Execute(QueueableContext qContext){
        
        Account acc = new Account();
        
        acc.Name = 'Pratap kumar';
        acc.AnnualRevenue = 67999887;
        acc.Fax = '6566675454';
        acc.Active__c = 'Yes';
        acc.Phone = '9876545544';
        
        Insert acc;
        
        if(acc.Id != null){
            System.debug('account inserted successfully'+ acc.Id);
        }
        
    }
}