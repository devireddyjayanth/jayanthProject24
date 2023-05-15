public with sharing class MassDeleteContact {
    public MassDeleteContact() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
        try {
            return [SELECT Id,FirstName,LastName,Title,Phone,Email FROM Contact where FirstName != null ORDER BY CreatedDate DESC];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void  deleteSelectedContacts(List<Id> selContactIdList){
        try {
            List<Contact> conList = new List<Contact>();
            conList = [SELECT Id from Contact where id=:selContactIdList];
            if(conList != null && conList.size()>0){
                delete conList;
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        try {
            return [SELECT Id,FirstName,LastName,Phone FROM Contact where FirstName != null ORDER BY CreatedDate DESC];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void deleteContacts(List<Id> contactsIds){
        try {
            List<Contact> conList = [SELECT Id FROM Contact where Id=:contactsIds];
            if(conList.size()>0){
                delete conList;
            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}