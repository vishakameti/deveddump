public class contactTriggerHelper {
    
    public static list<account> myaccList;  
    
    public static void contactProcess(List<contact> conList,list<contact> oldconList){
        
        set<id> accIds = new set<id>();
        //get the list of account id's for contacts which are not private contacts
        for(contact c : conList){
            if(c.accountId!=null){
                accIds.add(c.accountId);
            }
        }
        
        if(accIds.size()==0){
            for(contact c:oldconList){
                if(c.AccountId!=null){
                    accIds.add(c.AccountId);
                }
            }
            
        }
        //aggregate result to get the count of contacts for each account
        
        List<aggregateResult> aggResult = [select count(id) countofacc ,AccountId from contact 
                                           where accountId in :accIds 
                                           group by accountId];
        
        
        integer aggSize = aggResult.size();
        
        myaccList = new List<account>();
        // if one of the contacts tagged to account is deleted, then aggregate result will be non zero, else zero.  
        // if the size is zero, all the contacts are deleted by bulk together so else part is used
        
        system.debug(accIds.size());
        if(aggSize>0){
            for(aggregateResult arr:aggResult){
                
                account a = new account();
                a.id = (id) arr.get('AccountId');
                a.ContactCount__c = (double) arr.get('countofacc');
                myaccList.add(a);    
                
            } 
        }else{
            for(id i:accIds){
                account a = new account();
                a.id = i;
                a.ContactCount__c =0;
                myaccList.add(a);
            }
        }
        
        try{
            update myaccList;
        }catch(exception e){
            system.debug('exception occurred'+e);
        }
    }
    
}