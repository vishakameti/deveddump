public class testController {

    public String Teststring {get;set;}
    public List<PBUS__c> acclist {get;set;}
       
    public testController()
    {
        acclist = [select id,name,(select id,name,org_typ__c from PBUSADD__r) from PBUS__C where id in (select related__C  from PBUSADD__C)];
    }  
}