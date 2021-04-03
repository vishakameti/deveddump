public class contactsLkp1 {

public id accid{get;set;}


public contactsLkp1(){


accid = apexpages.currentpage().getparameters().get('accid');



}

public List<conWrapper> getconList(){

List<contact> conlist1 = new List<contact>(); 

conlist1 = [select id,name,Key_contact__c from contact where  Accountid=:accid and Key_contact__c <> 'Terminated'  order by name desc];


List<conwrapper> wraplist = new List<conWrapper>();
for(contact c:conList1){
Id Vid = c.id;
String Vname = c.name;
if(c.Key_contact__c == null){ c.Key_contact__c = ' '; }
String Vkeycon = c.Key_contact__c;
wraplist.add(new conWrapper(Vid,Vname,Vkeycon));


}
wraplist.sort();
return wraplist;


}




public Class conWrapper implements comparable {


public id id1{get;set;}
public String Cname{get;set;}
public String Keycon{get;set;}


public conWrapper(id i,String s,string k){

id1= i;
Cname = s;
Keycon= k;

}
      public Integer compareTo(Object objToCompare){
      
      conWrapper compareTokey = (conWrapper)objToCompare;
      if(compareTokey.keycon==Keycon) return 0;
      if(compareTokey.keycon>Keycon) return 1;

      return -1;

//      return Keycon.compareTo(((conWrapper)objToCompare).Keycon);
      
      }

}





}