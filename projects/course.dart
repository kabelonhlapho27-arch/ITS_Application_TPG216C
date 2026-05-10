class Course
{
  // Private fields
  String _courseCode;
  String _courseName;
  int _durationInWeeks;
  String _level;

  // Constructor that accepts all four fields
  Course(this._courseCode, this._courseName, this._durationInWeeks, this._level);

  // Getters
  String get courseCode{
    return _courseCode;
  }

  String get courseName {
    return _courseName;
  }
  int get durationInWeeks {
    return _durationInWeeks;
  }
  String get level {
    return _level;
  }

  // Setters
  set courseCode(String courseCode) {
    this._courseCode = courseCode;
  }
  
  set courseName(String courseName) {
    this._courseName = courseName;
  }

  set durationInWeeks(int durationInWeeks) {
    this._durationInWeeks = durationInWeeks;
  }

  set Level(String level) {
    this._level = level;
  }
}
