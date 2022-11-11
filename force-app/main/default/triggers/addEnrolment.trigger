/**
 * @author Kashmira Merchant
 * @description Creates an association (Enrolment record) between newly 
 *              created Student and each foundation course (SA1).
 */
trigger addEnrolment on Contact (after insert) { 

    // List of Enrolments to store new Enrolment records
    List<Enrolment__c> enrolmentList = New List<Enrolment__c>();            
    
    // Get list of foundation courses
    List<Course__c> foundationCourses = [SELECT Id, Foundation_Course__c 
                                        FROM Course__c 
                                        WHERE Foundation_Course__c = true];
    
    // For each newly created student...
    for(Contact newStudent : Trigger.new){
    
        // For each foundation course...    
        for (Course__c course : foundationCourses) {
    
            // Create a new Enrolment record    
            Enrolment__c newEnrolment = new Enrolment__c();    
            newEnrolment.Course__c = course.Id;         
            newEnrolment.Student__c = newStudent.id;
    
            // Add to list of Enrolments    
            enrolmentList.add(newEnrolment);
        }       
            
    }
    
        if(enrolmentList.size() > 0){
    
            // Insert all new Enrolment records (bulkification)   
            insert enrolmentList;
    
        }  
    
    }
    
    
    
    
    
    
    
    
    
    