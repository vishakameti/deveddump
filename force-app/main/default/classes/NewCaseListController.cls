public class NewCaseListController {

   public list<case> newcases{get;set;}
   
   public NewCaseListController (){
   
   getNewCases();
   }
   
  public list<case> getNewCases(){
  
     newcases=[select id,casenumber from case where status = 'new'];
     
     return newcases;
  
  }
}