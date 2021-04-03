public class account_custom {

    public account acc{get;set;}
    
    public account_custom() {
    
        acc = new account(); 
        
        }
    
    public void save() {
       
        insert acc;
                acc = new account(); 
    }




}