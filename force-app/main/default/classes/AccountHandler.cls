public with sharing class AccountHandler {
    public AccountHandler() {
    }

    public static Account insertNewAccount(String inputString) {

        try {
            Account a = new Account(Name = inputString);
            insert a;
            return a;

        } catch (DMLException e) {
            return null;
        }
    }
}
