public with sharing class z1AccountController {
    public z1AccountController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        try {
            return [SELECT Id,Name,phone,type,Industry from Account limit 10];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Integer addTwoNumbers(Integer fnumber,Integer snumber){
        try {
            return (fnumber + snumber);
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable = true)
    public static Account createAccountBasedOnApex(Account accObject){
        try {
            insert accObject;
            return accObject;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Account> saveMultipleAccounts(List<Account> accList){
        try {
            insert accList;
            return accList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> contactList(){
        try {
            return [SELECT Id,FirstName,LastName,Phone FROM Contact where FirstName != null ORDER BY CreatedDate DESC];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void deleteContacts(List<Id> contactIds){
        try {
            List<Contact> conList= [SELECT Id from Contact where Id=:contactIds];
            delete conList;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}