public class treeviewthree {
    
    public boolean myCheckbox1{get;set;}
    public map<string,map<string,map<wrapGroup,List<groupbodymodels__c>>>> programYear{get;set;}
    
    public  VIP_Proposal_Allowances__c vipGroups{get;set;}
    
    public VIP_Proposal_Body_Model__c bodyModelVIP{get;set;}
    public  List<VIP_Proposal_Allowances__c> vipProp{get;set;}
    public List<CanadaVIPGroup__c> selectedGroups{get;set;}    
    public treeviewthree(){
        
        vipGroups = new VIP_Proposal_Allowances__c();
    }
    public class wrapGroup implements comparable{
        
        public canadaVIPgroup__c group1{get;set;}
        public boolean selected{get;set;}
        
        
        public wrapGroup(boolean s,canadaVIPgroup__c g){
            
            group1 = g;
            selected = s;
            
        }
        
        public Integer compareTo(object objToCompare){
            
            wrapGroup compareTokey = (wrapGroup)objToCompare;
            if(compareTokey.group1.name==group1.name) return 0;
            if(compareTokey.group1.name>group1.name) return 1;
            return -1;
            
        }
        
    }
    
    public map<string,map<string,map<wrapGroup,List<groupbodymodels__c>>>> getGroup(){
        
        string modelyear = '2019';
        programYear= new map<string,map<string,map<wrapGroup,List<groupbodymodels__c>>>>();
        
        if(programYear.get(modelyear)!=null){
            
            
        }
        
        return programYear;
        
        
    } 
    
    public pagereference summaryPage(){               
        return page.summarypage;                
    }
    
    public List<VIP_Proposal_Allowances__c> getSelectedgroups1(){
        
        vipProp = new List<VIP_Proposal_Allowances__c>();
        VIP_Proposal_Allowances__c vipTemp = new VIP_Proposal_Allowances__c();
        system.debug('group data'+vipGroups.Grid_Level__c);
        selectedGroups = new List<canadaVIPgroup__c>();
        set<wrapGroup> allGroups = new set<wrapGroup>();
        for(map<string,map<wrapGroup,List<groupbodymodels__c>>> a: programyear.values() ){
            
            for(map<wrapGroup,List<groupbodymodels__c>> b :a.values()){
                
                allGroups.addAll(b.keyset());
            }      
            
        }
        
        for(wrapGroup x: allGroups){
            
            if(x.selected==true){
                
                selectedGroups.add(x.group1);
                
            }
            
        }
        for (integer i=0;i<selectedGroups.size();i++){
            
            vipTemp.CAN_VIP_proposal__c = 'a0n7F00000I0mhH';
            vipTemp.Group_Name__c = selectedGroups[i].Name;
            vipTemp.Brand__c = selectedGroups[i].Brand__c;
            vipTemp.Model_Year__c = selectedGroups[i].Model_Year__c;
            vipTemp.Grid_Level__c = vipGroups.Grid_Level__c;
            vipTemp.Incentive_Amount__c = selectedGroups[i].Grid_1_Incentive__c;
            vipTemp.Group_Name_French__c = selectedGroups[i].Name;
            vipTemp.Parent_Groupid__c    = selectedGroups[i].id;
            system.debug('vipTemp:'+vipTemp);
            vipProp.add(vipTemp);
            vipTemp = new VIP_Proposal_Allowances__c();
        }
            system.debug('vipProp:'+vipProp);
        return vipProp;
        //  return selectedGroups;
    } 
    
