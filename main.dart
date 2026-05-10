import 'dart:io';
// Imported class files
import 'student.dart'; //Student Class
import 'course.dart'; //Course Class
import 'registration.dart'; //Registration Class
import 'fileManager.dart'; //save/load functions

//import 'utils.dart'

//Lists to hold data in memory(made them global to be accessible across all functions without needing to pass them as parameters)
List<Student> students = [];
List<Course> courses = [];
List<Registration> registrations = [];

void main() {
  mainMenu();
}

void mainMenu() {
  bool isRunning = true;

  while (isRunning) {
    print('\n=========================================');
    print('STUDENT COURSE REGISTRATION SYSTEM');
    print('=========================================');
    print('1. Add Student');
    print('2. View Students');
    print('3. Add Course');
    print('4. View Courses');
    print('5. Register Student for Course');
    print('6. View All Registrations');
    print('7. View Registrations by Student');
    print('8. View Registrations by Course');
    print('9. Save Data');
    print('10. Load Data');
    print('11. Exit');
    print('=========================================');
    stdout.write('Enter your choice: ');

    String? input = stdin.readLineSync();

    try {
      if (input == null || input.isEmpty) throw FormatException();
      int choice = int.parse(input);

      switch (choice) {
        case 1:
          addStudent();
          break;
        case 2:
          displayStudent();
          break;
        case 3:
          addCourse();
          break;
        case 4:
          displayCourse();
          break;
        case 5:
          registerStudentForCourse();
          break;
        case 6:
          viewAllRegistrations();
          break;
        case 7:
          viewRegistrationsByStudent();
          break;
        case 8:
          viewRegistrationsByCourse();
          break;
        case 9:
          saveAllData();
          break;
        case 10:
          loadAllData();
          break;
        case 11:
          isRunning = false;
          print('Exiting application. Goodbye!');
          break;
        default:
          print(
            'Invalid option. Please enter a valid number between 1 and 11.',
          );
      }
    } catch (e) {
      print('Invalid option. Please enter a valid number.');
    }
  }
}

void addStudent() {
  //Inputs
  String choice = "y";

  while (choice.toLowerCase() == "y") {
    print("Enter a student ID:");
    String studentID = stdin.readLineSync()!.trim();

    print("Enter first name:");
    String firstName = stdin.readLineSync()!.trim();

    print("Enter last name:");
    String lastName = stdin.readLineSync()!.trim();

    print("Enter a cellphone:");
    String cellphone = stdin.readLineSync()!.trim();

    // Validation(Changed AND to OR so each of the user input is checked for being empty.)
    if (studentID.isEmpty ||
        firstName.isEmpty ||
        lastName.isEmpty ||
        cellphone.isEmpty) {
      print("All inputs required. Please try again.");
      //removed the call of studentd add to avoid an infinte loop as continue will already restart the loop.
      continue;
    }

    // Check for duplicates
    bool idExists = students.any((s) => s.studentID == studentID);
    if (idExists) {
      print("Student ID already exists. Please enter a unique ID.");
      continue;
    }

    // Add to list
    students.add(Student(studentID, firstName, lastName, cellphone));
    print("Student added successfully.");

    print("Do you want to add another student? (y/n)");
    choice = stdin.readLineSync()!.trim();
  }
}

displayStudent() {
  if (students.isEmpty) {
    print("No student found");
  } else {
    print("STUDENT LIST");
    print("------------------------------------------");
    print("ID          Name              Cellphone");
    for (var s in students) {
      print(
        "${s.studentID}      ${s.firstName}${s.lastName}                     ${s.cellphone}",
      );
    }
  }
}

//find student by ID helper function to avoid code duplication in registerStudentForCourse and viewRegistrationsByStudent
Student? findStudentById(String studentId) {
  try {
    return students.firstWhere((s) => s.studentID == studentId);
  } catch (e) {
    return null;
  }
}

