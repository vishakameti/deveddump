public with sharing class vishak1 {
   
    private list<account> myAccList{get;set;}
    public vishak1(){
    system.debug('in constructor');            
    }
    
    public list<account> getmyaccounts(){

         return [select id,name,billingaddress from account limit 100];
        
        
        
    }
    
}