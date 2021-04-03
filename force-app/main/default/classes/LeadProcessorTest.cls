@istest
public class LeadProcessorTest {
    
    public static void testlead(){
        list<lead> leadList = new list<lead>();
        for(integer i=0;i<200;i++){
            
            lead a = new lead();
            a.lastname='test'+i;
            a.FirstName='test1'+i;
            a.Company='wipro'+i;
            leadList.add(a);
            
        }
        try{
        insert leadList;
        }catch(exception e){
            system.debug('e'+e);
        }
    }
    
    @istest
    public static void testLead1(){
        test.startTest();
        testlead();
        LeadProcessor a = new LeadProcessor();
        database.executeBatch(a);
        
        test.stopTest();
        for(lead a1: [select id,leadsource from lead]){
            system.assertEquals('Dreamforce', a1.LeadSource);
        }
        
    }

}