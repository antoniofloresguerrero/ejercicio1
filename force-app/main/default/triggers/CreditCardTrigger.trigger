trigger CreditCardTrigger on Credit_Card__c (before insert,before update,after insert, after update) {
    
    if(trigger.isBefore){
        if(trigger.isInsert){
                CreditCardHandler.guardarTarjeta(Trigger.new);
        }
        if(trigger.isUpdate){

        }
    }
    if(trigger.isAfter){
        if(trigger.isInsert){

        }
        if(trigger.isUpdate){
            
        }
    }
}