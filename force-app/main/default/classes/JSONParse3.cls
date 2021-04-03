public class JSONParse3 {
    public static List<stateData> myStateData{get;set;}
    public static integer AllIndia{get;set;}
    public static Map<string,myCounts> statewiseCount{get;set;}
    public static integer todayDelta{get;set;}
    
    @auraenabled(cacheable=true)
    public static List<statedata> hitCovidApi(){
        
        Http http = new Http();
        HttpRequest req = new HttpRequest();        
        req.setEndpoint('https://api.covid19india.org/v2/state_district_wise.json');        
        req.setMethod('GET');        
        HttpResponse myResponse = http.send(req);        
        string s = myResponse.getBody();                        
        
        system.JSONParser parser = json.createParser(s);
        myStateData = new List<statedata>();
        while(parser.nextToken()!=null){
            
            if(parser.getCurrentToken()==jsontoken.Start_object){
                stateData a = (statedata) parser.readValueas(stateData.class);
                myStateData.add(a);
            }
        }       
          system.debug('vishak'+myStateData);
        return myStateData;

    } 
         
    public  class stateData{        
        @auraenabled public string state;
        @auraenabled public string statecode;
        @auraenabled public List<disData> districtData;        
        public stateData(string s,List<disData> dis){
            state =s;
            districtData = dis.clone();
        }        
    }
     
    public  class disData{
        @auraenabled public string district;
        @auraenabled public string notes;
        @auraenabled public integer active;
        @auraenabled public integer confirmed;
        @auraenabled public integer deceased;
        @auraenabled public integer recovered;        
        @auraenabled public delta delta;
    }    
     
    public class delta{
        @auraenabled  public integer confirmed;
        @auraenabled  public integer deceased;
        @auraenabled public integer recovered;        
    }
     
    public class mycounts{
        @AuraEnabled public integer stateCounts{get;set;}
        @AuraEnabled public integer deltacounts{get;set;}        
    }
}