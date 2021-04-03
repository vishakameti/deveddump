public class getAccount {
    @AuraEnabled
    
    public static List<account> getAccount1(){
        
        return [SELECT Id, Name, Type, BillingStreet, BillingCity, BillingState FROM Account where name > ' ' limit 10];
        
    }
    
    public account getAccount2(){ return null;}
    
    
    @AuraEnabled
    
    public static void deleteAcc(id Accid){
        
        account delA = [select id from account where id=:Accid];
        
        try{
            delete delA;
        }
        catch(exception a){
            system.debug('delete exception');
        }
        
    }
}