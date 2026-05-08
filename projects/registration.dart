import 'course.dart';
import 'student.dart';

class Registration {
  String _regID;
  Student _studentID;
  Course _courseCode;
  DateTime _regDate;

  Registration(this._regID, this._studentID, this._courseCode, this._regDate);

  String get regID {
    return _regID;
  }

  Student get studentID {
    return _studentID;
  }

  Course get courseCode {
    return _courseCode;
  }

  DateTime get regDate {
    return _regDate;
  }

  set regID(String id) {
    _regID = id;
  }

  set studentID(Student student) {
    _studentID = student;
  }

  set courseCode(Course course) {
    _courseCode = course;
  }

  set regDate(DateTime date) {
    _regDate = date;
  }
}
