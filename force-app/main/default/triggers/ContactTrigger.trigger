trigger ContactTrigger on Contact (before insert,before delete,after Insert,after delete) {
    
    if(trigger.isDelete){
        if(trigger.isBefore){
            ContactTriggerHelper.beforeDeleteContact(trigger.old);
        }
    }
    
    if(trigger.isAfter){
        if(trigger.isInsert){
            ContactTriggerHelper.afterInsertOrDeleteRecord(trigger.new);
        }else if(trigger.isDelete){
            ContactTriggerHelper.afterInsertOrDeleteRecord(trigger.old);
        }
    }

}