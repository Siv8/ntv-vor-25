// búa til class sem heitir person
// person er með nafn, aldur og starf
// búum til mehod/aðferð sem : prentar út nafnið + afmælið ár bætist við aldurinn og prentar
// svo út nýja aldurinn - segja upp. Prentar út uppsögn eða bara ég hætti í # job
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:convert';

class person {
  String name;
  int age;
  String? job;

  person(this.name,this.age,this.job);

  void birthday(){
  age++;
  print("its my birthday I'm $age year old");
  }
  void greeting(){
    print("Hi my name is $name and I am $age years old");
  }
  void quitjob(){
    job = "Atvinnulaus";
    print("I quit my job and I'm now $job");
  }

}

  void main(){
    person jon = person("jon", 29, "programming");
    jon.greeting();
    jon.birthday();
    jon.quitjob();

  }







