virtual public class JSONParse2 {
    public static List<stateData> myStateData{get;set;}
    public static integer AllIndia{get;set;}
    public static Map<string,myCounts> statewiseCount{get;set;}
    public static integer todayDelta{get;set;}
    public static Map<string,myCounts>  hitCovidApi(){
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();        
        req.setEndpoint('https://api.covid19india.org/v2/state_district_wise.json');        
        req.setMethod('GET');        
        HttpResponse myResponse = http.send(req);        
        string s = myResponse.getBody();                        
        
        system.JSONParser parser = json.createParser(s);
        myStateData = new List<statedata>();
        while(parser.nextToken()!=null){
            system.debug(parser.getCurrentToken());
            if(parser.getCurrentToken()==jsontoken.Start_object){
                stateData a = (statedata) parser.readValueas(stateData.class);
                myStateData.add(a);
            }
        }       
        Map<string,myCounts> a = statewise();
        return a;
        //  system.debug(myStateData);
    }  
    public static Map<string,myCounts> statewise(){
        
        statewiseCount = new Map<string,myCounts>();
        AllIndia = 0;
        integer deltaCount = 0;
        todayDelta= 0;
        
        for(stateData a:myStateData){
            deltaCount = 0;
            integer confirmedCount =0;
            for(disData b: a.districtData){
                confirmedCount+=b.confirmed;        
                deltaCount =deltaCount+b.delta.confirmed;    
            }
            if(!statewiseCount.containsKey(a.state)){
                
                if(a.state!='Unknown'){
                    mycounts ab = new mycounts();
                    ab.stateCounts = ConfirmedCount;
                    ab.deltacounts = deltaCount;
                    statewiseCount.put(a.state,ab);    
                }                
            }    
            if(a.state!='Unknown'){  
                todayDelta +=deltaCount;
                AllIndia +=confirmedCount;
            }
        }
        return statewiseCount;
        
    }
    public  class stateData{        
        public string state;
        public string statecode;
        public List<disData> districtData;        
        public stateData(string s,List<disData> dis){
            state =s;
            districtData = dis.clone();
        }        
    }
    
    public  class disData{
        public string district;
        public string notes;
        public integer active;
        public integer confirmed;
        public integer deceased;
        public integer recovered;        
        public delta delta;
    }    
    
    public class delta{
        public integer confirmed;
        public integer deceased;
        public integer recovered;        
    }
    public class mycounts{
        @AuraEnabled public integer stateCounts{get;set;}
        @AuraEnabled public integer deltacounts{get;set;}        
    }
}