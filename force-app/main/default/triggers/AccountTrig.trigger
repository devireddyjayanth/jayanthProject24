trigger AccountTrig on Account (before insert) {
    
    if(trigger.isInsert){
        if(trigger.isBefore){
            //AccountTrigHelper.beforeAccountCreation(trigger.new);
            
        }
        
    }

}