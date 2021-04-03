public class myControllerExtension1 {

    private final Account acct;
    
    public myControllerExtension1(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }

    public String getGreeting() {
        return 'Hello 1 ' + acct.name + ' (' + acct.id + ')';
    }
}