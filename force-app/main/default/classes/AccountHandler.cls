public class AccountHandler{

public static account insertNewAccount(string s) {

   account acc = new account(name=s);
   
try
{
insert acc;
} catch (Exception e) {
return null;
}
return acc;
}
}