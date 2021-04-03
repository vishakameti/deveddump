public class campcont {

    
    
    @AuraEnabled
    public static List<Camping_Item__c> getCampingItem()
    {
        
        
       list<Camping_Item__c> mylist= [SELECT Id, Name__c, Quantity__c, price__c, packed__c FROM Camping_Item__c];
        
        return mylist;
        
    }
}