public class OpportunityTriggerHelper {
    //Existing Opportunity with statge name as 'Closed Won' is updated to any other stage it has throw error message
    
    public static void opportunityTriggerClass(Map<Id,Opportunity> newValues,Map<Id,Opportunity> oldValues){
        for(Id OppId : newValues.keySet()){
            Opportunity newRec = newValues.get(oppId);
            Opportunity oldRec = oldValues.get(oppId);
            if(oldRec.StageName == 'Closed Won'){
                newRec.addError('You Cannot Modify StageName');
            }
        }
    }
    //When existing Opportunity record stageName is changed to 
    //closed won then  recalculate the Amount_Won for the  Correspondng Account
    public static void opportunityAmountCalculation(Map<Id,Opportunity> newValues,Map<Id,Opportunity> oldValues){
        Set<Id> accId = new Set<Id>();
        
        for(Id oppId : newValues.keySet()){
            Opportunity newRec = newValues.get(oppId);
            accId.add(newRec.AccountId);
            
        }
        if(accId.size()>0){
            List<Account> accList = [SELECT Id,AnnualRevenue,(SELECT Id,AccountId,Amount,StageName from 
                                                              Opportunities where Id=:newValues.keySet()) from Account where Id =:accId];
            for(Account acc : accList){
                if(acc.AnnualRevenue == null){
                    acc.AnnualRevenue = 0;
                }
                for(Opportunity op : acc.Opportunities){
                    if(op.StageName == 'closed won'){
                        acc.AnnualRevenue = acc.AnnualRevenue + op.Amount;
                    }else if(op.StageName != 'closed won'){
                        acc.AnnualRevenue = acc.AnnualRevenue -op.Amount;
                    }
                }
            }
            update accList;
        }
    }
    //When  ever a new Opportunity is creatd  recalculate the  total opportunites and 
    //Total Opportunity amount for the corresponding Account
    public static void totalOppAndTotalAmount(Map<Id,Opportunity> newValues,Map<Id,Opportunity> oldValues){
        
        Set<Id> accId = new Set<Id>();
        for(Id oppId : newValues.keyset()){
            Opportunity newRec = newValues.get(oppId);
            accId.add(newRec.AccountId);
            Account a = new Account();
            //a.Total_Opportunities__c
            //a.Total_Opportunity_amount__c
        }
        if(accId.size()>0){
            List<Account> accList = [SELECT Id,Total_Opportunities__c,Total_Opportunity_amount__c,
         (SELECT Id,AccountId,Amount from Opportunities where Id=:newValues.keySet()) from Account Where Id =:accId];
            
            for(Account acc : accList){
                acc.Total_Opportunities__c = acc.Opportunities.size();
                decimal total = 0;
                for(Opportunity op : acc.Opportunities){
                    total = total + op.Amount;
                }
                acc.Total_Opportunity_amount__c = total;
            }
            update accList;
        }
    }
    public static void beforeOpportunityCreation(List<Opportunity> oppList){
        List<User> u = [SELECT Id from user where alias = 'jredd'];
        
        for(Opportunity opp : oppList){
            if(opp.Amount == 1000000 && opp.LeadSource == 'Web'){
                
            }
        }
        
    }
}