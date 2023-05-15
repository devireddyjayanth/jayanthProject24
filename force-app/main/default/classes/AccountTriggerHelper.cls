public class AccountTriggerHelper {
    
    public static void beforeAccountInsert(List<Account> accList){
        for(Account acc: accList){
            if(acc.Industry == 'Banking'){
                acc.AnnualRevenue = 100000;
            }else if(acc.Industry == 'Energy'){
                acc.AnnualRevenue = 50000;
            }
        }
    }
    public static void beforeDelete(List<Account> accList){
        List<Account> acc = [SELECT Id,(SELECT Id from Contacts) from Account where Id =: accList];
        for(Account a : acc){
            if(a.contacts.size()>0){
                a.addError('you cannot delete the Account');
            }
        }
    }
    
    public static void afterInsertOrDeleteRecord(List<Account> accList){
        
        
    }
}