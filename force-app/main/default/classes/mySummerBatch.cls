public class mySummerBatch implements Database.batchable<sobject>,Database.RaisesPlatformEvents {

    
    public database.QueryLocator start(database.BatchableContext bc){
        
        String q = 'select id,name from account';
        
        return database.getQueryLocator(q);
        
    }
    
    public void execute(database.BatchableContext bc,List<account> acc){
        
        List<account> myAccTemp = new List<account>();
        for(account ab:acc){
            
            ab.name = 'vishak from new batch';
            ab.id = null;
            myAccTemp.add(ab);
        }
        insert myAccTemp;
    }
    
    public void finish(database.BatchableContext bc){
        
        system.debug('batch is finished');
    }
}