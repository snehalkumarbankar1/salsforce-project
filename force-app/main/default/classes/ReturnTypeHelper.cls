public class ReturnTypeHelper
{
   public Static Integer testReturnType(Integer firstNumber,Integer secondNumber)
   {
       Integer sum = firstNumber + secondNumber;
       return sum;
   }
    public static void useTestReturnType()
    {
        integer sum = testReturnType(2,3);
        system.debug ('sum of value is' + sum);
    }
}