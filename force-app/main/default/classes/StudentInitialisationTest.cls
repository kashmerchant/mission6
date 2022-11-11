/**
 * @author Kashmira Merchant
 * @description Unit tests for StudentInitialisation class (Question 6)
 */
@isTest
private class StudentInitialisationTest {

    /**
     * @description Helper method to get student whose record Id matches studentId.
     * @param studentId Record ID of the updated student.
     */
    private static Contact getStudent(String studentId) {
        
        Contact updatedStudent = [SELECT Id, Prior_Qualification__c,Enrolment_Progression__c 
                                    FROM Contact 
                                    WHERE Id =: studentId];
        
        return updatedStudent;
        
    }
    
    /**
     * @description Unit test 1 - assert('Tertiary Post-Graduate', 'Advanced')
     */
    @isTest
    private static void testAdvanced() {
        
        Contact newStudent = new Contact();
        
        newStudent.FirstName='Test1';
        newStudent.LastName='Advanced';
        newStudent.Prior_Qualification__c = 'Tertiary Post-Graduate';
        newStudent.Enrolment_Progression__c = 'Advanced';
        
        insert newStudent;
        
        List<Contact> toUpdate = new List<Contact>{newStudent};
        StudentInitialisation.updateEnrolmentProgHandler(toUpdate);

        Contact updatedStudent = getStudent(newStudent.Id);
        
        System.assertEquals('Advanced', newStudent.Enrolment_Progression__c);
        
    }
    
    /**
     * @description Unit test 2 - assert('Tertiary Graduate', 'Ultimate')
     */
    @isTest
    private static void testUltimate(){
        
        Contact newStudent = new Contact();
        
        newStudent.FirstName='Test2';
        newStudent.LastName='Ultimate';
        newStudent.Prior_Qualification__c = 'Tertiary Graduate';
        newStudent.Enrolment_Progression__c = 'Ultimate';
        
        insert newStudent;
        
        List<Contact> toUpdate = new List<Contact>{newStudent};
        StudentInitialisation.updateEnrolmentProgHandler(toUpdate);
    
        Contact updatedStudent = getStudent(newStudent.Id);
        
        System.assertEquals('Ultimate', updatedStudent.Enrolment_Progression__c);  
        
    }
    
    /**
     * @description Unit test 3 - assert('Below Tertiary', 'Extra')
     */
    @isTest
    private static void testExtra(){
        
        Contact newStudent = new Contact();
        
        newStudent.FirstName='Test3';
        newStudent.LastName='Extra';
        newStudent.Prior_Qualification__c = 'Below Tertiary';
        newStudent.Enrolment_Progression__c = 'Extra';
                
        insert newStudent;
        
        List<Contact> toUpdate = new List<Contact>{newStudent};
        StudentInitialisation.updateEnrolmentProgHandler(toUpdate);
        
        Contact updatedStudent = getStudent(newStudent.Id);
        
        System.assertEquals('Extra', updatedStudent.Enrolment_Progression__c);
        
    }
}




