public class treeviewtwo {

public List<CanadaVIPGroup__c> grplist{get;set;}

public map<String,List<groupBodyModels__c>> mapgrp{get;set;}
public List<CanadaVIPGroup__c>  grpdata{get;set;}

public list<CanadaVIPGroup__c> getGroups(){

   grplist = new list<CanadaVIPGroup__c>();
  
  for(canadaVIPGroup__c vip: [select name from CanadaVIPGroup__c]){
  
  grplist.add(vip);
  
  }
   
   return grplist;
}

public map<string,List<groupBodyModels__c>> getMaplist(){

    grpdata = new List<CanadaVIPGroup__c>();
   mapgrp = new map<string,List<groupBodyModels__c>>(); 
   
    

   for(CanadaVIPGroup__c vis: [select name,(select name,cpos_code__c,body_model_code__c from groupBodyModel__r) from CanadaVIPGroup__c]){
   
   if(!mapgrp.containsKey(vis.name))
   {
   system.debug('in if:'+vis.name);
   mapgrp.put(vis.name,new List<groupBodyModels__c>(vis.groupBodyModel__r)); }
   
   else
   
   {
   system.debug('in else:'+vis.name);
   mapgrp.get(vis.name).add(vis.groupBodyModel__r);  }
   
   }
return mapgrp;
}



}