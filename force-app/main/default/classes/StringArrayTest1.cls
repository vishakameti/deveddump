public class StringArrayTest1
{

 public list<string> newstr{get;set;}
  
  public StringArraytest1(){
  
  generateStringArray(100);
  
  }
  
  public static list<string> generateStringArray(integer a){
  
      list<string> newstr = new list<string>();
      
      for(integer i =0;i<a;i++)
      
      {
      
               newstr.add('Test' +i); 
      }
      return newstr;
  
  }
}