public class OpportunityTriggerOneHelper {
    
    public static void afterOppInsert(List<Opportunity> oppList){
        
        List<Account> accList = new List<Account>();
        for(Opportunity opp : oppList){
            if(opp.AccountId != null){
                Account acc = new Account();
                acc.Id = opp.AccountId;
                acc.Latest_Opportunity_Amount__c = opp.Amount;
                accList.add(acc);
            }
        }
        update accList;
        
    }

}