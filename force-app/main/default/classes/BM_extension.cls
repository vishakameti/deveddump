public class BM_extension {

     private ApexPages.StandardController controller{get; set;}
     public id vipId{get;set;}     
     public BM_Incentive_Proposal__c bminc{get;set;}
     public CAN_VIP_proposal__c vip{get;set;}
     public list<BM_Incentive_Proposal__c> bmlist{get;set;}
     public integer total_size{get;set;}
     public integer limit_size=10;
     private integer counter=0;
     public boolean disable1{get; set;}
     public Boolean prevDisable{get;set;}
    public BM_extension(ApexPages.StandardController controller1) {
      
      this.controller=controller1;
      
      this.vip= (CAN_VIP_proposal__c)controller.getRecord();
      
      vipId = vip.id;
//      vipId='a0n7F000007IhJa';


      
    }
    
    public void getSize(){
    
    total_size = [select count() from BM_Incentive_proposal__c where Master__c=:vipId];
    
    }
    
    public List<BM_Incentive_Proposal__c> getbmList1(){
    
          bmList = new list<BM_Incentive_Proposal__c>();
          
          bmList = [select Model_year__c,Brand__c,Body_model_code__c,Incentive_Amount__c,Status__c from BM_Incentive_proposal__c where Master__c=:vipId 
                    limit:limit_size   
                    offset:counter];
    
      return bmList;   
    }
    
    public void next(){
    
    
    counter+=10;
    
    }

    public void previous(){
    
    
    
    counter-=10;
    
    }
    
    public void last(){
    
counter = total_size - 9;

    
    }
    
        public Boolean getDisablePrevious() { //this will disable the previous and beginning buttons
        if (counter>0) 
        {
        return false; 
        }
        else return true;
    }
    
    public Boolean getDisableNext() { //this will disable the next and end buttons
        if ((counter + limit_size) < total_size) return false; else return true;
    }
    
}