trigger conTrigger on Contact (after insert,after update,after delete) {
    
    
    if(trigger.isAfter){
        if(trigger.isInsert||trigger.isUndelete){
        contactTriggerHelper.contactProcess(trigger.new,null);    
        }
        if(trigger.isUpdate){
        contactTriggerHelper.contactProcess(trigger.new,trigger.old);    
        }
        if(trigger.isdelete){
        contactTriggerHelper.contactProcess(trigger.old,null);    
        }        
    }    
}