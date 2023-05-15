@isTest
public class OpportunityTriggerTestClass {
    
    @isTest
    public static void opportunityTestOne(){
        List<Opportunity> OppList = new List<Opportunity>();
        for(Integer i = 1 ; i <= 5 ; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'test '+i;
            opp.StageName = 'Closed Won';
            opp.CloseDate = System.today()+3;
            OppList.add(opp);
        }
        test.startTest();
        insert OppList;
        for(Opportunity Opp : OppList){
            opp.StageName = 'prospecting';
        }
        try{
            update OppList;
        }catch(Exception e){
            System.assert(e.getMessage().contains('You Cannot Modify StageName'));
        }
        
    }

}