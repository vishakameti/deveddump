global class myBatch implements Database.Batchable<sObject>,schedulable {
    
    public integer count=0;	
    public string batchType;
    
    public myBatch(string batch){
        batchType = batch;
    }
    
    public myBatch(){}
    public database.QueryLocator start(Database.BatchableContext bc){
        
        
        
        if(batchType=='insert'){
            return database.getQueryLocator('select id,name from account');    
        }
        else {           
            string a='select id from account where name =\'vishak by batch\'';
            return database.getQueryLocator(a);
        }
        
        
        
    }
    //The below execute method is used to schedule 
    global void execute(SchedulableContext ctx) 
    {
        myBatch a = new myBatch('insert');
        Database.executeBatch(a,1); 
    }
    
    public void execute(database.BatchableContext bc,List<account> myList){
        
        
        
        if(batchType=='insert'){
            List<account> myTemp = new List<account>();
            for(account a: myList){
                
                a.name = 'vishak by batch';
                a.id = null;
                myTemp.add(a);            
            }
            insert myTemp;
        }else{
            delete myList;
        }
    }
    
    public void finish(database.Batchablecontext bc){
        
        id jobId = bc.getJobId();
        AsyncApexJob Job = [select TotalJobItems,JobItemsProcessed,status from AsyncApexJob where ID =:jobId];
        system.debug('TotalJobItems'+job.TotalJobItems);
        system.debug('JobItemsProcessed'+job.JobItemsProcessed);
        system.debug('JobItemsProcessed.status'+job.status);
        
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = new String[] { 'vishak.ameti@gmail.com' };
            message.optOutPolicy = 'FILTER';
        message.subject = 'batch status';
        message.plainTextBody = 'status is'+job.TotalJobItems+job.JobItemsProcessed+job.status;
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        
        system.debug('completed');
        
        count=count++;
        system.debug(count);
    }
    
}