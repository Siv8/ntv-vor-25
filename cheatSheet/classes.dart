
// CLASSES

import 'dart:io';

class person {
  String name;
  int age;
  String? gender;

  person({required this.name,required this.age, this.gender ="Male"});

  void intreduce(){
    print("Hi, I'm $name and I am $age years old $gender");
  }

}

class Vehicle {
  String brand;
  int year;

  Vehicle(this.brand,this.year);

  void displayInfo(){
    print("$brand - $year");
}

}
class Car extends Vehicle {
  int doors;
  String type;
  int mileage;
  
  Car({required this.doors, required this.mileage, required this.type});
}

void main(){
// biðja um nafn
  print("Enter your name please");
  String? name=stdin.readLineSync();

//Biðja um aldur

  print("Enter your age please");
  int? age= int.parse(stdin.readLineSync()!);



  // biðja um Gender

  print("Enter your gender please");
  String? gender=stdin.readLineSync();

  person user = person(name: name!, age: age, gender: gender);

  user.intreduce();
}