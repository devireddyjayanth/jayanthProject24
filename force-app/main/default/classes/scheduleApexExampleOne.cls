public class scheduleApexExampleOne implements Schedulable {
    
    public void execute(SchedulableContext sc){
        List<Opportunity> oppList = [select Id,stageName from opportunity];
        for(Opportunity opp : oppList){
            opp.StageName = 'closed won';
        }
        update oppList;
        
    }

}