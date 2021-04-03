public with sharing class WarehouseCalloutService {

    private static list<myResponse> myabc{get;set;}
    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    @future(callout=true)
    public static void runWarehouseEquipmentSync() {
        myabc = new list<myResponse>();
        http http = new http();
        httpRequest req = new httpRequest();
        req.setEndpoint(WAREHOUSE_URL);
        req.setMethod('GET');
        httpResponse resp = http.send(req);
        system.debug('status'+resp.getStatus());
        system.debug('status code'+resp.getStatuscode());
        if(resp.getStatuscode() == 200){
            string response1 = resp.getBody();
            response1.replace( '"id":', '"_id ":' );
            system.debug(response1);
            myAbc = (list<myResponse>) JSON.deserialize(response1, list<myResponse>.class);
            system.debug(myAbc);              
            
        }        
        List<Product2> productsToUpsert = new List<Product2>();
        for(myResponse whrEquip : myAbc){
            	Product2 newProduct = new Product2( Warehouse_SKU__c  = whrEquip.id );
            newProduct.Replacement_Part__c = true;
            newProduct.Cost__c = whrEquip.cost;
            newProduct.Current_Inventory__c = whrEquip.quantity;
            newProduct.Lifespan_Months__c = whrEquip.lifespan;
            newProduct.Maintenance_Cycle__c = whrEquip.maintenanceperiod;
            newProduct.Name = whrEquip.name; 
            productsToUpsert.add( newProduct );
        }
         upsert productsToUpsert;
    }
    
    public class myResponse{
        public String name;
        public Boolean replacement;
        public Integer quantity;
        public Integer maintenanceperiod;
        public Integer lifespan;
        public Integer cost;
        public String sku;
        public String id;
        
    }
}