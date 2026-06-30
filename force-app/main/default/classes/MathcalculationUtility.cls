Public class MathcalculationUtility {
    
    Public static void Addition(Integer fNumber , Integer sNumber)
    {  
        System.debug('addition result is...'+ (fNumber+sNumber));
    }
    Public static void  Multiply(Integer fNumber, Integer sNumber , Integer tNumber)
    {
        System.debug('Multiplication result is...'+ (fNumber*sNumber*tNumber));
    }  
    Public static void  Division(Integer fNumber, Integer sNumber)
    {
        if(sNumber>0)
            System.debug('Division result is...'+ (fNumber/sNumber));
        else 
            System.debug('division operation cannot performed as sNumber is zero');
    }
    Public static void CheckEquals(Integer fNumber, Integer sNumber)
    {  
        if(fNumber == sNumber)
        System.debug('values are equals');
     else if(fNumber>sNumber)
         System.debug('fNumber is bigger one');
     else 
         System.debug('sNumber is biggest one');
    }
}