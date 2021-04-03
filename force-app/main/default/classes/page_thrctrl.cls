public class page_thrctrl {

    public list<account> acclist{get;set;}
    public list<contact> conlist{get;set;}

    public list<opportunity> opplist{get;set;}
    public list<account> acclist1{get;set;}
    public list<contact> conlist1{get;set;}    
    public account acc1{get;set;}
    public contact con1{get;set;}
    public opportunity opp1{get;set;}  
    
    public boolean acc{get;set;}
    public boolean con{get;set;}
    public boolean opp{get;set;}    
    
    public string indus{get;set;}
    
    public page_thrctrl(){
    
    acc1 = new account();
    con1 = new contact();
    opp1 = new opportunity();
    }
    
    public void get(){
           acclist1 = [select id,name,industry,ShippingState,Phone,BillingStreet  from account where industry= :acc1.industry];
        }
        
    public void getc(){
    
        acclist1 = new list<account>();
        for (account curracc : acclist)     
        {
                      
                     if(curracc.industry== acc1.industry) {    
              acclist1.add(curracc); 
              }
        }
        }
    
      public List<account> acc() {
    
        acc = true;
        acclist = new list<account>();
        acclist = [select id,name,industry,ShippingState,Phone,BillingStreet  from account];
                return acclist;
//        acclist.add(new account(name='vishak',phone='8686330647',industry='tcs'));
//        acclist.add(new account(name='ameti'));

                
//        insert acclist;
        }
        
         public void con() {
    
                con = true;
        conlist = [select id,name,phone from contact]; 
        
        }
         public void opp() {
    
         opp = true;
        opplist = [select name,amount,type  from opportunity]; 
        
        }
        
        public void clear() {
    
                acclist = new list<account>();
                        acclist1 = new list<account>();
        acclist.clear();
        acclist1.clear();
        
        }
    
    

}