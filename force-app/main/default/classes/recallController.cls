public class recallController {
  @AuraEnabled
  public static List<recall__c> getrecalls() {
    return [SELECT Id, VIN_LAST_8__c, VIN_First_9__c, ITEM_CODE__c, FAN__c, Recall__c, desc__c, recall_date__c, DEALER_CODE__c, NAME__c FROM recall__c];
  }
}