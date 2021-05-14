public class acccons {
     public map<account,list<contact>> accmap{get;set;}
     
     public acccons(){
     
     accmap = new map<account,list<contact>>();
     
      for(account acc: [select id,name, (select id,name,phone from contacts) from account])
      
         {
              
            if(acc.contacts.size()>0) {
            this.accmap.put(acc, acc.Contacts); 
            system.debug('this is made in 799');  
            system.debug('this is made in 798');  
              }
         
         
         } 
          
     }

     public void mymethod()
     {//this is a new method
     }
     public void mymethod2()
     {//this is a new method
     }
}
