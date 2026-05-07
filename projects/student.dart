import 'dart:io';

import 'person.dart';
class Student extends Person
{
  //field
  String _id;

  Student(this._id,String _firstName,String _lastName,int _cellphone)
    :super(_firstName,_lastName,_cellphone);

  //Getter
  String get ID{
    return_id;
  }
  //Setter
  set ID(String ID){
    this._id=ID;
  }

  static List<Student> student=[];
  
  void addStudent()
  {
    String choice="y";

    //Inputs
    while(choice.toloweCase()=="y"){
      print("Enter a student ID:");
      _id = stdin.readLineSync()!.trim();
      print ("Enter first name:");
      firstname = stdin.readLineSync()!.trim();
      print("Enter last name:");
      lastName = stdin.readLineSync()!.trim();
      print("Enter a cellphone");
      cellphone = int.parse(stdin.readLineSync()!.trim());

      //Validation
      if(_id.isEmpty && firstName.isEmpty && lastName.isEmpty)
      {
        print("All inputs required.Please try again");
        addStudent();
        continue;
      }

      bool _idExists= students.any((s) => s.ID == _id);
      if(_idExists){
        print("Student ID already exists. Please enter a unique ID");
        addStudents();
        continue;
      }

      student.add(Student(_id,firstName,lastName,cellphone));
      print("Student added successfully.")

        print("Do you want add another student? (y/n)");
      choice= stdin.readLineSync()!;
    }
    return;
  }
  void displayStudent()
  {
    if(student.isEmpty){
      print("No student found");
    }else{
      print("STUDENT LIST");
      print("------------------------------------------");
      print("ID          Name              Cellphone");
      for(var s in students)
      {
        print("${s.ID}      ${s.firstName}${s.lastName}                     ${s.cellphone}");
      }
    }
  }
}
