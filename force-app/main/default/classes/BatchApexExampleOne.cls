public class BatchApexExampleOne implements Database.Batchable<sobject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        String query = 'SELECT Id,Name,Phone from Account';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc,List<Account> accList){
        for(Account acc : accList){
            acc.Phone = '88888888888';
        }
        update accList;
    }
    
    public static void finish(Database.BatchableContext bc){
        
    }

}