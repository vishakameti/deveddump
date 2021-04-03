public class contactsLkp {

public id accid{get;set;}


public contactsLkp(){


accid = apexpages.currentpage().getparameters().get('accid');



}

public List<contact> getconList(){

List<contact> conlist1 = new List<contact>(); 
List<contact> conlist2 = new List<contact>();
conlist1 = [select id,name,lastname,Firstname,Key_contact__c from contact where  Accountid=:accid and Key_contact__c = 'Yes' order by Key_Contact__c asc];
conlist2 = [select id,name,lastname,Firstname,Key_contact__c from contact where  Accountid=:accid and Key_contact__c <> 'Yes' and Key_contact__c <> 'Terminated'  order by Key_Contact__c Desc];
conlist1.addall(conlist2);
return conlist1;


}
}