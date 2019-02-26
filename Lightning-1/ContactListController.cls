// Apex Controller for Contact List Lightning Component
public class ContactListController {
        
    @AuraEnabled
    public static List<Contact> getContactList(List<Id> accountIds) {
        // Getting the list of contacts from where Id is in accountIds

         // your code goes here

         // Returning the contact list
        return contactList;
    }
}