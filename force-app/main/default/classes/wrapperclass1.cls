public class wrapperclass1 {

public List<Wrapaccount> wrapclassList{get;set;}
//public List<account> AccountList{get;set;}
public vishak vvv{get;set;}

public wrapperclass1(){  
wrapclassList = new List<wrapaccount>();
//AccountList   = new List<account>();
wrapclassList.add(new wrapaccount(1,2));
wrapclassList.add(new wrapaccount(3,4));
wrapclassList.add(new wrapaccount(5,6));
}
public class vishak{ vishak(){}}

public class wrapaccount{
       
       integer a;
       integer b;
       
       public wrapaccount(integer a,integer b){ this.a=a;this.b=b;}

   }
}