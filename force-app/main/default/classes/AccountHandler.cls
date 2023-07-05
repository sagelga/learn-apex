public with sharing class AccountHandler {
    public static void insertAccount(Integer newAccounts) {
        List<Account> addAccounts = new List<Account>();

       	Integer n = 1;
        while (n<=newAccounts){
            Account acc = new Account();
            acc.Name = 'Acme Inc ' + n;
            acc.AccountNumber = 'A00'+ n;
          	addAccounts.add(acc);
            n++;
            System.debug(acc);
        }

        insert addAccounts;
    }
}
