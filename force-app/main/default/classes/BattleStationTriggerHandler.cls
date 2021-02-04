public class BattleStationTriggerHandler {
    
    public static void CreateScheduleRecords(List<Battle_Station__c> BSList){
        
        List<Battle_Station__c> BSrecs = new List<Battle_Station__c>();
        List<Project__c> toCreate = new List<Project__c>();
        
        //Loop through records
        for(Battle_Station__c bs: BSList){
            
            //If record has start date, get IDs and create records
            if(bs.Start_Date__c != NULL){
                BSrecs.add(bs);
            }
        }
        
        //Check if list not empty
        if(!BSrecs.isEmpty()){
            
            for(Battle_Station__c bs: BSrecs){
                
                // Get the Start Date
                Date StartDate = bs.Start_Date__c;
                Integer month = StartDate.month();
                Integer year = StartDate.year();
                boolean FirstIteration = true;
                Integer ctr = 1;
                
                for(Integer i=1; i <=5; i++ ){
                    
                    if(FirstIteration){
                        Project__c proj = new Project__c();
                        proj.Test_Date__c = StartDate;
                        toCreate.add(proj);
                        FirstIteration = false;
                    } else {
                        
                        Date myDate = Date.newInstance(year, month, 1);
                        Date newDate = mydate.addMonths(ctr);
                        //myDate.addMonths(1);
                        System.debug('newDate = ' + newDate);
                        System.debug('ctr before = ' + ctr);
                        Project__c proj = new Project__c();
                        proj.Test_Date__c = newDate;
                        toCreate.add(proj);
                        ctr++;
                        System.debug('ctr after = ' + ctr);
                    }
                }
                
            }
            
        }
        
        System.debug('toCreate value = ' + toCreate);
        
        if(!toCreate.isEmpty()){
            insert toCreate;
        }
        
    }

}