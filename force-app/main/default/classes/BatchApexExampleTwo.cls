public class BatchApexExampleTwo implements Database.Batchable<sobject> {
    // write batch class that updates the Industry field on all accounts
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id,Name,Industry from Account';
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc,List<Account> accList){
        for(Account acc : accList){
            acc.Industry = 'Agriculture';   
        }
        update accList; 
    }
    public void finish(Database.BatchableContext bc){
        
    }

}