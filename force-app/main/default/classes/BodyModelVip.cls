public class BodyModelVip {
public CAN_VIP_proposal__c propGet{get;set;}
public BM_Incentive_Proposal__c BMlist{get;set;}
public List<BM_Incentive_Proposal__c> BMget{get;set;}
public boolean Showhide{get;set;}
public id Myid{get;set;}
public boolean bmRender{get;set;}
public boolean noBM{get;set;}
public string noBmtext{get;set;}

//test-st
public integer testnum{get;set;}
public string accname{get;set;} 
//test-end
public BodyModelVip (){
         
        noBmtext='No Bodymodels associated with this Proposal Request'; 
        propGet  = new CAN_VIP_proposal__c();
        BMlist = new BM_Incentive_Proposal__c();
        BMget  = new List<BM_Incentive_Proposal__c>();
BMlist.Incentive_Amount__c = 3700;
BMlist.Brand__c = 'Chrysler';


//        CAN_VIP_proposal__c propGet= new CAN_VIP_proposal__c();
propGet.Account_name__r = new Account();

         Myid = apexpages.currentpage().getparameters().get('id');
        propGet.FAN__C = apexpages.currentpage().getparameters().get('FAN');
//        propGet.Model_Year__c = Integer.valueOf(apexpages.currentpage().getparameters().get('MY'));
        propGet.Grid_Level__c = apexpages.currentpage().getparameters().get('GL');
        propGet.FAN_Type__c = apexpages.currentpage().getparameters().get('FANTYP');
        propGet.Prepared_By__c = apexpages.currentpage().getparameters().get('prepby');
//        propGet.Prepared_For__c = apexpages.currentpage().getparameters().get('prepfor');
//       propGet.Account_name__r.Name= apexpages.currentpage().getparameters().get('Fname');
         propGet.Account_Name__r.Name ='Cook Sanders and Assoc.';
//         propGet=[select name from CAN_VIP_proposal__c where FAN__C =:propGet.FAN__c];
//       String q = 'Select name from Account where Accountnumber = :propget.Fan__c limit 1';
//       propGet.Account_Name__r.Name = Database.query(q);
       BMlist.Master__c= Myid;
    GetBdy();
        
        }
        
            public void Create(){ 
            

            
           if(BMlist.Incentive_Amount__c <> 3700) 
           {  BMlist.Status__c ='Submitted';}
           else 
           {BMlist.Status__c ='Finance Approved';}
            system.debug('id is:'+BMlist.id);
            insert BMlist;
                        system.debug('id after is:'+BMlist.id);
            GetBdy();
            
            }
            public void showsec(){ Showhide=true;}
            
            public void GetBdy(){
            
                 testnum = BMget.size();
                 
            BMget = [ SELECT Id, Body_Model_Code__c, Brand__c, BM_Description__c, Incentive_Amount__c, Status__c FROM BM_Incentive_Proposal__c 
                     where Master__c= :Myid ];
                     

                     if(BMget.isEmpty()) 
                     {noBm=true;
                      }
                      else{bmRender=true;
                           noBm=false;}
            
            }
            
}