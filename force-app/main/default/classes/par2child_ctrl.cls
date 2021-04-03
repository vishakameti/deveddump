public class par2child_ctrl {
public list<account> acclist{get;set;}
  public list<contact>  conlist{get;set;}
  public integer count1{get;set;}
    
  public par2child_ctrl(){
  
  acclist = [select id,name,(select phone from contacts) from account];
  

  
    
  }
  
}