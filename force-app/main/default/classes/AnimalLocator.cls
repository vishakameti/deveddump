public class AnimalLocator {
    
    public static string getAnimalNameById(integer id){
        string name;
        http http = new http();
        
        httprequest req = new httprequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        req.setMethod('GET');
        
        
        httpresponse myResponse = http.send(req);
        system.debug(myResponse);
        

         
        animalLocator1 rep = (animalLocator1)JSON.deserializeStrict(myResponse.getBody(),animalLocator1.class);
        system.debug(rep.animal.name+rep.animal.id+rep.animal.eats+rep.animal.says);
        return rep.animal.name;                
    }
    
    public class animal{
        public integer id;
        public  string name;
        public string eats;
        public string says;
        

    }
    public class animalLocator1{
        public animal animal;
    }
}