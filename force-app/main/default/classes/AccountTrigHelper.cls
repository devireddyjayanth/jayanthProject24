public class AccountTrigHelper {
    
    public static void beforeAccountCreation(List<Account> accList){
        Set<String> names = new Set<String>();
        for(Account acc : accList){
            names.add(acc.Name);
        }
        
        List<Account> oldAccounts = [SELECT Id,Name from Account where Name =: names];
        
        Set<String> oldRecords = new Set<String>();
        for(Account acc : oldAccounts){
            oldRecords.add(acc.Name);
        }
        for(Account acc : accList){
            if(acc.Name != null){
                if(oldRecords.contains(acc.Name)){
                    acc.addError('You Cannot Create this Name');
                }
            }
        }
    }

}