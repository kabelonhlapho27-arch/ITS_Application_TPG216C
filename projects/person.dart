abstract class Person {
  //Fields
  String _firstName;
  String _lastName;
  String _cellphone;

  Person(this._firstName, this._lastName, this._cellphone); //Constructor

  //Getters
  String get firstName {
    return _firstName;
  }

  String get lastName {
    return _lastName;
  }

  String get cellphone {
    return _cellphone;
  }

  //setters
  set firstName(String firstName) {
    this._firstName = firstName;
  }

  set lastName(String lastName) {
    this._lastName = lastName;
  }

  set cellphone(String cellphone) {
    this._cellphone = cellphone;
  }
}
