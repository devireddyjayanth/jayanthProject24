trigger AccountTrigger on Account (before insert,before delete,after Insert,After delete) {
    
    if(trigger.isInsert){
        if(trigger.isBefore){
           // AccountTriggerHelper.beforeAccountInsert(trigger.new);
        } 
    }
    
    if(trigger.isDelete){
        if(trigger.isBefore){
            //AccountTriggerHelper.beforeDelete();
        }
    }
    
    if(trigger.isAfter){
        if(trigger.isInsert){
            AccountTriggerHelper.afterInsertOrDeleteRecord(trigger.new);
        }else if(trigger.isDelete){
            AccountTriggerHelper.afterInsertOrDeleteRecord(trigger.old);
        }
    }

}