trigger PassengerTrigger on Passenger__c (before insert, before update, after insert, after update) {
    if(trigger.isBefore){
        if(trigger.isInsert || trigger.isUpdate){
            PassengerHandler.comprobarNif(trigger.new);
            PassengerHandler.actualizarNif(trigger.new);
        }
       
   						 }
        if(trigger.isAfter){
   	 		if(trigger.isInsert){
            
        }
        if(trigger.isUpdate){
            
        }
   							 }
}