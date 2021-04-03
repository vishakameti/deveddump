@isTest
public class WarehouseSyncScheduleTest {
    
    @isTest
    public static void testMethod1(){
        test.startTest();
        String sch = '20 30 8 10 2 ?';
        String jobID = System.schedule('Remind Opp Owners', sch, new WarehouseSyncSchedule());
        test.stopTest();
    }

}