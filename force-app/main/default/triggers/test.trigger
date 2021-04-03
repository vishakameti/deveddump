trigger test on Contact (after insert,after update) {
    list<id> accId = new List<id>();
    List<aggregateresult> aggres = [select count(id) count1,email,accountId from
                                   contact where accountId In :accId group by accountId,email];
    
    List<testObject__c> testObj1 = new list<testObject__c>();
    
    for(aggregateresult agg : aggres){
        testObject__c b = new testObject__c();
        b.count__c = (decimal) agg.get('count1');
        b.email__c = (string) agg.get('email');
        b.acc__c  = (id) agg.get('accountId');
        testObj1.add(b);
    }
    
    try{
        insert testObj1;
    }catch(exception e){
        
    }
}