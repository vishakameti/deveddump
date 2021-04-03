public class par2childmap_ctrl {

     public map<id,list<contact>> accmap{get;set;}
     
     public par2childmap_ctrl()
     
          {
               accmap = new map<id,list<contact>>();
          for(account temp: [select id,name,(select name,phone from contacts) from account]){

             if (accmap.containskey(temp.id)) {
             
                 accmap.put(temp.id,temp.contacts);
             
             }
             if (!accmap.containskey(temp.id)) {
             
                 accmap.put(temp.id,new list<contact>());
             
             }
             
             
          }
          
          }
          
          }