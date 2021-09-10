trigger FlightBookinsTrigger on Flight_Bookings__c (before insert, before update, after insert, after update) {
    if(trigger.isBefore){
        if(trigger.isInsert){
            FlightBookingHandler.ContactAndAccount(trigger.new);
        }        
        if(trigger.isUpdate){
            FlightBookingHandler.ComprobarModified(trigger.new, trigger.oldMap);
        }
    }
    if(trigger.isAfter){
        if(trigger.isInsert){
             
        }        
        if(trigger.isUpdate){
            
        }
    }


}