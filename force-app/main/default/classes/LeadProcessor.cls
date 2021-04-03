public class LeadProcessor implements database.Batchable<sobject>{
    
    public database.querylocator start(database.BatchableContext bc){
        
        system.debug([select id,leadsource from lead].size()+'is the size1');
        
        return database.getQueryLocator('select id,leadsource from lead');
    }
    public void execute(database.BatchableContext bc,List<lead> leadL){
        
        for(lead l:leadL){
           l.leadsource = 'Dreamforce';    
        }
        update leadL;
    }
    public void finish(database.BatchableContext bc){
         system.debug('finished');
    }
}