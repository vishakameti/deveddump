public class getAccountList {
    
    @AuraEnabled
    
    public static list<account> accList(){
        system.debug('vishak ameti');
        return [select id,name,industry, annualrevenue,billingstate from account where name!='hello' and name >' ' limit 20];
    }

}