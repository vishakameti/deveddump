public class getAccountList {
    
    @AuraEnabled
    
    public static list<account> accList(){
        system.debug('vishak ameti');
       list<account> a=[select id,name,industry, annualrevenue,billingstate from account where name!='hello' and name >' ' limit 20];
       
       return a;
    }

}