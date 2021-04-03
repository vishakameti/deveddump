public class apinames_ctrl {

public list<string> apiNames{get;set;}

public apinames_ctrl(){

Schema.DescribeSObjectResult r = Account.sObjectType.getDescribe();
list<String> apiNames =  new list<String>();
for(string apiName : r.fields.getMap().keySet()){
   apiNames.add(apiName);
}
System.debug(apiNames);
}
}