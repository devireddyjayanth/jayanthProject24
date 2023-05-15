public class AccountTriggerOneHelper {
    
    public static void afterAccountUpdate(Map<Id,Account> newRecords, Map<Id,Account> oldRecords){
        Set<Id> accId = new Set<Id>();
        List<Opportunity> oppList = new List<Opportunity>();
        
        for(Id accIds : newRecords.keySet()){
            Account accNew = newRecords.get(accIds);
            Account oldRec = oldRecords.get(accIds);
            if(accNew.Active__c == 'No' && oldRec.Active__c == 'Yes'){
                accId.add(accNew.Id);
            } 
        }
        if(accId.size()>0){
            List<Account> accList = [SELECT Id,Active__c,(SELECT Id,StageName from Opportunities) from Account where Id=:accId];
            for(Account ac : accList){
                for(Opportunity op : ac.Opportunities){
                    if(op.StageName != 'Closed Won' && op.StageName != 'Closed Lost'){
                        op.StageName = 'Closed Lost';
                        oppList.add(op);
                    }
                }
                update oppList;
            }
        }
        
    }

}