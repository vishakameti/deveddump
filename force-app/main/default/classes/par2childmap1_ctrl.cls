public class par2childmap1_ctrl {

          public map<string,integer> accmap{get;set;}
          public integer count{get;set;}          
          public par2childmap1_ctrl(){
          
          accmap = new map<string,integer>();
          
          for(opportunity temp: [select stagename from opportunity order by stagename]){
          
                
              if (!accmap.containskey(temp.stagename)){
              
                                count=0;
                               accmap.put(temp.stagename,count);
                               
                               
                               
                               }
              if (accmap.containskey(temp.stagename)){
              
                               count++;
                               accmap.put(temp.stagename,count);
                               
                               }
                               
          }
          
          }
          
          }