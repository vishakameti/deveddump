trigger accemail on Account (after insert) {
    
    List<account> changedEmail = new list<account>();
    if(trigger.isupdate&&trigger.isafter){
        for(account a: trigger.new){
            if(trigger.oldmap.get(a.id).testem__c!=trigger.newmap.get(a.id).testem__c){
                changedEmail.add(a);
            }
        }
        updatemail.emailUpdate(changedEmail,trigger.newmap);
    }

}