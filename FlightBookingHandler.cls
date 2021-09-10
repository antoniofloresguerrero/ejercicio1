public class FlightBookingHandler {
    // crear lista del objeto de vuelos
    public static void ContactAndAccount(List<Flight_Bookings__c> listadevuelos){
        List<Id> listaIdContacto = new List<Id>();
        for(Flight_Bookings__c vuelo : listadevuelos){
            if(vuelo.Contact__c!=null){
                listaIdContacto.add(vuelo.Contact__c);
        }
   
        }
	  	List<Contact> contactosVuelos =[Select Id,AccountId from Contact where id in: listaIdContacto];
        Map<Id,Id> mapaIdIContactoIdAccount = new Map<Id,Id>();        
        for(Contact contactoAsociado: contactosVuelos){
            if(contactoAsociado!=null){
                mapaIdIContactoIdAccount.put(contactoAsociado.Id,contactoAsociado.AccountId);
            	//cambio hacia abajo
                    }
        }
        for(Flight_Bookings__c vueloCompleto : listadevuelos){
            vueloCompleto.Account__c =  mapaIdIContactoIdAccount.get(vueloCompleto.Contact__c);
        }
    }
    public static void ComprobarModified(List<Flight_Bookings__c> vueloComparar, Map<Id, Flight_Bookings__c> vuelosAntiguos){
        for(Flight_Bookings__c vuelor: vueloComparar){
            if(vuelor.Origin__c!= vuelosAntiguos.get(vuelor.id).Origin__c ||  vuelor.Destination__c!= vuelosAntiguos.get(vuelor.id).Destination__c){
                vuelor.Modified__c=true;
            }
        }
        
    }
	

}
