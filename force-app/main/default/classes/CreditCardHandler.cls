public  class CreditCardHandler {
    public static void newOpportunityCard (List<Credit_Card__c> cardList){
        //1- Creacion de lista de CREDIT CARDS , que va tener implicitamente
        //una lista de OWNERS y de CONTACTOS
        //Se crea una lista de id's para guardar la información de los diferentes owners y contactos,
        // que van pasando y que
 		//son campos (DE TIPO ID) de Credit Card
        //Lista de Owner
        Set<Id> ownerList = new Set<Id>();
        //Lista de contactos
        Set<Id> contactList = new Set<Id>();
        //POR BUENAS PRACTICAS en lugar de usar LIST , se pueda usar SET  para cerciorarnos de que no existan id's duplicados puesto que este es un numero unico
       
        //Bucle for para añadir lista de Owners y contactos a la de credit cards
        for (Credit_Card__c card : cardList){
              
            ownerList.add(card.OwnerId);
            contactList.add(card.Contact__c);
            
        }
        //2-Creacion de mapas para poder comparar y en consecuencia filtrar la informacion de las tarjetas con 
        //las características indicadas
        //Mapa para el requisito del OWNER
        Map<Id,User> mapaOwner =  new Map<Id,User>([SELECT Id , Name from User where Id in :ownerList]);
        
        //Mapa para el requisito del CONTACTO
        Map<Id,Contact> mapaContact = new Map<Id,Contact>( [SELECT Id , Name ,AccountId, Premium__c  from Contact where Premium__c =TRUE AND  Id in :ContactList]);
      
        //Se selecciona el accountId en la QUERY porque se necesita posteriormente para los campos
        //de la oportunidad

        //POR BUENAS PRACTICAS , PARA LOS MAPAS LA QUERY QUE QUERAMOS METERLE SE LE PONE DIRECTAMENTE ENTRE LOS PARÉNTESIS
        //NO SE LLAMA al mapa y se le mete después

        //3-Creacion de la lista de oportunidades que se van a ir creando con las tarjetas que cumplan
        //los requisitos.  Si se pone dentro del bucle, SOLO podría usarse dentro del mismo
        
        List<Opportunity> oppCreatedList = new List <Opportunity>();
        
        //4- Bucle for con el que se va recorriendo la cardList y se va filtrando y dejando las que cumplan los requisitos
        // en base a la comparación con los MAPAS
        
        for (Credit_Card__c completeCard : cardList){
            //PRIMERA CONDICIÓN-> QUE EL OWNER SEA DIFERENTE A ACCENTURE TEST
            //** En el .get del mapa se trae el objeto card con su campo Owner Id , una vez traido,
            //fuera del get , se llama al nombre

            if(mapaOwner.get(completeCard.OwnerId).name!='Acenture Test'){
                //SEGUNDA CONDICIÓN-> QUE EL CONTACTO ASOCIADO A LA TARJETA 
                //TENGA EL CAMPO PREMIUM A TRUE
               if(mapaContact.containsKey(completeCard.Contact__c)){
                
                //** El metodo CONTAIN KEY va devolver las tarjetas que tengan un contacto asociado
                // E implicitamente esos contactos tienen el campo Premium a true porque SOLO
                // se trajeron los que cumplian ese requisito al MAPA que se está usando

                //OTRA MANERA (SEGUNDA CONDICIÓN) -> Cuando se hizo la query en el mapa de contactos
                //se especificó DIRECTAMENTE la condición de que los contactos del mapa tuviesen
                // el campo PREMIUM a true. Sí quiesemos especifica esta condicion directamente sobre
                // la sentencia if , usariamos un metodo GET de la siguiente manera:
               // if(mapaContact.get(completeCard.Contact__c).Premium__c==TRUE){

                //5- Creacion de la oportunidad requerida y en consecuencia añadida a una lista que es lo que recibe en programa
                //Oportunidad con los campos requeridos
                Opportunity oppCreated = new Opportunity();
                
                //Como los objetos de OPORTUNIDAD y CONTACTO no están linkados de manera previa;
                // ha de indicarse su relación , la cual se realiza mediante los Id's (primary key)
                oppCreated.ContactId= completeCard.Contact__c;
                
                oppCreated.CloseDate= Date.newInstance(Integer.valueOf(completeCard.Expiration_Year__c), Integer.valueOf(completeCard.Expiration_Month__c) , 1);
                oppCreated.StageName='Not started';
                oppCreated.AccountId = mapaContact.get(completeCard.Contact__c).AccountId;
                oppCreated.Name= mapaContact.get(completeCard.Contact__c).Name ;
               
                //Se añade esa oportunidad a la lista
                oppCreatedList.add(oppCreated);
              
                }
               
              

            }
        }
              //6- Se comprueba sí la lista de oportunidades tiene OPORTUNIDADES o 
                 //está vacía.
                 //Si se han creado oportunidades se inserta en la base de datos
                 if(oppCreatedList.size()>0){
                    insert oppCreatedList;
                    //** POR BUENAS PRÁCTICAS , nunca se ha de meter un insert dentro de un Bucle for
             }
    }
    
    
}