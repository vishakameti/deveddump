@Istest
public class AccountProcessorTest {

    public static List<account> testDatafactory(){
        list<account> accList = new List<account>();
        for(integer i=0;i<100;i++){
            account a = new account();
            a.Name = 'Test Account '+i;
            accList.add(a);
        }
        insert accList;
        system.debug(accList.size()+'is the size in test insert');
        List<contact> conList = new List<contact>();
        for(account myAcc: accList){
            for(integer k=0;k<5;k++){
                contact c = new contact();
                c.AccountId = myAcc.id;
                c.Lastname = 'contact '+k+' for Account '+myAcc.name;
                conList.add(c);
            }
        }
        insert conList;
        system.debug(conList.size()+'is the size in conList test before insert');
        return accList;
    }
    
    @isTest
    public static void testExecute(){
        test.startTest();
        List<account> accList1 = testDatafactory();
        system.debug(accList1.size()+'is the size in test insert');
        list<id> accIds = new list<id>();
        for(account a:accList1){
            accIds.add(a.id);
            
        }
        system.debug(accIds.size()+'is the size in list test insert');
        accountProcessor.countContacts(accIds);
        test.stoptest();
    }

}