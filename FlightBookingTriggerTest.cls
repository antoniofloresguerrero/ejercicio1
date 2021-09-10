@isTest
private class FlightBookingTriggerTest {

	// Caso 1. positivo.insertar un Flight Booking y los datos se han rellenado bien
    @isTest static void insertarPositivo(){
       //Crear cuenta
       Account cuenta = new Account();
       cuenta.Name = 'Siemens'; 
       insert cuenta;	
    	// Crear contacto
       Contact contacto = new Contact();
       contacto.LastName = 'Flores';
       contacto.AccountId = cuenta.Id; // relación id del contacto con el id de la cuenta
       insert contacto;
       // Crear vuelo
       Flight_Bookings__c vuelo = new Flight_Bookings__c();
       vuelo.Class__c='Turista';
       vuelo.Contact__c=contacto.id;
	    vuelo.Departure_Date__c= DateTime.newInstance(2021,10,19);        
       vuelo.Destination__c ='Miami';
       vuelo.Origin__c ='Atenas';// poner valores que están en el picklist
       vuelo.Notes__c='ya';
       
       Test.startTest();
       insert vuelo;
       Test.stopTest();
        
        //Verificar
        
         Flight_Bookings__c vuelosVerificar = [Select Id,Account__c from Flight_Bookings__c where id=:vuelo.Id];
    	System.assertEquals(cuenta.id,vuelosVerificar.Account__c,'');
    }
   // verificar cambio de origen o destino 

   @isTest static void actualizarVueloPositivo() {
    Account cuenta = new Account();
       cuenta.Name = 'Siemens'; 
       insert cuenta;	
    	
       // Crear contacto
       Contact contacto = new Contact();
       contacto.LastName = 'Flores';
       contacto.AccountId = cuenta.Id; // relación id del contacto con el id de la cuenta
       insert contacto;
       
       // Crear vuelo
       Flight_Bookings__c vuelo = new Flight_Bookings__c();
       vuelo.Class__c='Turista';
       vuelo.Contact__c=contacto.id;
	    vuelo.Departure_Date__c= DateTime.newInstance(2021,10,19);        
       vuelo.Destination__c ='Miami';
       vuelo.Origin__c ='Atenas';// poner valores que están en el picklist
       vuelo.Notes__c='ya';
        
       insert vuelo;
      
      // vuelo.Origin__c = 'Munich';// cambio el origen para verificar el cambio
       vuelo.Destination__c ='Munich';
       
       Test.startTest();
       update vuelo;
       Test.stopTest();
		
   	   Flight_Bookings__c vueloAVerificar = [Select Id, Modified__c from Flight_Bookings__c where Id=:vuelo.Id];

	   System.assertEquals(true, vueloAverificar.Modified__c,'');
   
   }


}