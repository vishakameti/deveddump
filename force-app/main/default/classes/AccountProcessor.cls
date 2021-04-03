public class AccountProcessor {
    
    @future    
    public static void countContacts(List<id> a){
        List<Account> accList = new List<Account>();
         system.debug(a.size()+'is after futre method count');
        for(id myId:a){
            account acc= new account();
            integer contactC = [select count() from contact where account.Id = :myId];
            acc.id=myId;
            acc.Number_of_Contacts__c = contactC;
            accList.add(acc);
        }
        update accList;
    } 

}