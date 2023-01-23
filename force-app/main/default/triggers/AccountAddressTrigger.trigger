/*
Name: AccountAddressTrigger
Object: Account
Events: before insert and before update
Condition: Match Billing Address is true
Operation: set the Shipping Postal Code to match the Billing Postal Code

Create an Apex trigger that sets an account’s Shipping Postal Code to match the Billing Postal Code
if the Match Billing Address option is selected.
*/
trigger AccountAddressTrigger on Account (before insert, before update) {

    // List<Account> updateAcct = new List<Account>();
    for (Account a : Trigger.new){
        // Store the data if the Match Billing Address (Match_Billing_Address__c) option is selected
        if (a.Match_Billing_Address__c = true) {
            a.ShippingPostalCode = a.BillingPostalCode;
            // updateAcct.add(a);
        }

    }
    // update updateAcct;
}
