public with sharing class ProjSchedulesController {

public ProjSchedulesController() {

}

public List<Product_Schedule__c> schedules;

public ProjSchedulesController(ApexPages.StandardSetController c) {
    c.setPageSize(20);
}

public List<Product_Schedule__c> getSched() {
    schedules = [Select Name,Date__c,Actual_Amount__c,Estimated_Amount__c from Product_Schedule__c  WHERE Product_Service__c =:ApexPages.CurrentPage().GetParameters().Get('id')];
    return schedules;
}

public pageReference save() {
    update schedules;
    PageReference pageRef = ApexPages.currentPage();
    return pageRef.setRedirect(true);
}

public PageReference cancel() {
    PageReference pageRef = ApexPages.currentPage();
    return pageRef.setRedirect(true);
}

}