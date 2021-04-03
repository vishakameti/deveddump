trigger cont2 on Contact (after insert,after update) {
    list<id> accId = new list<id>();
    for(contact c:trigger.new){
        accId.add(c.accountId);
    }
    
    List<AggregateResult> aggRes = [select count(id) count1,email,accountId from contact where 
                                    accountId in :accId group by email,accountId];
    system.debug(aggRes.size());
    
    Map<id,mywrapper> myMap = new Map<id,mywrapper>();
    for(AggregateResult arr: aggRes ){
        integer count1 = (integer) arr.get('count1');
        id accountId = (id) arr.get('accountId');
        system.debug('accountId'+accountId);
        system.debug('count1'+count1);
        string email = (string) arr.get('email');
        if(count1>1){
            mywrapper a = new mywrapper();
            a.accId = accountId;
            a.email = email;
            a.count = count1;
            myMap.put(accountId, a);
        }
    }
    list<testObject__c> myList = new List<testObject__c>();
    for(id a:myMap.keyset()){
        testObject__c b = new testObject__c ();
        b.acc__c = a;
        b.count__c = myMap.get(a).count;
        b.email__c = myMap.get(a).email;
        myList.add(b);
    }
    insert myList;
    
    public class mywrapper{
        public id accId;
        public string email;
        public integer count;
    }
}