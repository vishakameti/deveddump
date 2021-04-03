public class callCovid extends JSONParse2 {
    
    @AuraEnabled(cacheable=true)
    public static List<finalList> myclass(){
        Map<string,myCounts> a = hitCovidApi();
        system.debug(a);
        List<finalList> myList = new List<finalList>();
        for (string s : a.keyset()){
            finalList b = new finallist();
            b.state = s;
            b.statec = a.get(s).statecounts;
            b.deltac = a.get(s).deltacounts;
            myList.add(b);
            
        }

        return myList;
    }
    
    public class finalList{
        @Auraenabled public string state{get;set;}
        @Auraenabled public integer statec{get;set;}
        @Auraenabled public integer deltac{get;set;}
    }
}