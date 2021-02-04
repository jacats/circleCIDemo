public class NewCaseListController {

    public List<Case> getNewCases() {
        List<Case> CaseList = [SELECT ID, CaseNumber, Status FROM Case WHERE Status = 'New'];
            /*Database.query(
            'SELECT Id, FirstName, LastName, Title, Email ' +
            'FROM Contact ' +
            'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT 10'
        );*/
            
        return CaseList;
    }

}