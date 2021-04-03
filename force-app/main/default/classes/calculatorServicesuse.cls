public  class calculatorServicesuse {

public double num1{get;set;}

public double num2{get;set;}

public double num3{get;set;}

public calculatorServicesuse(){



   
} 

public void doAdd(){

calculatorServices.CalculatorImplPort calculator = new  calculatorServices.CalculatorImplPort();
   num3 = calculator.doAdd(num1,num2);

}
}