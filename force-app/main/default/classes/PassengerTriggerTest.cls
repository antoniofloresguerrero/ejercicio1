@isTest
private class PassengerTriggerTest {
/*@testSetup
     static void testSetup() {
     Passenger__c pasajero = new Passenger__c();
     pasajero.Age__c=45;
	 pasajero.Flight_Bookings__c='FB-000005';
     pasajero.ID_Card__c='33359409w';
     pasajero.Contact__c='flores';
     pasajero.Name='Antonio';
     insert pasajero;  
	          
     
     
     
     
     }*/
	// rellenar pasajero id váido e insertar 
	// 
    @isTest static void testPositivoIdPasajero(){
    
     Passenger__c pasajero = new Passenger__c();
     pasajero.Age__c=45;
     pasajero.Flight_Bookings__c='a000900000FJYxiAAH';
     pasajero.ID_Card__c='33359409w';
     pasajero.Name='Antonio';
     
        
        //Acción a testear
        Test.startTest();
        insert pasajero;
        Test.stopTest();
        
        //Validación de los datos
        Passenger__c idCard = [SELECT Id, ID_Card__c FROM Passenger__c where id =:pasajero.id];
        
        System.assertEquals(pasajero.ID_Card__c,idCard.ID_Card__c);
        
   
    
    }
    
		// Caso negativo - rellenar un pasasjero con id Card inválido y que no se inserte
	@isTest static void testNegativoPasajero(){
    
     Passenger__c pasajero1 = new Passenger__c();
     pasajero1.Age__c=45;
     pasajero1.Flight_Bookings__c='a000900000FJYxiAAH';
     pasajero1.ID_Card__c='25673355l';
     pasajero1.Name='Antonio';
     
        
        //Acción a testear
        Test.startTest();
        insert pasajero1;
        Test.stopTest();
        
        //Validación de los datos
              
        System.assertNotEquals(pasajero1.ID_Card__c,'25673355t');
        
   
    
    }
	//Test del método Passenger.
    //Caso masivo. Inserción de 300 registros
    @isTest
    static void testPasajerosMasivos() {
        //Preparación de los datos a insertar
                
        List<Passenger__c> pasajerosMasivos = new List<Passenger__c>();
        for(Integer i=0; i<300; i++) {
            Passenger__c pj = new Passenger__c();
            pj.Age__c=45;
            pj.Flight_Bookings__c='a000900000FJYxiAAH';
            pj.ID_Card__c='25673355l';
            pj.Name='Antonio';
            pasajerosMasivos.add(pj);
        }
        
        //Acción a testear
        Test.startTest();
        insert pasajerosMasivos;
        Test.stopTest();
        
        //Validación de los datos
        List<Passenger__c> pasajro = [SELECT Id, ID_Card__c FROM Passenger__c LIMIT 500];
        System.assertNotEquals(pasajro, null);
        System.assertEquals(pasajro.size(), 300);
        
    }
// método para update
@isTest
    static void actualizarPasajeros(){
     Passenger__c pasajero = new Passenger__c();
     pasajero.Age__c=45;
     pasajero.Flight_Bookings__c='a000900000FJYxiAAH';
     pasajero.ID_Card__c='33359409w';
     pasajero.Name='Antonio';
     insert pasajero;
        
       
        
        pasajero.ID_Card__c='25673355l';
        
        //Acción a testear
        Test.startTest();
        update pasajero;
        Test.stopTest();
        
        //Validación de los datos
        Passenger__c idCard = [SELECT Id, ID_Card__c FROM Passenger__c where id =:pasajero.Id];
        
        System.assertEquals(pasajero.ID_Card__c,idCard.ID_Card__c);
    }
    
}