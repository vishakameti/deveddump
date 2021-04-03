public class wrapper_ctrl {

//public list<account> accwrap{get;set;}
public list<wrapclass> accwrap{get;set;} 

public wrapper_ctrl(){

     accwrap= new list<wrapclass>();
     
        for(account a: [select  id,name from account])
         {
             
             accwrap.add(new wrapclass(a));
           
        }
        

}

          public class wrapclass{
          
                    
          public account acc{set;get;}
          public boolean selected {set;get;}
                       
            public wrapclass(account a){
           
            acc = a;
            selected = false;

            }        
              
          
          }
          
          }