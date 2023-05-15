trigger OpportunityTrigger on Opportunity (before insert,before update,after insert,after update,before delete) {
    
    if(trigger.isUpdate){
        if(trigger.isAfter){
            //OpportunityTriggerHelper.opportunityTriggerClass(trigger.newMap,trigger.oldMap);
            //OpportunityTriggerHelper.opportunityAmountCalculation(trigger.newMap,trigger.oldMap);
            
        }
    }
    if(trigger.isInsert){
        if(trigger.isAfter){
            //OpportunityTriggerHelper.totalOppAndTotalAmount(trigger.newMap,trigger.oldMap);
        }
        else if(trigger.isBefore){
            //OpportunityTriggerHelper.beforeOpportunityCreation(trigger.new);
        }
    }
    

}