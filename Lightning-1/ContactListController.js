({
    // Function called on initial page loading to get contact list from server
        getContacts : function(component, event, helper) {
        // Helper function - fetchContacts called for interaction with server
            helper.fetchContacts(component, event, helper);
        },

    // Function used to create a new Contact
    newContact: function(component, event, helper) {
        // Global event force:createRecord is used
        var createContact = $A.get("e.force:createRecord");
        // Parameters like apiName and defaultValues are set
        createContact.setParams({
            "entityApiName": "Contact",
            "defaultFieldValues": {
                // use default values to assigned
                // ex- "LastName" : "Test Con"
            }
        });
        // Event fired and new contact dialog open
        createContact.fire();
    }
})