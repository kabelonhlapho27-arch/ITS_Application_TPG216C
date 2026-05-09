import 'dart:io';
// Imported class files
import 'student.dart'; //Student Class
import 'course.dart'; //Course Class
import 'registration.dart'; //Registration Class
import 'main.dart'; //main functions

Future<void> saveRegistrations() async {
  try {
    var file = File('registrations.txt');

    if (!await file.exists()) {
      await file.create();
      print('registrations.txt created successfully.');
    } else {
      print('registrations.txt already exists. Overwriting with current data.');
    }
    var buffer = StringBuffer();
    for (var r in registrations) {
      buffer.writeln(
        '${r.regID},${r.student.studentID},${r.course.courseCode},${r.regDate.toIso8601String()}',
      );
    }
    await file.writeAsString(buffer.toString());
    print('Registrations saved to file.');
  } catch (e) {
    print('Error saving registrations: $e');
  }
}

Future<void> loadRegistrations() async {
  var file = File('registrations.txt');
  try {
    if (await file.exists()) {
      List<String> lines = await file.readAsLines();
      registrations
          .clear(); // Clear existing registrations before loading new ones
      for (var line in lines) {
        if (line.trim().isEmpty) continue; // Skip empty lines
        var parts = line.split(',');
        if (parts.length == 4) {
          String regID = parts[0];
          String studentID = parts[1];
          String courseCode = parts[2];
          DateTime regDate = DateTime.parse(parts[3]);

          // Find the student and course
          Student? student = findStudentById(studentID);
          Course? course = findCourseByCode(courseCode);

          if (student != null && course != null) {
            registrations.add(Registration(regID, student, course, regDate));
          }
        } else {
          print('Invalid line format in registrations.txt: $line');
        }
      }
      print('Registrations loaded from file.');
    } else {
      print('No registrations file found. Starting with an empty list.');
    }
  } catch (e) {
    print('Error loading registrations: $e');
  }
}