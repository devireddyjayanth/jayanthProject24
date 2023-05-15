public class ContactTriggerHelper {
    //When we are trying to delete any contact record whoes source 
    //is SAP External it should throw error
    public static void beforeDeleteContact(List<Contact> conList){
        
        List<Contact> con = [SELECT Id,AccountId,Source__c,Account.Source__c from contact where Id=: conList];
        for(Contact c : con){
            if(c.Source__c == 'Sfdc SAPExternal'||c.Account.Source__c == 'Sfdc SAPExternal'){
                c.addError('you cannot delete contact');
            }
        }  
    }
    public static void afterInsertOrDeleteRecord(List<Contact> conList){
        Set<Id> accId = new Set<Id>();
        for(Contact con : conList){
            if(con.AccountId != null){
                accId.add(con.AccountId);
            }
        }
        List<Account> accList = [SELECT Id,No_of_Contacts__c,(SELECT Id,AccountId from Contacts)
                                from Account where Id =:accId];
        for(Account acc : accList){
            acc.No_of_Contacts__c = acc.contacts.size();
        }
        update accList;
    }
}