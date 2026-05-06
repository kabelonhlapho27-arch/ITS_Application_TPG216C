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
  String get courseCode => _courseCode;
  String get courseName => _courseName;
  int get durationInWeeks => _durationInWeeks;
  String get level => _level;

  // Setters
  set courseCode(String value) => _courseCode = value;
  set courseName(String value) => _courseName = value;
  set durationInWeeks(int value) => _durationInWeeks = value;
  set level(String value) => _level = value;
}
