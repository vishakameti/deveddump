public class calc {

    public static void calc2(){
        
       calculatorServices.CalculatorImplPort port = new   calculatorServices.CalculatorImplPort();
        
        double result = port.doAdd(10, 9990);
        
      system.debug('result is'+result);  
    }
    
}