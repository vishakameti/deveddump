public class saig {

    public integer a {get;set;}
    
    public saig(){
        this.a=1;
        
        
        
    }
    public void change(integer a,integer i){
        
        a=a+1;
        
        if(i==1){
            i=0;
            change(a,i);
            
        }
        
    }
}