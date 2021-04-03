public class VIPApproval{
    
    public VIPApproval(){
        // Approval checks
        
        
        
        id a = 'a0n7F00000I0mhH';
        can_vip_proposal__c VIP = new can_vip_proposal__c();
        List<VIP_Proposal_Allowances__c> vipGroups = new List<VIP_Proposal_Allowances__c>();
        
        Map<id,canadaVIPGroup__c> GroupMap = new Map<id,canadaVIPGroup__c>();
        vipGroups = [select Incentive_Amount__c, Group_Name__c, Grid_Level__c, Parent_Groupid__c from VIP_Proposal_Allowances__c where 
                     CAN_VIP_Proposal__c =:a];
        
        for(VIP_proposal_Allowances__c vipTemp: vipGroups)
        {
            
            GroupMap.put(vipTemp.id,[select name,Grid_1_Incentive__c, Grid_2_Incentive__c, Grid_3_Incentive__c, Grid_4_Incentive__c, Grid_5_Incentive__c, Grid_6_Incentive__c from canadaVIPGroup__c where id=:vipTemp.Parent_Groupid__c]);
            
        }
        for(VIP_proposal_Allowances__c vipTemp: vipGroups){
            
            //Incentive Amount check
            VIP.Approval_violations__c=' ';
            if(vipTemp.Incentive_Amount__c == GroupMap.Get(vipTemp.id).Grid_1_Incentive__c){
                VIP.id='a0n7F00000I0mhH';
                VIP.VIP_Approval_Type__c='1';
            }
            else{
                VIP.id='a0n7F00000I0mhH';
                VIP.VIP_Approval_Type__c='2';
                If(VIP.Approval_violations__c ==Null){
                    VIP.Approval_violations__c ='Incentive Amount for '+vipTemp.Group_Name__c+' has been changed from '+ GroupMap.Get(vipTemp.id).Grid_1_Incentive__c+' to '+vipTemp.Incentive_Amount__c +'<br/>';
                }else{
                    VIP.Approval_violations__c =VIP.Approval_violations__c+'Incentive Amount for '+vipTemp.Group_Name__c+' has been changed from '+ GroupMap.Get(vipTemp.id).Grid_1_Incentive__c+' to '+vipTemp.Incentive_Amount__c +'<br/>';
                        }
            }    
        }
        update VIP;
        Approval.ProcessSubmitRequest req1 = 
            new Approval.ProcessSubmitRequest();
        req1.setComments('reSubmitting request for approval.');
        req1.setObjectId(a); 
        
        Approval.ProcessResult result = Approval.process(req1);
        System.assert(result.isSuccess());
    }
}