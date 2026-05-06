abstract class Person {
  //Fields
  String _firstName;
  String _lastName;
  int  _cellphone;

  Person(this._firstName, this._lastName,this._cellphone); //Constructor
   
   //Getters
   String get firstName{
    return _firstName;
   }
   String get lastName{
    return _lastName;
   }
   int get cellphone{
    return _cellphone;
   }

   //setters
    set firstName(String firstName){
    this._firstName = firstName;
    }
    set lastName(String lastName){
      this._lastName = lastName;
    }
    set cellphone(int cellphone){
      this._cellphone = cellphone;
    }

  
}
