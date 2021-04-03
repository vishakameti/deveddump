public class arraythree {

    public List<integer> arraylist{get;set;} 
    private integer maxsum{get;set;}
    private integer tempsum{get;set;}
    public integer tempint{get;set;}
    public integer num1{get;set;}    
    public integer num2{get;set;}
    public arraythree(){
     
        arraylist = new List<integer>{1,2,5,6,3,4,7,8};
        process();
        tempint = rat();
     
        
    }
    
    public integer rat(){


    return this.maxsum;
    }
    
    public void process(){
        
        integer maxsum =0;
        integer tempsum=0;
        for(integer i=0;i<arraylist.size();i++) {
            
            for(integer j=0;j<arraylist.size();j++){
                
                if(i<>j){
                     tempsum = arraylist[i] + arraylist[j];

                if(tempsum >= maxsum)
                { 
                    if(arraylist.contains(tempsum)){
                    maxsum=tempsum; 
                    this.maxsum=maxsum;
                    num1 = arraylist[i];
                    num2 = arraylist[j];
                  
                    }
                }
                                }
                       
                
            }
            
        }
        
        
        
    }
    
    
}