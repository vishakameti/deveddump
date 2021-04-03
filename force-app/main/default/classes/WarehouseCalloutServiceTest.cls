@IsTest
private class WarehouseCalloutServiceTest {
    // implement your mock callout test here
    // 
    @isTest
    public static void WarehouseCalloutServiceTest(){
        test.startTest();
        test.setMock(httpCalloutMock.class, new WarehouseCalloutServiceMock());
        WarehouseCalloutService.runWarehouseEquipmentSync();
        test.stopTest();
    }
    
}