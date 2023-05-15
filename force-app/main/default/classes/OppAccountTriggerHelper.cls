public class OppAccountTriggerHelper {
    //When a new Opportunity record is created for an account  rollup the 
    //opportunity amount to Corresponding Account
    public static void afterOppAcc(List<Opportunity> oppList){
        Set<Id> accId = new Set<Id>();
        for(Opportunity op : oppList){
            if(op.AccountId != null || op.AccountId != ''){
                accId.add(op.AccountId);
            }
        }
        Map<Id,Account> acc = new Map<Id,Account>([SELECT Id, Total_Amount__c, PipeLine_Amount__c, 
                                                   Won_Amount__c, Lost_Amount__c FROM Account where Id=:accId]);
        List<Account> a2 = new List<Account>();

        for(Opportunity opp : oppList){
            Account a1 = new Account();
            //a1 = name,Phone ..... 
            a1 = acc.get(opp.AccountId); // name= jayanth
            if(opp.StageName == 'Closed Won'){
                a1.Total_Amount__c = a1.Total_Amount__c + opp.Amount;
                a1.Won_Amount__c = a1.Won_Amount__c + opp.Amount;
            }
            else if(opp.StageName == 'Closed Lost'){
                a1.Total_Amount__c = a1.Total_Amount__c + opp.Amount;
                a1.Lost_Amount__c = a1.Lost_Amount__c + opp.Amount;
            }
            else if(opp.StageName != 'Closed Won' || opp.StageName != 'Closed Lost'){
                a1.Total_Amount__c = a1.Total_Amount__c + opp.Amount;
                a1.PipeLine_Amount__c = a1.PipeLine_Amount__c + opp.Amount;
            }
            acc.put(opp.AccountId,a1);//{jayanth,{name,age,/...}}
        }
        a2= acc.values();
        update a2;
    }

}