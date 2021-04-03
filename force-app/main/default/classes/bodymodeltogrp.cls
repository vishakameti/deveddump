public class bodymodeltogrp {
    
    public String GroupName{get;set;}
    public String year{get;set;}
    public String brand{get;set;}
    public String Grid{get;set;}
    
    public canadaVIPGroup__c groupdata{get;set;}
     public groupBodyModels__c modelData{get;set;}
    
    public bodymodeltogrp(){
        
        groupdata = new canadaVIPGroup__c();
        modelData = new groupBodyModels__c();
        modelData.Group__c= ApexPages.currentPage().getParameters().get('id');
        groupdata.Model_year__c = ApexPages.currentPage().getParameters().get('my');
        groupdata.Brand__c = ApexPages.currentPage().getParameters().get('brand');
        groupdata.Grid_Level__c = ApexPages.currentPage().getParameters().get('grid');
        
        
        
    }
    
    public List<body_Model__c> getbmList(){
        
        List<body_Model__c> tempbm = new List<body_model__c>();
        
    //    tempbm = [select body_model_code__c from body_model__c where model_year__c =:groupdata.model_year__c ];
        return tempbm;
    } 
    
}