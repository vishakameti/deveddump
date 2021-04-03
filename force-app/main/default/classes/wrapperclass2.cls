public class wrapperclass2 {

public List<Account> accountList{get;set;}
public List<Account> selectedAccounts{get;set;}
public List<WrapA>  wrapList{get;set;}
public boolean showit{get;set;}

public wrapperclass2(){

accountList = new List<Account>();
showit = false;
accountList = [select id,name,AccountNumber,BillingCity from account where Name> ' ' and AccountNumber > ' ' limit 10];

 wrapList = new List<Wrapa>();
for(Account a: AccountList){
 
 wraplist.add(new WrapA(a));


}

}

public void processselected(){

showit=true;
selectedAccounts = new List<Account>();

for(WrapA b: Wraplist) {
    
      if(b.selected==true){
      
      selectedAccounts.add(b.acc);
      
      }

}

}

public class WrapA{

 public Account acc{get;set;}
 public boolean selected{get;set;}
           public WrapA(Account a){
           
           acc = a;
           selected = false;
           
           }
}

}