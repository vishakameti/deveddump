public class par2childmap2_ctrl {

 public Id conid{get;set;}
            
    public PageReference getcase() {
        
    //String idd = Apexpages.currentpage().getParameters().get('conid');

        PageReference  pg = new PageReference ('/'+conid);
        
        return pg ;
    }

   public map<id,list<case>> conmap{get;set;}

  public par2childmap2_ctrl (){
  

  
  conmap = new map<id,list<case>>();
  
  for(contact temp: [select id,name,(select casenumber from cases) from contact]){

           if (!conmap.containskey(temp.id)) {
             
                 conmap.put(temp.id,new list<case>());
             
             }
                          if (conmap.containskey(temp.id)) {
             
                                  conmap.put(temp.id,temp.cases);
             
             }
  
  }
  
}
}