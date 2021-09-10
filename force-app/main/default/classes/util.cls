public class util {

    public static boolean validarNif( String nif){
        boolean salida= false;
        //comprobar longitud
        if(nif.length()==9){
        	String numerosNif=nif.substring(0, 8);    
        	system.debug(numerosNif);
        	String letraNif = nif.substring(8);
            system.debug(letraNif);
            
            // Comprobar sólo número
            if(numerosNif.isNumeric()){
                system.debug('es número');
               
                // Comprobar último dígito es letra
                if(letraNif.isAlpha()){
                    system.debug('es letra');
                    // máyuscula última letra
                    letraNif.capitalize();
                    system.debug(letraNif);
                    
                    // hacer módulo 23
                    String cadenaLetra='TRWAGMYFPDXBNJZSQVHLCKE';
                    
                    Integer numerodelNif = Integer.valueOf(numerosNif);
					Integer numeroValor = math.mod(numerodelNif,23);
                    
                    system.debug(numeroValor);
                    Integer Modulo1 = numeroValor +1;
                    system.debug(cadenaLetra.substring(numeroValor,Modulo1));
                    //RESTO	012345678910111213141516171819202122	

					String letraComparar = cadenaLetra.substring(numeroValor,Modulo1);
					// Comprobar letra y número
					if(letraComparar.equalsIgnoreCase(letraNif))
                    salida=true;
                }
            }
        }
    
    return salida;
    }
}