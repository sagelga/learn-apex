public class Fitness {

    public static Double calculateBMI(Double weight, Double height) {
        return weight / Math.pow(height, 2);
    }

    public static Double calculatePace(Double distance, Double minuteTime) {
        return distance / minuteTime;
    }
}
