trigger BattleStationTrigger on Battle_Station__c (after insert) {

    if(trigger.isAfter && trigger.isInsert){
        BattleStationTriggerHandler.CreateScheduleRecords(trigger.new);
    }

}