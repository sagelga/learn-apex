// This class will be used for updating the case counter in Contact.
// Contact |--< Case Contact Name
public class CaseTriggerHandler {
    /* This method skips the part where the case changes the owner (Contact) */
    public static void afterInsertDelete(List<Case> newCaseList){

        System.debug(newCaseList);
        System.debug(newCaseList[0].ContactId);
        // String contactTarget = [SELECT ContactId FROM Case WHERE Id IN :newCaseList].ContactId;

        // get all the Contacts that have a case in update group
        String contactTarget = newCaseList[0].ContactId;
        // System.debug(contactTarget);

        // calculate how many Case is this Contact have
        List<Case> caseList = [SELECT Id FROM Case WHERE ContactId = :contactTarget];
        // System.debug(caseList);

        Integer caseCount = caseList.size();
        // System.debug(caseCount);

        // update the Contact's case counter
        Contact c = [SELECT Id, Case_Count__c FROM Contact WHERE Id = :contactTarget];
        c.Case_Count__c = caseCount;

        update c;
    }

    /* This method must think about the owner of the case is changed to someone else */
    public static void afterUpdate(List<Case> newCaseList, Map<Id, Case> oldCaseMap){
    // public static void afterUpdate(List<Case> newCaseList, List<Case> oldCaseList){
        System.debug('newCaseList');
        System.debug(newCaseList);
        System.debug('oldCaseMap');
        System.debug(oldCaseMap);
        // System.debug('oldCaseList');
        // System.debug(oldCaseList);

        // get the contact that this case was triggered in update group
        // assuming this will return only 1 record, which will be the new Contact Name (Id)
        String contactTarget = [SELECT ContactId FROM Case WHERE Id IN :newCaseList].ContactId;
        // System.debug(contactTarget);

        Case oldCaseList = oldCaseMap.get(newCaseList[0].Id);
        System.debug(oldCaseList);

        // check if this case's Contact has changed
        String newCaseContactId = newCaseList[0].ContactId;
        System.debug(newCaseContactId);
        String oldCaseContactId = oldCaseList.ContactId;
        System.debug(oldCaseContactId);
        Boolean caseChangeContact = !newCaseContactId.equals(oldCaseContactId);


        // If the Contact has been changed, this means we need to calculate 2 Contacts
        // else we are dealing with 1, just like afterInsertDelete().
        if (caseChangeContact){
            System.debug('caseChangeContact');
            // we update old Contact and new Contact
            newCaseList.add(oldCaseList);
            System.debug(newCaseList);
        } 


        // calculate how many Case is this Contact have
        List<Case> caseList = [SELECT Id FROM Case WHERE ContactId = :contactTarget];
        // System.debug(caseList);

        Integer caseCount = caseList.size();
        // System.debug(caseCount);

        // update the Contact's case counter
        Contact c = [SELECT Id, Case_Count__c FROM Contact WHERE Id = :contactTarget];
        c.Case_Count__c = caseCount;

        update c;
    }
        //     Map<String, Case> caseMap = new Map<String, Case>();

        //     for (Case cas : newCaseList) {
            //         // Query Contact that have this case
            //         List<Contact> contactTarget = [SELECT Id FROM Contact WHERE Id = :cas.Id];

            //         // Find related case that this contactTarget have
            //         List<Case> relatedCase = [SELECT Id FROM Case WHERE Contact.Id = :contactTarget[0].Id];

            //         // //old value from case AKA Prayuth
            //         // for(Case case: relatedCase){
                //         //     caseMap.put(case.Id, case);
                //         // }

                //         // //replace prayuth with Mr.B
                //         // if(caseMap.containsKey(cas.Id)){
                    //         //     caseMap.put(cas.Id, cas);
                    //         // }

                    //         // Count the number of cases that this contact have
                    //         Integer relatedCaseCount = relatedCase.size();

                    //         // Update the case counter (API Name: Case_Count__c) in Contact
                    //         contactTarget[0].Case_Count_c = relatedCaseCount;

                    //         update contactTarget;
                    //

}