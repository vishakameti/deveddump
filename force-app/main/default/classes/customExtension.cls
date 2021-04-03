public class customExtension {
    public account myAccount;
    public boolean showinput{get;set;}
    public boolean showoutput{get;set;}
    public customExtension(apexpages.StandardController controller){
        showinput =true;
        showoutput = false;
     this.myAccount = (account) controller.getRecord();
    }
     
    public pagereference save(){
        try{
            insert myAccount;
            showinput = false;
            showoutput = true;
            //apexpages.currentPage().getParameters().put('id',myAccount.id);
            pagereference a = new pagereference('/apex/testPage2?id='+myAccount.id);

            return a;
        }catch(exception e){
            system.debug('e'+e);
            return null;
        }
        
    }
}