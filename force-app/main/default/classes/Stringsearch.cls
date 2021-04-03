public class Stringsearch {

     public string main{get;set;}
     public string sub{get;set;}
     public integer sublen{get;set;}
     public integer mainlen{get;set;}
     public list<string> sublist{get;set;}
     public list<string> mainlist{get;set;}
     public string finalstr{get;set;}
     public list<integer> maplist{get;set;}
      public map<string,List<string>> final1 {get;set;}
      
     public Stringsearch(){
     
        sublist = new list<string>();
        mainlist = new list<string>();
        maplist  = new list<integer>();
        final1 = new map<string,list<string>>();
        }
    public void process(){
   
     
        if (sub > ' '){
        sublen = sub.length();
        }
     
        if (main > ' '){
        mainlen = main.length();
        }
        
        
           for(integer i=0;i < sublen;i++) {
           
           sublist.add(sub.substring(i,i+1));

           }
            for(integer i=0;i < mainlen;i++) {
           
           mainlist.add(main.substring(i,i+1));

           }
           
           for(integer k=0; k< sublen;k++) {
           
             for(integer l=0;l <mainlen;l++) { 
                  string temps=   String.valueOf(l);             
                if(sublist[k] == mainlist[l]) {
                
                  if(!final1.containskey(sublist[k]))

                 final1.put(sublist[k],new List<string>{temps});
                 else
                  final1.get(sublist[k]).add(temps);
                  
                 finalstr = String.valueOf(final1);

//final1.put(sublist[k],);
                }
             }
           
           }
           

   }

}