/**
 * @author Kashmira Merchant
 * @description Test for AddEnrolment trigger (v2).
 */
@isTest
private class AddEPnrolmentTest2 {	
    
    @isTest
    private static void testAddEnrolmentTrigger() {	
        
        // Create test data...
        // ...dummy SA1
        Course__c dummySA1 = new Course__c();

        dummySA1.Name = 'Sprint Training';
        dummySA1.Foundation_Course__c = true;
        dummySA1.Level__c = 1;
        dummySA1.Course_ID__c = 'SA1';
        
        insert dummySA1;
                
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









