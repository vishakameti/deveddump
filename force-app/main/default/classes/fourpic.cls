public class fourpic {

   public integer num{get;set;}
   
   public integer namelen{get;set;}
   
   public string name{get;set;}
   public string ip{get;set;}
   public map<integer,string> namelist{get;set;}
   
   public string hyp{get;set;}
   public List<String> hyphen{get;set;}
   
   public Double rnd{get;set;}
   
   public String allstring{get;set;}

   public  fourpic(){
 rnd =  Math.random()*10;   

    num = rnd.intValue();
    
    hyp='-';
    namelist = new map<integer,string>();
    
    hyphen   = new list<string>();
   
   namelist.put(1,'Sukrati');
   namelist.put(2,'Shaileja');
   namelist.put(3,'Madhuri');
   namelist.put(4,'Rimi kar');
   namelist.put(5,'Vadina');
   namelist.put(6,'Canteen');
   namelist.put(7,'Btech1');
   namelist.put(8,'Btech2');
   namelist.put(9,'Btech3');

       
       name= namelist.get(num);
       

       namelen=name.length();
       
       
       for (integer i=0;i<namelen;i++)
       
       {
       
       hyphen.add('-');
       

       }
     
       
   
   }
   
   public void process(){
   
    For(integer k=0;k<namelen;k++){
    
    if(name.substring(k,k+1) ==ip)
    
    {
    
       hyphen[k] = ip;
       
    
    }

    
    }
              allstring = string.join(hyphen,'');  
   }
   

}