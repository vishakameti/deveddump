public class mapinmap_ctrl {

 public map<string,Map<string,integer>> oppmap {get;set;}
 
    public integer count{get;set;}  
 
 public set<String> cols {get; set;}
 
 
    public mapinmap_ctrl(){
 
        oppmap = new map<string,map<string,integer>>();
 
    set <string> cols = new set<string>();        
 
    for(opportunity o: [select leadsource,stagename,id from opportunity order by leadsource]){

  
         /* Map<string,integer> innermap = new Map<string,integer>();  
          
          if (!oppmap.containskey(o.leadsource)){
             
              oppmap.put(o.leadsource,innermap);
              
              if (!oppmap.get(o.leadsource).containskey(o.stagename)){
              
                     count = 0;
                     innermap.put(o.stagename,count);
               
                     oppmap.put(o.leadsource,innermap);
               
              }
              
            }
            
        if (oppmap.containskey(o.leadsource)){
             
              if (oppmap.get(o.leadsource).containskey(o.stagename)) {
              
                   //count++;
                   //innermap.put(o.stagename,count);
                   //oppmap.put(o.leadsource,innermap);
                   oppmap.get(o.leadsource).put(o.stagename, oppmap.get(o.leadsource).get(o.stagename) + 1);
              
              
               
              }else {
              
              }
              
            }
 
        */

        cols.add(o.stagename);
        if (oppmap.containskey(o.leadsource)){
            if (oppmap.get(o.leadsource).containskey(o.stagename)) {
                oppmap.get(o.leadsource).put(o.stagename, oppmap.get(o.leadsource).get(o.stagename) + 1);
            }else {
                oppmap.get(o.leadsource).put(o.stagename, 1);
            }
            
        }else {
            Map<String, Integer> im = new Map<String, Integer>();
            im.put(o.stagename, 1);
            oppmap.put(o.leadsource, im);
        }

 
    }

 
}
}