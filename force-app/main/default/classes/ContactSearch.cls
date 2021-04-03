public class ContactSearch{

  public static list<contact> searchForContacts(string s1,string s2){
  
  list<contact> con =  new list<contact>();
  
    con = [select id,name from contact where lastname =:s1 and mailingpostalcode =:s2];
  
    return con;
  }
}