    public void saveGroups(){
        
        Map<id,List<groupBodymodels__c>> tempMdl = new Map<id,List<groupBodymodels__c>>();
        List<VIP_proposal_Body_model__c> tempBdy = new List<VIP_Proposal_body_model__c>();
        VIP_Proposal_Body_model__c tempBdy1 = new VIP_proposal_body_model__c();
        insert vipProp;
        
        for(integer k=0;k < vipProp.size();k++){
            
            tempMdl.put(vipProp[k].parent_groupid__c,new List<groupBodymodels__c>([select Body_Model_code__c,cpos_code__c from groupbodymodels__c where group__c=:vipProp[k].parent_groupid__c]));
                        
            
        }
        
        for(integer k=0;k < vipProp.size();k++){
            
            for(groupBodymodels__c abc: tempMdl.get(vipProp[k].parent_groupid__c)){
                
                tempBdy1.Group__c = vipProp[k].id;
                tempBdy1.Body_Model_Code__c = abc.body_model_code__c;
                tempBdy1.cpos_Code__c = abc.cpos_code__c;
                tempBdy.add(tempBdy1);
                tempBdy1 = new VIP_proposal_body_model__c();
            }
            
            
        }
        insert tempBdy;
    }    
    public map<string,map<string,map<wrapGroup,List<groupbodymodels__c>>>> getprogramYeardata(){
        
        List<id> existingGroups = new List<id>();
        
     //   existingGroups = [select parent_groupid__c from VIP_Proposal_Allowances__c where CAN_VIP_proposal__c = 'a0n7F00000I0mhH'].parent_groupid__c;
        
        for(VIP_Proposal_Allowances__c bac: [select parent_groupid__c,Grid_Level__c from VIP_Proposal_Allowances__c where CAN_VIP_proposal__c = 'a0n7F00000I0mhH']){
            
            system.debug('bac.Grid_Level__c:'+bac.Grid_Level__c);
            system.debug('vipGroups.Grid_Level__c:'+vipGroups.Grid_Level__c);
            
      //    if( bac.Grid_Level__c == vipGroups.Grid_Level__c){
           existingGroups.add(bac.parent_groupid__c) ;
      //     }
        }
       
        
    //    map<wrapGroup,List<groupbodymodels__c>> groupModel = new map<wrapGroup,List<groupbodymodels__c>>();
        List<canadaVIPGroup__c> groupData = new List<canadaVIPGroup__c>(); 
        if(existingGroups.size()==0){
        groupdata=[select model_year__c,brand__c,name,exclusion_flag__c,Grid_1_Incentive__c,(select body_model_code__c,cpos_code__c,name from groupBodyModel__r) from canadaVIPgroup__c
                   where fan_type__c='C' ];
        }
        else{
        groupdata=[select model_year__c,brand__c,name,exclusion_flag__c,Grid_1_Incentive__c,(select body_model_code__c,cpos_code__c,name from groupBodyModel__r) from canadaVIPgroup__c
                   where fan_type__c='C'  and id not in :existingGroups];     
            
        }
        programYear= new map<string,map<string,map<wrapGroup,List<groupbodymodels__c>>>>();
        for(canadaVIPgroup__c c:groupdata){
            wrapGroup wrap = new wrapGroup(false,c);
            if(programYear.get(c.model_year__c)!=null){
                
                if(programYear.get(c.model_year__c).get(c.brand__c)!=null){
                    
                    if(programYear.get(c.model_year__c).get(c.brand__c).get(wrap)!=null){
                        
                        programYear.get(c.model_year__c).get(c.brand__c).get(wrap).add(c.groupbodymodel__r);
                        
                        
                    }
                    else{
                        
                        programYear.get(c.model_year__c).get(c.brand__c).put(wrap,new List<groupbodymodels__c>(c.groupbodymodel__r));
                        
                    }
                }
                else{
                    
                    programYear.get(c.model_year__c).put(c.brand__c,new Map<wrapGroup,List<groupbodymodels__c>>{wrap=>new List<groupbodymodels__c>(c.groupbodymodel__r)});
                    
                }
            }
            else
            {
                
                programYear.put(c.model_year__c,new map<string,map<wrapGroup,List<groupbodymodels__c>>>{c.brand__c => new Map<wrapGroup,List<groupbodymodels__c>>{wrap=> new list<groupbodymodels__c>(c.groupbodymodel__r)}});
                
            }
            
        }
    return programYear;        
    }
    

    
}