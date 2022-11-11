/**
 * @author Kashmira Merchant
 * @description Methods for intialising Prior Qualification and Enrolment Progression fields (Question 7).
 */
public class StudentInitialisation {
    
    /**
     * @description Randomly assigns a prior qualification to each record in studentList.
     * @param studentList List of Student records.
     */
    public static void assignPriorQual(List<Contact> studentList) {     
        
        List<String> priorQuals = new List<String>{'Below Tertiary', 
                                                    'Tertiary Graduate',
                                                    'Tertiary Post-Graduate'};
            
        for (Contact student : studentList){
                
                // Generating a random index into priorQuals list
                Integer i = Integer.valueOf(Math.floor(Math.random()*priorQuals.size()));
                
                student.Prior_Qualification__c = priorQuals[i];

        }    
        
        update studentList;
        
    }
    
    /**
     * @description Determines a student's enrolment progression. Called by the updateEnrolmentProg trigger.
     * @param studentList List of Student records.
     */
    public static void updateEnrolmentProgHandler(List<Contact> studentList) {
        
        for (Contact student : studentList){

            switch on student.Prior_Qualification__c {      // Used switch in place of if-else for parsimony

                when 'Below Tertiary' {
                    student.Enrolment_Progression__c = 'Advanced';
                }
                when 'Tertiary Graduate' {
                    student.Enrolment_Progression__c = 'Ultimate';
                }
                when 'Tertiary Post-Graduate' {
                    student.Enrolment_Progression__c = 'Extra';
                }
                when else {
                    null;
                }
                
            }
            
        }
        
    }
    
}












