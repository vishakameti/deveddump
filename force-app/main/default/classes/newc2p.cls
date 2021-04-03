public class newc2p {

     public List<PBUSADD__C> acclist {get;set;}
    

     public newc2p()
     {
         
         acclist = [SELECT Id, dealer_code__c, Org_Typ__c, related__r.rollup__c  FROM PBUSADD__c];
     }

}