/**
 * @author Kashmira Merchant
 * @description  Trigger to update Enrolment Progression field of new and existing students.
 * @param before Denotes before context. Need to modify Enrolment Progression 
 *               field in Trigger.new, which is only writable in before context.
 * @param insert Denotes insert context. Ensures trigger is fired if a new student is added
 * @param update Denotes update context. Ensures trigger is fired if existing
 *               student's Prior Qualification is changed.  
 */
trigger updateEnrolmentProg on Contact (before insert, before update) {
	
    StudentInitialisation.updateEnrolmentProgHandler(Trigger.new);
    
}




