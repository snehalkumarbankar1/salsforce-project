trigger AccountRevenueTrigger on Account (before insert,before update) {

    if(Trigger.IsBefore && (Trigger.IsInsert || Trigger.IsUpdate)){
        for (Account accRecord : Trigger.New){
            Switch ON accRecord.industry{
                When 'Banking'{
                    accRecord.AnnualRevenue = 4300000;
                }
                When 'Finance'{
                    accRecord.AnnualRevenue = 3500000;
                }
                When 'Insurance'{
                    accRecord.AnnualRevenue = 7200000;
                }
                When 'Manufacturing'{
                    accRecord.Annualrevenue = 6000000;
                }
                When 'Technology'{
                    accRecord.AnnualRevenue = 5500000;
                }
                When 'Education'{
                    accRecord.AnnualRevenue = 8000000;
                }
                When 'Consulting'{
                    accRecord.AnnualRevenue = 4500000;
                }
            }
        }
    }
}