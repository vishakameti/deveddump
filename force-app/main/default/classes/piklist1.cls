public class piklist1 {

    public void save() {
        insert a;
    }


 
public string dcode{get;set;}

Public List<string> piklist{get;set;}
Public List<PBUS__C> pbusdata{get;set;}

public pbus__c a{get;set;}

 public List<SelectOption> options { get; set; }
    public String[] value { get; set; }

public piklist1(){

  piklist = new List<string>();
  pbusdata = new List<PBUS__C>();
  a = new pbus__c();
  displaydata();
  
}

  public void displaydata() {
  
  system.debug('in displaydata');
      pbusdata = [SELECT name,list1__c,dealer_code__c from PBUS__C WHERE dealer_code__c IN('C9024','C9025')];
    }
   
}