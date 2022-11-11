/**
 * @author Kashmira Merchant
 * @description Test for AddEnrolment trigger (v1). 
 */
@isTest(SeeAllData=True)
private class AddEnrolmentTest1 {	
    
    @isTest(SeeAllData=True)
    private static void testAddEnrolmentTrigger() {	
        
        // Create test data...                
        // ...dummy new Student
        Contact newStudent = new Contact();
        
        newStudent.FirstName = 'Harry';
        newStudent.LastName = 'Potter';	
        newStudent.Prior_Qualification__c = 'Below Tertiary';	
        newStudent.Enrolment_Progression__c ='Advanced';
        
        insert newStudent;	
        
        // Query enrolment of newly inserted student                                             
        List<Enrolment__c> enrolmentList = [SELECT Id, Student__c 
                                            FROM Enrolment__c 
                                            WHERE Student__r.Id =: newStudent.Id];

        // Check that enrolment was returned                     	
        System.assertNotEquals(enrolmentList.size(), 0);
        
    }	
    
}



















