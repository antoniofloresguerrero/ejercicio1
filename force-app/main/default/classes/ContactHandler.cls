public class ContactHandler {
public static void comprobarNif2(List<Contact> contactos){
       

        for(Contact contacto : contactos){
            if(!util.validarNif(contacto.Nif__c)){          
                contacto.addError('Nif no válido');
            }
          
    	
    }
        
    }
}