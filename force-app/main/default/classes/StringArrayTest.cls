public class StringArrayTest {
 
    public static list<string> generateStringArray(integer len) {
       
        String[] myArray = new List<String>();
            
            for(Integer i=0;i< len;i++) {
                    myArray.add('Test ' +i);          
                    System.debug(myArray[i]);
            } 
            return myArray;
        }   
}