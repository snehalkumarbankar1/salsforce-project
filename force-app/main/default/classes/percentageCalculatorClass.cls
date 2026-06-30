public with sharing class percentageCalculatorClass {
    
    public static Double getPercentages(Integer totalMarks, Integer englishMarks, Integer mathMarks) {
        Double percentages = ((englishMarks + mathMarks) / (Double)totalMarks) * 100;
        return percentages;
    }
}