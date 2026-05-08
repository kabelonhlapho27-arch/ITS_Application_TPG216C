import 'person.dart';

class Student extends Person {
  //field
  String _studentID;

  Student(this._studentID, String firstName, String lastName, String cellphone)
    : super(firstName, lastName, cellphone);

  //Getter
  String get studentID {
    return _studentID;
  }

  //Setter
  set studentID(String studentID) {
    this._studentID = studentID;
  }
}
