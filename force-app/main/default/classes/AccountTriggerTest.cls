@isTest
public class AccountTriggerTest {
    
    @isTest
    public static void beforeInsertTestAccount(){
        
        Account acc1 = new Account(name='Jayanth',Industry='Banking');
        Account acc2 = new Account(name='jayanth-1',Industry='Energy');
        
        insert acc1;
        insert acc2;
        
        Account a1 = [SELECT Id,annualRevenue from Account where Id=: acc1.Id];
        System.assertEquals(100000, a1.AnnualRevenue);
        Account a2 = [SELECT Id,annualRevenue from Account where Id=: acc2.Id];
        System.assertEquals(50000, a2.AnnualRevenue);
    }

}