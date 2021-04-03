public class pagebox_ctrl {

   public string text1{get;set;}
   public string text2{get;set;}
   public String text3{get;set;}
   
   public string query{get;set;}
   
   public list<pbus__c> qlist{get;set;}

   public string query1{get;set;}  
   public string query2{get;set;}   
  
  

 
   
   
   public void add() {
   

 
      String query1='select id,';
      String query2= query1 + text1 + ' from pbus__c';
   

    qlist=database.query(query2);
      
   for(pbus__c add : qlist)
  {
  add.name = 'MR.'+add.name; 
  }   
   }
   
   
}