public class TemperatureConverter {
    // Takes a Fahrenheit temperature and returns the Celsius equivalent.
    public static Decimal FahrenheitToCelsius(Decimal fh) {
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
    public static String b;
    public static void vishak(){
         String a = 'abc';
        system.debug('vishak');
        
        if(b==a){
            system.debug('aaa');
        }
        else{
            system.debug('failed');
        }
    }
}