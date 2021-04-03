public class testset {

    public List<String> listone{get;set;}
    public Set<String> setOne{get;set;}
public List<wrapList> wraptempL{get;set;}
        public set<wrapList> wrapsetL{get;set;}    
    
    public testset(){
        
        listOne = new List<String>{'vishak1','vishak','Saimurali','Saimurali','vivek','vivek'};
        setOne = new Set<String>();
        
        
         wraptempL = new List<wrapList>();
         wrapSetL  = new Set<wrapList>();
        wraptempL.add(new wrapList('a','o1ne'));
        wraptempL.add(new wrapList('b','two'));
        wraptempL.add(new wrapList('b','two'));
        wraptempL.add(new wrapList('a','one'));
        wrapSetL.addall(wraptempL);
            }
    
    
    public class wrapList{
       
        public String sOne{get;set;}
        public String sTwo{get;set;}
        
        public wrapList(String a,String b){
            
            sOne = a;
            sTwo = b;
        }
    public boolean equals(Object obj) {
         if (obj instanceof wrapList) {
             wrapList pp = (wrapList) obj;
                return (pp.sOne.equals(this.sOne) && pp.sTwo.equals(this.sTwo) );
            } else {
                return false;
            }
    }
        
    public Integer hashCode()
    {
        return (31  * sOne.hashcode()) ^ sTwo.hashcode();
        
    } 
        
        
    }
}