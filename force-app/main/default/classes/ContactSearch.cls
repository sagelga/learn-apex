/*Method should find ID and Name fields from any contact that has a
lastName and mailing postal code (API Name: MailingPostalCode) matching*/
public class ContactSearch {

    public static List<Contact> searchForContacts(String lastName, String postalCode){
        // Query record from Contact
        List<Contact> listOfContact = [SELECT Id, FirstName FROM Contact WHERE LastName = :lastName AND MailingPostalCode = :postalCode];
        return listOfContact;
    }
}
