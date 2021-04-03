public class accountCount {
@AuraEnabled
    public static integer countAcc(){
        return [select count() from account ALL ROWS];
    }
    
 @AuraEnabled
    public static List<Account> AccList(){
        return [select id,Name,phone,(select lastname from contacts limit 2) from account where phone>' ' Limit 5];
    }
    
  @AuraEnabled
    public static string saveAccount(List<Account> myAccs){
        
        try{
            update myAccs;
            return 'success';
        }
        catch(Exception e){
            return 'failed with exception '+e;
        }
        
        
    }
    
   @AuraEnabled
    public static list<myWrapper> accWrap(){
        
        List<myWrapper> wrap = new List<myWrapper>();
       List<account> accList=  [select id,Name,phone,(select lastname from contacts limit 2) from account where phone>' ' Limit 5];
        for(account a:accList){
            myWrapper ab = new myWrapper(false,a);


            wrap.add(ab);  
        }
        system.debug(wrap);
        return wrap;
        
    }
    @AuraEnabled
    public static string receiveaccWrap(List<myWrapper> wrapL){
        system.debug('wrapL'+wrapL);
        for(mywrapper hey : wrapL ){
            if(hey.checkBox==true){
                system.debug('1');
            }
        }
        
        return 'success';
        
    }
    public class myWrapper{
       @AuraEnabled public boolean checkBox{get;set;}
       @AuraEnabled public account acc{get;set;}

        public myWrapper(boolean b,account a){
            checkBox = b;
            acc =a.clone();
        }
    }
}