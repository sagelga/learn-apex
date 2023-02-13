public with sharing class AccountProcessor {
    @future
    public static void futureMethod(List<Id> recId) {
        List<Account> accList = [SELECT Id FROM Account WHERE Id IN :recId];
        List<Account> updateList = new List<Account>();
        Map<Id, Integer> accountCountMap = new Map<Id, Integer>();

        for (Account acc : accList) {
            accountCountMap.put(acc.Id, a.Id.size());
        }

        for (Id accountId : accountCountMap.keySet()) {
            Account account = new Account(Id = accountId, Contact_Count__c = accountCountMap.get(accountId));
            accountsToUpdate.add(account);
        }

        update updateList;
    }
}
