trigger acc1 on Account (after update) {
    //can be done using processbuilder or a formula field
    //map of account ids and their list of contacts
    //need to write the below in helper class
    Map<id,list<contact>> conAcclist = new Map<id,list<contact>>();
    for(contact c:[select id,name,accountId,email from contact where accountId in :trigger.newmap.keyset()]){
         
        if(conAcclist.containsKey(c.accountId)){
            conAcclist.get(c.accountId).add(c);
            
        }else{
            conaccList.put(c.accountId,new list<contact>{c});
        }
        
    }
    list<contact> finalList = new list<contact>();
    for(account a:trigger.new){
        if(trigger.newMap.get(a.id).testem__c!=trigger.oldMap.get(a.id).testem__c){
            for(contact c: conaccList.get(a.id)){
                c.email = a.testem__c;
                finalList.add(c);
            }
            
        }        
    }
    try{
        system.debug('finalList'+finalList.size());
       update finalList; 
    }catch(exception e){
        system.debug('e'+e);
    }
       
}