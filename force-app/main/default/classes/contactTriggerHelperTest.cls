@istest
public class contactTriggerHelperTest {
    
    //test data set up method to insert accounts and contacts
    //accCount - total test accounts to be inserted
    //conCount - total test contacts to be inserted for each account
    
    public static list<account> insertAccCon(integer accCount, integer conCount){
        
        List<account> accList = new List<account>();
        for(integer i=0;i<accCount;i++){
            account acc = new account(name='test acc'+i);
            accList.add(acc);
        }
        insert accList;
        
        List<contact> contList = new List<contact>();
        
        for(account acco:accList){
            for(integer j=0;j<conCount;j++){
                contact c = new contact(lastname='my contact'+j,accountId=acco.id);                
                contList.add(c);
            }            
        }
        insert contList;        
        return accList;
    }
    
    @istest
    public static void testInsert(){
        //test the trigger with when contacts are inserted;
        test.startTest();       
        List<account> accList1 = insertAccCon(20,20);
        test.stopTest();
        for(account a : [select id,contactCount__c from account]){
            //assert to check if the contact counts on each account is as expected
            system.assertEquals(20, a.contactCount__c);
        }                
    }
    
    @istest 
    public static void testdelete(){
        list<account> accList2 = insertAccCon(20,20); 
        test.startTest();
            delete [select id from contact];
        test.stopTest();
        for(account a : [select id,contactCount__c from account]){
            //assert to check if the contact counts on each account is as zero since all contacts are deleted
            system.assertEquals(0, a.contactCount__c);
        }    
        
    }
    
    @istest
    public static void testUpdate(){
        list<account> accList2 = insertAccCon(20,20);
        test.startTest();
        list<contact> conList3 = [select id,accountId from contact];
        for(contact c: conList3){
               c.accountId = null;
        }
        update conList3;
        test.stopTest();
        for(account a : [select id,contactCount__c from account]){
            //assert to check if the contact counts on each account is as zero since all contacts are updated made private 
            //contacts with no accounts mapping
            system.assertEquals(0, a.contactCount__c);
        }  
    }
}