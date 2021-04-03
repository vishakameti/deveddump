public class Recalls {

public list <recall__c> reclist{get;set;}

public string inputvin{get;set;}
public string inputfvin{get;set;}

Public List<String> lstvin{get;set;}

public List <string> filevinlist{get;set;}
  public Recalls()
  {
    reclist = new list<recall__c>();

    lstvin  = new list<string>();
    filevinlist = new list<string>();    
    inputvin = apexpages.currentpage().getparameters().get('att');
    inputfvin =     apexpages.currentpage().getparameters().get('filevins');
  lstvin = inputvin.split(',');  
  reclist=[SELECT Id, VIN_LAST_8__c, VIN_First_9__c, ITEM_CODE__c, FAN__c, Recall__c, desc__c, recall_date__c, DEALER_CODE__c, NAME__c FROM recall__c where VIN_LAST_8__C = :lstvin];
  }
 
  public void getrec(){
  

  lstvin = inputvin.split(',');  
  reclist=[SELECT Id, VIN_LAST_8__c, VIN_First_9__c, ITEM_CODE__c, FAN__c, Recall__c, desc__c, recall_date__c, DEALER_CODE__c, NAME__c FROM recall__c where VIN_LAST_8__C = :lstvin];
  

      }
 }