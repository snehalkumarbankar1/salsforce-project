public with sharing class LoanEligibilityUtil {
    
    public static Decimal calculateEligibleAmount(Account acc) {
        if (acc == null || acc.AnnualRevenue == null) {
            return 0;
        }
        Decimal multiplier = 5;
        return acc.AnnualRevenue * multiplier;
    }

    public static Decimal calculateEMI(Decimal principal, Decimal rate, Integer tenureMonths) {
        if (principal == null || rate == null || tenureMonths == null || tenureMonths == 0) {
            return 0;
        }
          Decimal monthlyRate = rate / 12 / 100;

    Double rateDouble = Double.valueOf(monthlyRate);
    Double powerValue = Math.pow(1 + rateDouble, tenureMonths);

    Decimal numerator = principal * monthlyRate * Decimal.valueOf(powerValue);
    Decimal denominator = Decimal.valueOf(powerValue - 1);
        return denominator != 0 ? numerator / denominator : 0;
    }

    public static String categorizeRisk(Decimal eligibleAmount) {
        if (eligibleAmount == null) return 'LOW';
        if (eligibleAmount > 1000000) return 'HIGH';
        if (eligibleAmount > 500000) return 'MEDIUM';
        return 'LOW';
    }
}