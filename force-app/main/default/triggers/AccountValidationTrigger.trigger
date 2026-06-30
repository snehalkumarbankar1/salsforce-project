trigger AccountValidationTrigger on Account (before insert) {

    if(Trigger.isInsert && Trigger.isBefore){
        for(Account accRecord : Trigger.New){
            if(accRecord.Rating == null || accRecord.Rating == ''){
                accRecord.Rating.AddError('please select the rating value');
            }
             if(accRecord.Industry == null || accRecord.Industry == ''){
                accRecord.Industry.AddError('Please enter Industry value');
            }
              if(accRecord.Phone == null || accRecord.Phone == ''){
                accRecord.Phone.AddError('please enter Phone value');
            }
        }
    }
}