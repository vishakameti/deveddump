global class accountBatch implements database.Batchable<sobject> {
    
    List<Account> lstAccounts=new List<Account>();
    Map<String,String> Statelist = new Map<string,string>();
    global accountBatch()
    {//ap vishakameti
        Document doc=[SELECT Body,ContentType,Description,DeveloperName,Name FROM Document WHERE Name = 'mydata'];
        String[] columns=doc.Body.toString().split('\n');
        String[] columnNames=columns[0].split(',');
        columns.remove(0);
        
        for(String str:columns)
        {        
            String[] fields=str.split(',');
            system.debug(fields);
            for(Integer i=0;i<fields.size()-1;i++)
            {                        
                stateList.put(fields[i], fields[i+1]);
            }
            
        }
        lstAccounts = [select id,portfolio_strategist__c,billingState from account where billingstate in :stateList.keyset()];
    }
    
    public list<sobject> start(database.batchableContext bc){
        
        for(account acc : lstAccounts){
            acc.portfolio_strategist__c = stateList.get(acc.billingState);
            system.debug(stateList.get(acc.billingState));
        }
        return lstAccounts;
    }
    
    public void execute(database.batchableContext bc,list<account> accList){
        update accList;
    }
    
    public void finish(database.batchableContext bc){
        
        system.debug('finished');
    }
}