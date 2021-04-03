public class acccons {
     public map<account,list<contact>> accmap{get;set;}
     
     public acccons(){
     
     accmap = new map<account,list<contact>>();
     
      for(account acc: [select id,name, (select id,name,phone from contacts) from account])
      
         {
              
            if(acc.contacts.size()>0) {
            this.accmap.put(acc, acc.Contacts);     
              }
         
         
         } 
          
     }
}