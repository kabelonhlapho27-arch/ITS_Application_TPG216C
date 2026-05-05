class Course
{
  String courseCode;
  String courseName;
  int durationInWeeks = 0;
  String level;

  //Constructor
  Course(String code, String name, int duration, String courseLevel)
  {
    courseCode = code;
    courseName = name;
    durationInWeeks = duration;
    level = courseLevel;
  }

  //Getters methods
  String get courseCode{
    return courseCode;
  }

  String get courseName{
    return courseName;
  }

  int get durationInWeeks{
    return durationInWeeks;
  }

  String get level{
    return level;
  }

 //Setters
  set courseCode(String code){
    courseCode = code;
  }

  set courseName(String name){
    courseName = name;
  }

  set durationInWeeks(int duration){
    durationInWeeks = duration;
  }

  set level(String courseLevel){
    level = courseLevel;
  }
}