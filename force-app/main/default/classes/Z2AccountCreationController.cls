public with sharing class Z2AccountCreationController {
    public Z2AccountCreationController() {

    }
    @AuraEnabled
    public static Account createRecords(Account accountObj){
        try {
            insert accountObj;
            return accountObj;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static List<Account> saveAccounts(List<Account> accountList){
        try {
            insert accountList;
            return accountList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Contact> getContacts(String accId){
        try {
            return [SELECT Id,AccountId,LastName,FirstName,Phone from Contact where AccountId =: accId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Account> saveMultipleAccounts(List<Account> accountList){
        try {
            insert accountList;
            return accountList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}