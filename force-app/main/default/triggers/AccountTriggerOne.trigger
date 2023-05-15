trigger AccountTriggerOne on Account (after update) {
    
    if(trigger.isUpdate){
        if(trigger.isAfter){
            AccountTriggerOneHelper.afterAccountUpdate(trigger.newMap,trigger.oldMap);
        }
        
    }

}