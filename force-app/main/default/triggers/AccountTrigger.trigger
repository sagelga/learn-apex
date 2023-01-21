trigger AccountTrigger on Account (after update) {
    for (Account accRecord : Trigger.new){
	 // Skips that Account if there is no Phone Number value change.
	 
	 // // If the code still proceeds to this point, this means the Phone Number actually changed.
	  
	 // // Get all Contacts Record that have the same name as edited Account
	  
	 // // loop through all Contact, and update every Contact's Assistant Phone
	  
	 // // Finally, update value in sObject
	}
	 //update targetContact;
}