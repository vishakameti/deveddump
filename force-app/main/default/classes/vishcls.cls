public with sharing class vishcls{

      
    public static void vishcls1(){
        
        integer acc = [select count() from account];
        
        system.debug('acc is'+acc);
        
        
                
    }    
}