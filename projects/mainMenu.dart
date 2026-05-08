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
  while(input != 11){
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
          Student('','','',0).addStudent();//implemented in student.dart
            break;
      case 2:
          Student('','','',0).displayStudent();//implemented in student.dart
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
}

addStudent(){}
displayStudent(){}
//find student by ID helper function to avoid code duplication in registerStudentForCourse and viewRegistrationsByStudent
Student? findStudentById(String studentId) {
  try {
    return students.firstWhere((s) => s.studentID == studentId);
  } catch (e) {
    return null;
  }
}
addCourse(){}
displayCourse(){}
//find course by code helper function to avoid code duplication in registerStudentForCourse and viewRegistrationsByCourse
Course? findCourseByCode(String courseCode) {
  try {
    return courses.firstWhere((c) => c.courseCode == courseCode);
  } catch (e) {
    return null;
  }
}
void registerStudentForCourse() {
  print('\n=========================================');
  print('REGISTER STUDENT FOR COURSE');
  print('=========================================');
  stdout.write('Enter Student ID: ');

  String studentID = stdin.readLineSync()?.trim() ?? '';

  Student? student = findStudentById(studentID);

  // Validate if the student actually exists before moving on
  if (student == null) {
    print('Error: Student not found. Please try again.');
    return; // Stop the function here so it doesn't crash later
  }

  stdout.write('Enter Course Code: ');
  String? courseCode = stdin.readLineSync()?.trim() ?? '';

  Course? course = findCourseByCode(courseCode);
  if (course == null) {
    print('Error: Course does not exist.');
    return;
  }
  stdout.write('Enter registration date (YYYY-MM-DD): ');
  String? dateStr = stdin.readLineSync()?.trim();
  DateTime? regDate;
  try {
    regDate = DateTime.parse(dateStr!);
    if (regDate.isAfter(DateTime.now())) {
      print('Error: Registration date cannot be in the future.');
      return;
    }
  } catch (e) {
    print('Invalid date format. Use YYYY-MM-DD.');
    return;
  }

  String regID = 'REG${registrations.length + 1}';
  registrations.add(Registration(regID, student, course, regDate));
}
viewAllRegistrations(){}
viewRegistrationsByStudent(){}
viewRegistrationsByCourse(){}
saveAllData(){}
loadAllData(){}



