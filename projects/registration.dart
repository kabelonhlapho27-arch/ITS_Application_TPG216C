import 'course.dart';
import 'student.dart';

class Registration {
  String _regID;
  Student _student;
  Course _course;
  DateTime _regDate;

  Registration(this._regID, this._student, this._course, this._regDate);

  String get regID {
    return _regID;
  }

  Student get student {
    return _student;
  }

  Course get course {
    return _course;
  }

  DateTime get regDate {
    return _regDate;
  }

  set regID(String id) {
    _regID = id;
  }

  set student(Student student) {
    _student = student;
  }

  set course(Course course) {
    _course = course;
  }

  set regDate(DateTime date) {
    _regDate = date;
  }
}
