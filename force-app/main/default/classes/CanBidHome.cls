public class CanBidHome {

Public string textval{get;set;}
    public String contactName {get; set;}
    public Id contactId {get; set;}
    public Id accId{get;set;}
    public String getMySwitch() {
         switch1 = !switch1;
        return null;
    }

public CAN_VIP_proposal__c propData{get;set;}
public List<Fan_Type__c> propTemp{get;set;}
public String Myear{get;set;}
public String Fname{get;set;}
public CAN_VIP_proposal__c propGet{get;set;}
public boolean switch1{get;set;}

     public CanBidHome(){   

        propData = new CAN_VIP_proposal__c();
        propGet  = new CAN_VIP_proposal__c();
        propData.Price_Protection__c = [select price_Protection__c from can_vip_Proposal__c where id='a0n7F00000I0mhHQAR'].price_protection__c;
        propTemp  = new List<Fan_Type__c>();
     //   propData.Account_name__r = new Account();
        propData.FAN__c = apexpages.currentpage().getparameters().get('FAN');
        propData.Account_Name__c = apexpages.currentpage().getparameters().get('aid');
        accId = apexpages.currentpage().getparameters().get('aid');
//        propData.Fan_Type__c = 'C';
        propData.Model_Year__c = String.valueOf(System.Today().year());
        PropData.Fan_Type__c = ' ';
        String FanChar = propData.FAN__c.substring(0,1);
        system.debug('before'+propData.Fan_Type__c);

        Proptemp = [select Fan_Type__C  from Fan_Type__c where Fan_First_Char__c =:FanChar];
        
         if(Proptemp.size()<>0){ PropData.Fan_Type__c = PropTemp[0].Fan_Type__c; } 
         
        
        system.debug('after'+propData.Fan_Type__c);        
       }
     public void mySwitch(){
         switch1 = !switch1;
         
     }
     public pageReference createvip(){

             propData.FAN_Type__c ='G'; 

            
try{


        insert propData;
        getvip(); 
        return redirectpage1();
   }
        
        catch(DmlException e) {                       
        
                       ApexPages.Message errorMsg=new ApexPages.Message(ApexPages.Severity.ERROR,'DB Error.'+e);
                        ApexPages.addMessage(errorMsg);  
                        return null;                     

     }
             catch(Exception e) {
                        ApexPages.Message errorMsg=new ApexPages.Message(ApexPages.Severity.ERROR,'Error while Saving.');
                        ApexPages.addMessage(errorMsg);
                        return null;

                    } 
       }
       public void getvip(){
       

           propGet  =[SELECT Id, FAN__c,  Model_Year__c,Account_Name__r.name, Grid_Level__c, FAN_Type__c, Prepared_By__c,  Comments__c FROM CAN_VIP_proposal__c where FAN__C =:propData.FAN__c limit 1 ];   

     }
     
       public pageReference redirectpage(){
//       Myear = String.valueOf(propData.Model_Year__c);
       Fname = propGet.Account_Name__r.name; 

//      PageReference pf = new PageReference('/apex/BodyModelVip?FAN='+propData.FAN__C);
        PageReference pageRef = new PageReference('/apex/BodyModelVip');
          pageRef.getParameters().put('id', propData.id); 
          pageRef.getParameters().put('FAN', propData.FAN__C); 
          pageRef.getParameters().put('MY', Myear); 
          pageRef.getParameters().put('GL', propData.Grid_Level__c);
          pageRef.getParameters().put('FANTYP', propData.FAN_Type__c);
          pageRef.getParameters().put('prepby', propData.Prepared_By__c);
//          pageRef.getParameters().put('prepfor', propData.Prepared_For__c);
          pageRef.getParameters().put('Fname', Fname);
      return pageRef;   
       }
      public pageReference redirectpage1(){
      
        PageReference pageRef = new PageReference('/'+propData.id);
        return pageRef;
       }
}