trigger opplineTrigger on OpportunityLineItem (after insert,after update,after delete) {
    
    if(trigger.isAfter){
        if(trigger.isInsert||trigger.isupdate){
            oppHelper.processData(trigger.new);
        }
        if(trigger.isdelete){
            oppHelper.processData(trigger.old);
        }
    }

}