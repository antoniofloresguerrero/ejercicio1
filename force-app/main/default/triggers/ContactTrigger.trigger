trigger ContactTrigger on Contact (before insert) {
if(trigger.isBefore){
        if(trigger.isInsert || trigger.isUpdate){
            ContactHandler.comprobarNif2(trigger.new);
           
        }
       
   						 }
        if(trigger.isAfter){
   	 		if(trigger.isInsert){
            
        }
        if(trigger.isUpdate){
            
        }
   							 }
}