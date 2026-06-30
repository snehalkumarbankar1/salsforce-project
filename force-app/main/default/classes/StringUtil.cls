public class StringUtil {
    
    public static Boolean isBlank(String input){
        
        if(input == null){
            return true;
        }
        String Abc = input.trim();
        if(Abc == ''){
            return true;
        }
        return false;
    }

}