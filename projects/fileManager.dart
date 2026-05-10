import 'dart:io';
// Imported class files
import 'student.dart'; //Student Class
import 'course.dart'; //Course Class
import 'registration.dart'; //Registration Class
import 'main.dart'; //main functions

void saveStudents(){
  try{
    var file=File('students.txt');
    var buffer= StringBuffer();

    for(var s in students){
      buffer.writeln('${s.studentID},${s.firstName},${s.lastName},${s.cellphone}',);
    }
    file.writeAsStringSync(buffer.toString());
  }catch(e){
    print('Error saving students: $e');
  }
}

void loadStudents(){
  students.clear();

  var file= File('students.txt');

  if(!file.existsSync()){
    print('No registrations file found. Starting with an empty list.');
    return;
  }
  try{
    List<String> lines=file.readAsLinesSync();

    for(var line in lines){
      if(line.trim().isEmpty)continue;

      var parts = line.split(',');
      if(parts.length>=4){
        String studentID = parts[0].trim();
        String firstName= parts[1].trim();
        String lastName= parts[2].trim();
        String cellphone= parts[3].trim();

        students.add(Student(studentID,firstName,lastName,cellphone));
      }
    }
  }catch(e){
    print('Error loading students:$e');
  }
}

void saveRegistrations() {
  try {
    var file = File('registrations.txt');
    var buffer = StringBuffer();

    for (var r in registrations) {
      String formattedDate = r.regDate.toString().split(' ')[0];

      buffer.writeln(
        '${r.regID},${r.student.studentID},${r.course.courseCode},$formattedDate',
      );
    }

    
    file.writeAsStringSync(buffer.toString());
  } catch (e) {
    print('Error saving registrations: $e');
  }
}

void loadRegistrations() {
  // Clear existing list before loading to prevent duplicates
  registrations.clear();

  var file = File('registrations.txt');

  if (!file.existsSync()) {
    print('No registrations file found. Starting with an empty list.');
    return;
  }

  try {
    List<String> lines = file.readAsLinesSync();

    for (var line in lines) {
      if (line.trim().isEmpty) continue;

      var parts = line.split(',');

      if (parts.length >= 4) {
        String regID = parts[0].trim();
        String studentID = parts[1].trim();
        String courseCode = parts[2].trim();
        DateTime regDate = DateTime.parse(parts[3].trim());

        Student? student = findStudentById(studentID);
        Course? course = findCourseByCode(courseCode);

        if (student != null && course != null) {
          registrations.add(Registration(regID, student, course, regDate));
        }
      } else {
        print('Invalid line format in registrations.txt: $line');
      }
    }
  } catch (e) {
    print('Error loading registrations: $e');
  }
}
