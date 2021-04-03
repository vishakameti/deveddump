public class bmAdd {
    
    public string vishak{get;set;}
    
    public List<Body_Model__c> bmList{get;set;}

    public Body_Model__c bmtemp{get;set;}
    public List<Default_Incentive__c> incList{get;set;}
    public CAN_VIP_proposal__c propData{get;set;}
    public String vipNumber{get;set;}
    public string mYear{get;set;}
    public String fName{get;set;}
    public id masterId{get;set;}
    public boolean showList{get;set;}
    public List<SelectOption> brandList{get;set;}
    public List<SelectOption> listbrand{get;set;}
    public List<SelectOption> listFam{get;set;}
    public List<SelectOption> listModel{get;set;}
    public String Selectedbrand{get;set;}
    public String SelectedFam{get;set;}
    public String SelectedModel{get;set;}
    public List<wrapBmlist> bmList1{get;set;}
    public BM_Incentive_Proposal__c BMinc{get;set;}
    public boolean goback{get;set;}
    public String sql{get;set;}
    public bmAdd(){
        vishak ='xyz';
        propData = new CAN_VIP_proposal__c();
        bmtemp   = new Body_Model__c();
        propData.FAN__c = apexpages.currentpage().getparameters().get('FAN');
        mYear = apexpages.currentpage().getparameters().get('MY');
        
        vipNumber = apexpages.currentpage().getparameters().get('VIP');
        fName= apexpages.currentpage().getparameters().get('Fname');
        masterId= apexpages.currentpage().getparameters().get('id');
    }
    
    
    public List<SelectOption> getBrand()
    {
        Decimal mYear1 = Decimal.valueof(mYear);
        listBrand = new List<SelectOption>();
        
        
        
        List<aggregateResult> results = [select BRAND__C brand from Body_Model__c where Model_Year__c=:mYear1 GROUP BY brand__c  ];
        
        for (AggregateResult ar : results)
        {
            String test = (String) ar.get('brand');
            listBrand.add(new SelectOption(test,test));
            
        }
        
        return listBrand;
    }
    
    public List<SelectOption> getFamily()
        
    {
        
        Decimal mYear1 = Decimal.valueof(mYear);
        listFam = new List<SelectOption>();
        
        
        List<aggregateResult> resultsFam = [select Family_Line__c Fam from Body_Model__c where Model_Year__c=:mYear1 and Brand__c=:Selectedbrand GROUP BY Family_Line__c  ];
        
        for (AggregateResult ar : resultsFam)
        {
            String test = (String) ar.get('Fam');
            listFam.add(new SelectOption(test,test));
            
        }
        
        return listFam;
    }
    
    public List<SelectOption> getModel()
        
    {
        Decimal mYear1 = Decimal.valueof(mYear);
        listModel = new List<SelectOption>();
        
        
        
        List<aggregateResult> resultsModel = [select Body_Model_Code__c Model from Body_Model__c where Model_Year__c=:mYear1 and Brand__c=:Selectedbrand and Family_Line__c=:SelectedFam GROUP BY Body_Model_Code__c  ];
        
        for (AggregateResult ar : resultsModel)
        {
            String test = (String) ar.get('Model');
            listModel.add(new SelectOption(test,test));
            
        }
        
        
        
        return listModel;
    }
    
    
    public List<wrapBmlist> getBmlistval(){


    system.debug('bmList1 :'+bmList1);

        bmList1 = new List<wrapBmlist>();
        incList = new List<Default_Incentive__c>();
             system.debug('before:'+sql);

        
        sql= 'SELECT Id, Body_Model__r.Body_Model_Code__c,Body_Model__r.Brand__c, Incentive_Amount__c, Body_Model__r.Name FROM Default_Incentive__c';
        
        if(selectedBrand!=null&&selectedBrand.length()!=0)
        {
        sql+=' where Body_Model__r.Brand__c=:selectedBrand';
        }
        
        if(selectedBrand!=null&&selectedFam!=null&&selectedBrand.length()!=0&&selectedFam.length()!=0)
        {
        sql+= ' and Body_Model__r.Family_Line__c=:selectedFam';
        }
        
        if(selectedBrand!=null&&selectedFam!=null&&selectedModel!=null&&selectedBrand.length()!=0&&selectedFam.length()!=0&&selectedModel.length()!=0)
        {
        sql+= ' and Body_Model__r.Body_Model_Code__c=:selectedModel';
        }
     system.debug('after:'+sql);
//       incList= [SELECT Id, Body_Model__r.Body_Model_Code__c, Incentive_Amount__c, Body_Model__r.Name FROM Default_Incentive__c];
        
        incList = database.query(sql);

        system.debug('bmList1 before for:'+bmList1);
        for(Default_Incentive__c a:incList){
            
            bmList1.add(new wrapBmlist(a));
        system.debug('bmList1 inf for:'+bmList1);            
        }

        bmList1.addall(bmList1);
                                        
               
         
                                                                                                
        
                system.debug('bmList1 after for:'+bmList1);
        return bmList1;
    }
    
    
    
    public void processSelected(){
    
    Decimal mYear1 = Decimal.valueof(mYear);

     for(wrapBmlist wrap : bmList1){
      if(wrap.selected==true){ 
      BMinc = new BM_Incentive_Proposal__c();
      BMinc.Master__c = masterId;      
      BMinc.Body_Model_Code__c=wrap.incDetail.Body_Model__r.Body_Model_Code__c;
      BMinc.Model_Year__c=mYear1;
      BMinc.Brand__c=wrap.incDetail.Body_model__r.Brand__c;
      BMinc.BM_Description__c=wrap.incDetail.Body_Model__r.Name;
      BMinc.incentive_Amount__C = wrap.incDetail.incentive_Amount__c;
      if(wrap.incDetail.incentive_Amount__c==wrap.tempAmt)
      {
      BMinc.Status__c = 'Finance Approved';
      }
      else
      {
      BMinc.Status__c ='Submitted';
      }
      
 
      try{
                        insert BMinc;          
                        ApexPages.Message errorMsg=new ApexPages.Message(ApexPages.Severity.CONFIRM,'Body Models Successfully Added to VIP request'); 
                        ApexPages.addMessage(errorMsg); 
                        showlist=false; 
                        goback=true;
      }
       catch(DmlException e) {                       
        
                       ApexPages.Message errorMsg=new ApexPages.Message(ApexPages.Severity.ERROR,'DB Error.'+e);
                        ApexPages.addMessage(errorMsg);  
                        System.Debug('error is'+errorMsg);


     }
             catch(Exception e) {
                        ApexPages.Message errorMsg=new ApexPages.Message(ApexPages.Severity.ERROR,'Error while Saving.');
                        ApexPages.addMessage(errorMsg);
                        System.Debug('error1 is'+errorMsg);

                    } 
     }
       
    }
    
    
    
    }
    
    public class wrapBmlist{
        
        public Default_Incentive__c incDetail{get;set;}
        public boolean selected{get;set;}
        public decimal tempAmt{get;set;}
        public wrapBmlist(Default_Incentive__c a){
            
            incDetail =a;
            selected = false;
            tempAmt =a.Incentive_Amount__c;
        }
        
        
    }


    
    public void showL(){
    showlist=true;
    }
    
    public pagereference goback()
    {
    

    PageReference pf = new PageReference('/'+masterId);
        return pf;
    }
   
    
    
}