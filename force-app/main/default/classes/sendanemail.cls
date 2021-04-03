public class sendanemail {
    
    @Auraenabled
    
    public static id emailTemplate(){
        
        string templateName = 'Send VIP Letter Template';
        
        return [select id from emailTemplate where name = :templateName limit 1].id;
                
    }

}