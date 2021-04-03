public class testClass {
    
    public static void myTest(){
        List<account> myConList = new List<account>();
        for(integer i=0;i<100;i++){
            account c = new account();
            if(i!=80){
                c.name='test contact'+i;
            }
           // c.stageName='Prospecting';
           // c.CloseDate = date.newInstance(2020, 09, 09);
            myConlist.add(c);
        }
        database.SaveResult[] saveList =  database.insert(myConlist,false);
        
        for(database.saveResult save1:saveList){
            if(save1.isSuccess() ){
                
            }else{
                system.debug(save1.getErrors());
                system.debug('id'+save1.getId());
            }    
        }
        
    }
    
}