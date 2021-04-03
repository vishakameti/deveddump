public class LoginPages {
 
        transient  public String password { get; set; }
    transient  public String username { get; set; }
    
        
        public PageReference registerUser() {
        PageReference newPage = new PageReference('/apex/vishak1');
        newPage.setRedirect(false);
        return newPage;
    }
}