@IsTest
public with sharing class AccountProcessorTest {
    @IsTest
    public static void testCountContacts() {
        // Create test accounts
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            Account acc = new Account(Name = 'Test Account ' + i);
            accounts.add(acc);
        }
        insert accounts;
        
        // Create test contacts
        List<Contact> contacts = new List<Contact>();
        for (Account acc : accounts) {
            for (Integer i = 0; i < 3; i++) {
                Contact con = new Contact(FirstName = 'Test',
                                          LastName = 'Contact ' + i, 
                                          AccountId = acc.Id);
                contacts.add(con);
            }
        }
        insert contacts;

        // Call the method to count contacts
        List<Id> accountIds = new List<Id>();
        for (Account acc : accounts) {
            accountIds.add(acc.Id);
        }

        // Start the test
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();

        // Verify that the Number_Of_Contacts__c field is updated correctly
        List<Account> updatedAccounts = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id IN :accountIds];
        for (Account acc : updatedAccounts) {
            Assert.areEqual(acc.Number_Of_Contacts__c, 3);
        }
    }
}
