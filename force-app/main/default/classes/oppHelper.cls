public class oppHelper {
    
    public static void processData(list<OpportunityLineItem> oppProd,map<id,OpportunityLineItem> myMap){
        
        List<AggregateResult> aggRes = [select sum(totalprice) price,ftest__c,opportunityId
                                        from OpportunityLineItem where id in :myMap.keyset()
                                        group by opportunityId,
                                        ftest__c];
        list<id> oppIds = new List<id>();
        for(opportunityLineitem a: oppProd){
            if(a.OpportunityId!=null){
                oppIds.add(a.opportunityId);    
            }            
        }
        Map<id,opportunity> myOps = new Map<id,opportunity>([select id,comment__c from opportunity where id in :oppIds]);
               
    }
    
}