public class PostalPincodeParserHelper {

    public static void parseJSONContent(){
        String postalJSON = '{"Name":"Sanjeev Reddy","Description":"null","BranchType":"Sub Postal Office","Circle":"Andhra Pradesh"}';
     
        System.JSONParser pParser = System.JSON.createParser(postalJSON);
      
        While(pParser.nextToken() != null) {
           
            if(pParser.getCurrentToken() == JsonToken.FIELD_NAME && pParser.getText()=='Name'){
                pParser.nextToken();
                System.debug('Branch Name is..'+ pParser.getText());
            }
            else if(pParser.getCurrentToken() == JsonToken.FIELD_NAME && pParser.getText()=='Description'){
                pParser.nextToken();
                System.debug('Description is..'+ pParser.getText());
            }
             else if(pParser.getCurrentToken() == JsonToken.FIELD_NAME && pParser.getText()=='BranchType'){
                pParser.nextToken();
                System.debug('Branch Type is..'+ pParser.getText());
            }
            else if(pParser.getCurrentToken() == JsonToken.FIELD_NAME && pParser.getText()=='Circle'){
                pParser.nextToken();
                System.debug('Circle is..'+ pParser.getText());
            }
        }
    }
}