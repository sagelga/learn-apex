@isTest
public class FitnessTest {
    @isTest
    public static void calculateBMITestNormal(){
        Fitness ft = new Fitness();
        List<Double> weightList = new List<Double>{50,60,70,80,90,50,60,70,80,90};
        List<Double> heightList = new List<Double>{1.5, 1.6, 1.7, 1.8, 1.9, 1.9, 1.8, 1.7, 1.6, 1.5};
        List<Double> resultList = new List<Double>{22.2, 23.43,24.2214};
        
        for (Integer i; i<10; i++){
            Double weight = weightList[i];
            Double height = heightList[i];
        	Double testCase = fitness.calculateBMI(weight, height);
			Double result = resultList[i];
            System.assertEquals(result, testCase);
        }
    }
    
    @isTest
    public static void calculateBMITestWeird(){
        
    }
        
}