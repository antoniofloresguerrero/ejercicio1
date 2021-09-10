public class PassengerHandler{
    // 4.Trigger en la entidad ‘Pasajeros’ para rellenar el campo ‘Contacto’ automáticamente, si existe algún contacto en la entidad contact con el nif igual al introducido en el campo nif de la entidad ‘Pasajeros’.
    //  Al insertar y modificar en la entidad ‘Pasajeros’
    public static void comprobarNif(List<Passenger__c> pasajeros){
       

        for(Passenger__c pasajero : pasajeros){
            if(!util.validarNif(pasajero.ID_Card__c)){          
                pasajero.addError('Nif no válido');
            }
          
    	
    }
        
    }    
//actualizar nif e idcard    
    public static void actualizarNif(List<Passenger__c> pasajeros){
        List<String> idCard = new List<String>();
        for(Passenger__c idCarPasajero : pasajeros){
            if(idCarPasajero.ID_Card__c!=null){
                idCard.add(idCarPasajero.ID_Card__c);
            }
        }
    	List<Contact> contactosNif =[select id,Nif__c from Contact where Nif__c in: idCard];
    	Map<String,Id> mapas = new Map<String,Id>();
        for(Contact contactosdelnif : contactosNif){
            if(contactosdelnif!=null){
                mapas.put(contactosdelnif.Nif__c,contactosdelnif.id);
            }
        }
        for(Passenger__c pasajer: pasajeros){
            pasajer.Contact__c = mapas.get(pasajer.ID_Card__c) ;
                                           }
    }
}