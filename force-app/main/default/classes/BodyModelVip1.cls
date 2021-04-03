public class BodyModelVip1 {

public BM_Incentive_Proposal__c BMlist{get;set;}

public BodyModelVip1(){
BMlist = new BM_Incentive_Proposal__c();
BMlist.Incentive_Amount__c = 3700;
BMlist.Brand__c = 'Chrysler';
BMlist.Master__c= 'a0n7F000007IernQAC';
      }
      
      public void Create(){ insert BMlist;}

}