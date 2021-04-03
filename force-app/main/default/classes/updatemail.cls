public class updatemail {
   static list<contact> conList = new list<contact>();    
    public static void emailUpdate(List<account> accList,Map<id,account> accnewmap){
        

        for(contact b: [select id,name,email,account.testem__c from contact where accountId in :accnewmap.keyset()]){
                
            contact c = new contact();
            c.email = b.account.testem__c;
            c.id = b.id;
            conList.add(c);
        }
        try{
        update conList;    
        }catch(exception e){
            system.debug('general exception'+e);
        }                
    }
}