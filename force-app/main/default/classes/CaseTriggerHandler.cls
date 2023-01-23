// This class will be used for updating the case counter in Contact.
// Contact |--< Case Contact Name
public class CaseTriggerHandler {

    public static void afterInsert(List<Case> newCaseList){
        List<String> contactIds = new List<String>();
        for(Case c: newCaseList){
            contactIds.add(c.ContactId);
        }

        // List<Contact> contactList = [SELECT Id, Name FROM Contact WHERE Id IN :contactIds];

        List<Case> caseList = [SELECT Id, ContactId FROM Case WHERE ContactId IN :contactIds];

        Map<String, Integer> contactCount = new Map<String, Integer>();
        for(Case c: caseList){
            if(contactCount.containsKey(c.ContactId)){
                Integer count = contactCount.get(c.ContactId) +1;
                contactCount.put(c.contactId, count);
            } else {
                contactCount.put(c.contactId, 1);

            }
        }

        Set<String> key = contactCount.keySet();
        List<Contact> updateList = new List<Contact>();
        for (String k : key){
            Contact c = new Contact();
            c.Id = k;
            c.Case_Count__c = contactCount.get(k);
            updateList.add(c);
        }
        update updateList;

    }

    public static void afterDelete(List<Case> newCaseList){
        List<String> contactIds = new List<String>();
        List<String> deletedCaseIds = new List<String>();
        for(Case c: newCaseList){
            contactIds.add(c.ContactId);
            deletedCaseIds.add(c.Id);
        }

        List<Case> caseList = [SELECT Id, ContactId FROM Case
                                WHERE ContactId IN :contactIds
                                AND Id NOT IN :deletedCaseIds];

        Map<String, Integer> contactCount = new Map<String, Integer>();
        for(Case c: caseList){
            if(contactCount.containsKey(c.ContactId)){
                Integer count = contactCount.get(c.ContactId) +1;
                contactCount.put(c.contactId, count);
            } else {
                contactCount.put(c.contactId, 1);

            }
        }
    }

    public static void afterUpdate(List<Case> newCaseList){


        Map<String, Integer> contactCount = new Map<String, Integer>();
        for(Case c: caseList){
            if(contactCount.containsKey(c.ContactId)){
                Integer count = contactCount.get(c.ContactId) +1;
                contactCount.put(c.contactId, count);
            } else {
                contactCount.put(c.contactId, 1);

            }
        }
    }
}
