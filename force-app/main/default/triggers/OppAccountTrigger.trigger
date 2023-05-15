trigger OppAccountTrigger on Opportunity (after insert,after update) {
    
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate){
            OppAccountTriggerHelper.afterOppAcc(trigger.new);
        }
    }
}