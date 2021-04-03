public class opportunityList {
    public list<id> oppList1{get;set;}
    
    public list<opportunity> getOpportunities(){
        
       List<opportunity> oppList = [select id,Name,stageName,closedate,owner.name,recordtypeId from opportunity];
        
        List<opportunity> recordTypelist = [select recordtypeId from opportunity ];
        
        for(opportunity opp : recordTypelist){
            oppList1.add(opp.recordtypeid);
            
        }
       return oppList;
    }
    
}