import 'dart:io';
// Imported class files
import 'student.dart';//Student Class
import 'course.dart';//Course Class
import 'registration.dart';//Registration Class
import 'person.dart';//abstract Person Class
import 'fileManager.dart';//save/load functions
//import 'utils.dart'

void main(){
  
  int input = 0;
  if(input != 11)
  print('===================================');
  print("STUDENT COURSE REGISTRATION SYSTEM");
  print('===================================');
  print ("1.Add Student");
  print ("2.View Students");
  print ("3.Add Courses");
  print ("4.View Courses");
  print ("5.Register Student for Course");
  print ("6.View All Registrations");
  print ("7.View All Registrations by Student");
  print ("8.View All Registrations by Course");
  print ("9.Save Data");
  print ("10.Load Data");
  print ("11.Exit ");
  print ("Enter Your Choice:");
  
   input=int.parse(stdin.readLineSync()!);
    switch (input){
      case 1:
          addStudent();//implemented in student.dart
            break;
      case 2:
          displayStudent();//implemented in student.dart
            break;
      case 3:
          addCourse();//implemented in course.dart
            break;
      case 4:
          displayCourse();//implemented in course.dart
            break;
      case 5:
          registerStudentForCourse();//implemented in registration.dart
            break;
      case 6:
          viewAllRegistrations();//implemented in registration.dart
            break;
      case 7:
          viewRegistrationsByStudent();//implemented in registration.dart
            break;
      case 8:
            viewRegistrationsByCourse();//implemented in registration.dart
            break;
      case 9:
          saveAllData();//implemented in fileManager.dart
            break;
      case 10:
          loadAllData();//implemented in fileManager.dart
            break;
      case 11:
        print("Exiting program... End");//exits program
        break;
      default:
         print("Invalid choice.Please Try Again");
         
         break;
    }


}
addStudent(){
  print("Mluja");
}
displayStudent(){}
addCourse(){}
displayCourse(){}
registerStudentForCourse(){}
viewAllRegistrations(){}
viewRegistrationsByStudent(){}
viewRegistrationsByCourse(){}
saveAllData(){}
loadAllData(){}