addCourse() {
  String choice = 'y';

  while (choice.toLowerCase() == 'y') {
    print("Enter course code: ");
    String courseCode = stdin.readLineSync()!.trim();

    print("Enter course name: ");
    String courseName = stdin.readLineSync()!.trim();

    print("Enter duration in weeks: ");
    int durationInWeeks = int.parse(stdin.readLineSync()!.trim());

    print("Enter course level: ");
    String level = stdin.readLineSync()!.trim();

    // Validation
    if (courseCode.isEmpty ||
        courseName.isEmpty ||
        durationInWeeks <= 0 ||
        level.isEmpty) {
    
        print("All inputs required. Please try again.");
        continue;
    }

    // Create unique courseCode
    bool courseCodeExists = courses.any((nr) => nr.courseCode == courseCode);
    if(courseCodeExists) {
      print("Course code already exists. Please enter unique course code.");
      continue;
    }

    // Add to list
    courses.add(Course(courseCode, courseName, durationInWeeks, level));
    print("Course added succssfully.");

    print("Do you want to add another course? (y/n)");
    choice = stdin.readLineSync()!.trim();

  }
}
displayCourse() {
   if (courses.isEmpty) {
    print("No courses found");
  } else {
    print("COURSE LIST");
    print("---------------------------------------------------");
    print("Code      Course Name              Duration   Level");
    for (var nr in courses) {
      print(
        "${nr.courseCode}      ${nr.courseName}                ${nr.durationInWeeks} weeks    ${nr.level}",
      );
    }
  }
}
//find course by code helper function to avoid code duplication in registerStudentForCourse and viewRegistrationsByCourse
Course? findCourseByCode(String courseCode) {
  try {
    return courses.firstWhere((c) => c.courseCode == courseCode);
  } catch (e) {
    return null;
  }
}

void registerStudentForCourse() {
 String choice = 'y';

  while (choice.toLowerCase() == 'y') {
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
    print("Student registered for course successfully.");

    print("Do you want to register another student for a course? (y/n)");
    choice = stdin.readLineSync()!.trim();
  } //end while
}

void viewAllRegistrations() {
  if (registrations.isEmpty) {
    print('No registrations found.');
    return;
  }

  print('\nREGISTRATION LIST');
  print(
    'Reg ID'.padRight(10) +
        'Student ID'.padRight(15) +
        'Student Name'.padRight(25) +
        'Course Code'.padRight(15) +
        'Course Name',
  );
  print(
    '------------------------------------------------------------------------------------',
  );

  for (var r in registrations) {
    String fullName = '${r.student.firstName} ${r.student.lastName}';

    String regCol = r.regID.padRight(10);
    String studentIdCol = r.student.studentID.padRight(15);
    String nameCol = fullName.padRight(25);
    String courseCodeCol = r.course.courseCode.padRight(15);

    print('$regCol$studentIdCol$nameCol$courseCodeCol${r.course.courseName}');
  }
}

void viewRegistrationsByStudent() {
  stdout.write('Enter Student ID: ');

  String studentID = stdin.readLineSync()?.trim() ?? '';
  Student? student = findStudentById(studentID);

  if (student == null) {
    print('Error: Student not found.');
    return;
  }

  print('\nREGISTRATIONS FOR ${student.studentID}-${student.firstName} ${student.lastName}');
  print('\tCourse Code\tCourse Name\tRegistration Date');
  print(
    '------------------------------------------------------------',
  );
  for (var r in registrations) {
    if (r.student == student) {
      print(
        '${r.course.courseCode}\t\t${r.course.courseName}\t${r.regDate.toLocal().toString().split(' ')[0]}',
      );
    }
  }
}

void viewRegistrationsByCourse() {
  stdout.write('Enter Course Code: ');

  String courseCode = stdin.readLineSync()?.trim() ?? '';
  Course? course = findCourseByCode(courseCode);

  if (course == null) {
    print('Error: Course not found.');
    return;
  }

   print('\nREGISTRATIONS FOR ${course.courseCode}- ${course.courseName}');
  print('\tStudent ID\tStudent Name\tRegistration Date');
  print(
    '------------------------------------------------------------',
  );
  for (var r in registrations) {
    if (r.course.courseCode == course.courseCode) {
      print(
        '${r.student.studentID}\t\t${r.student.firstName} ${r.student.lastName}\t${r.regDate.toLocal().toString().split(' ')[0]}',
      );
    }else {
      print('No registrations found for this course.');
    }
  }

}
saveAllData() {
  saveCourses();
  saveStudents();
  saveRegistrations();
  print('\nAll system data saved successfully.');
}
loadAllData() {
  loadCourses();
  loadStudents();
  loadRegistrations();
  print('\nAll system data saved successfully.');
}
