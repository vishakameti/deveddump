@isTest
private class TemperatureConverterTest {
    @isTest static void testWarmTemp() {
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(70);
      //  System.assertEquals(21.11,celsius);
    }
    
    @isTest static void testvishak(){
        TemperatureConverter.b='abc';
        TemperatureConverter.vishak();
        TemperatureConverter.b='abcd';
        TemperatureConverter.vishak();
    }
}