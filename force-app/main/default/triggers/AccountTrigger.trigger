trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    if(trigger.isBefore){
        for(Account a: trigger.new){
            a.Account_Counter__c++;
        	System.debug('Account Counter ' + a.Account_Counter__c);
        }
         
    }
    
   
}