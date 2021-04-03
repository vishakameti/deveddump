public class arrayfive {

    public list<integer> intlist{get;set;}
    
    public integer balpnt{get;set;} 
    
    public arrayfive(){
        
        intlist = new list<integer>{0,1,1};
        
    }
    
   public void process(){
        
        integer leftsum=0;
        integer rightpr=1;
    
        for(integer k=0;k<intlist.size();k++){
           leftsum=0; 
            rightpr=1;
            system.debug('intlist[k]'+intlist[k]);
            
        for(integer i=0;i<k;i++){
                     
         leftsum= leftsum+ intlist[i];
          
            
        }
            for(integer j=k+1;j<intlist.size();j++){
                
                rightpr= rightpr*intlist[j];
                
            }
          system.debug('leftsum is'+leftsum);
            system.debug('rightpr is '+rightpr);
             
            if(leftsum==rightpr){
               system.debug('it is a bal point index is:'+k);
                                
            }
            
      }
    }
    
}