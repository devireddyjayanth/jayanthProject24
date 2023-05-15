trigger OpportunityTriggerOne on Opportunity (after insert) {
    
    if(trigger.isInsert){
        if(trigger.isAfter){
            OpportunityTriggerOneHelper.afterOppInsert(trigger.new);
        }
    }

}