@isTest
public class FitnessTest {

    @isTest
    public static void testCalculateBMI() {
        Double weight = 70.0;
        Double height = 1.75;
        Double expectedBMI = 22.857142857142858; // Expected BMI calculated manually
        
        Double actualBMI = Fitness.calculateBMI(weight, height);
        
        Assert.areEqual(expectedBMI, actualBMI); 
    }

    @isTest
    public static void testCalculatePace() {
        Double distance = 10.0;
        Double minuteTime = 60.0;
        Double expectedPace = 0.16666666666666666; // Expected pace calculated manually
        
        Double actualPace = Fitness.calculatePace(distance, minuteTime);
        
        Assert.areEqual(expectedPace, actualPace); 
    }
}
