public with sharing class accountSearchClass {
    public accountSearchClass() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountSearch(String accName){
        String keyName = '%'+accName+'%';
        List<Account> accList = [SELECT id,Name FROM Account WHERE Name LIKE:keyName];
        return accList;
        
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> findContactsByAccountId(String accountId){
        return [SELECT Id,FirstName,LastName,Email,Phone FROM Contact WHERE AccountId=:accountId LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsonJayanth(){
        try {
            return [SELECT Id,name,type,Phone,Industry from Account limit 10];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}