trigger CreditCardTrigger on Credit_Card__c (after insert) {
    
  
    if(trigger.isAfter){
       
             CreditCardHandler.newOpportunityCard(Trigger.new);
        }
      
    
}

