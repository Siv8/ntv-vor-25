import 'dart:convert';
import 'dart:io';
import 'package:ntv_vor_25/methods.dart';
String capitalize(String? name) {
  if (name == null || name.isEmpty) {
    return "";
  }
  return name[0].toUpperCase() + name.substring(1).toLowerCase();
}

int calculateAgeFromSSN(String ssn) {
  if (ssn.length < 6) {
    return -1;
  }

  try {
    int day = int.parse(ssn.substring(0, 2));
    int month = int.parse(ssn.substring(2, 4));
    int year = int.parse(ssn.substring(4, 6));


    int fullYear = (year >= 0 && year <= 23) ? 2000 + year : 1900 +
        year;


    if (month < 1 || month > 12 || day < 1 || day > 31) {
      return -1;
    }


    DateTime birthDateTime = DateTime(fullYear, month, day);
    DateTime today = DateTime.now();


    int age = today.year - birthDateTime.year;
    if (today.month < month || (today.month == month && today.day < day)) {
      age--;
    }

    return age;
  } catch (e) {
    return -1;
  }
}

void main(List<String> arguments) {

  /* 0. Create a personal message. Use a variable to represent a person's name, and print a
    message to that person. Your message should be simple, such as 'Good morning
    Hjörtur, would you like to learn Dart strings today?'
    Store Message and Name in seperate variable.*/


  // svar við spurningu 0
  print("Hello, whats your name?");
  String userName  = stdin.readLineSync(encoding: utf8).toString();
  print(
      "Good morning, $userName Whould you like to learn Dart strings today?");


  /* 1. Find a quote from a famous person you admire. Print the quote and the name of its
  author. Your output should look something like the following, including the
  quotation marks:
  1. Albert Einstein once said, 'A person who never made a mistake never tried
  anything new.'*/

  //svar við spurningu 1
  String authorFirstName = "Albert";
  String authorLastName = "Einstein";
  String quote = "once said, 'A person Who never made a mistake never tried anything new.'";
  print("$authorFirstName $authorLastName $quote");

  /* 2. Assign a message to a variable, and print that message. Then change the value of
  the variable to a new message, and print the new message.*/

  //svar við spurning 2
  print("What is your first name?");
  String? firstName = stdin.readLineSync();

  firstName = firstName!.replaceAll(firstName, "Yedi");
  print("Hello $firstName!");


 /* 3.  Remove all the spaces from the rhyme. And print the modified rhyme.
  String NureseryRyhme = "Eena, meena, mina, mo, Catch a mouse by the toe; If he squeals let him go, Eeena, meena, mina, mo.";*/

  // svar við spurningu 3
  String NureseryRyhme = "Eena, meena, mina, mo, Catch a mouse by the toe; If he squeals let him go, Eeena, meena, mina, mo.";
  String modifieRyhme = NureseryRyhme.replaceAll(" ", "replace");

  print(modifieRyhme);


  /* 4. Prompt a user for their full name (first name and last name)
    1. Store the users entry.
    2. Display the users entry with every letter being capitalised.
    3. Replace the first name with your name, and display it.
    4. Capitalise and display the users full name with each word having a capital
    first letter, and the other letters being lowercase.*/

//Svar Við Spurningu 4
  print("What is your first name?");
  String? userFirstName = stdin.readLineSync(encoding: utf8);
  print("What is your last name?");
  String? userLastName  = stdin.readLineSync(encoding: utf8);
  String upperFirstName = (userFirstName ?? "").toUpperCase();
  String upperLastName = (userLastName  ?? "").toUpperCase();

  print("Hello $upperFirstName $upperLastName");

  upperFirstName = "JÓN";

  print("Hello $upperFirstName $upperLastName");
  String capitalizedFirstName = capitalize(userFirstName);
  String capitalizedLastName = capitalize(userLastName);

  print("Hello $capitalizedFirstName $capitalizedLastName");


  /* 5. Display the following SSN on the correct Format:
      F.x. 2006892409*/

  String SSN1 = "200689-2409";
  String SSN2 = "200689 2409";
  String SSN3 = "2 006 8924 09";

  print("formatted SSNs:");
  print(SSN1.replaceAll("-", ""));
  print(SSN2.replaceAll(" ", ""));
  print(SSN3.replaceAll(" ", ""));
//  Bónus task calculate the age from the SSN.
  List<String> formattedSSNs = ["2006892409", "2006892409", "2006892409"];

  print("Formatted SSNs: $formattedSSNs");


  int ssnAge1 = calculateAgeFromSSN(formattedSSNs[0]);
  int ssnAge2 = calculateAgeFromSSN(formattedSSNs[1]);
  int ssnAge3 = calculateAgeFromSSN(formattedSSNs[2]);


  print("ssnAge1: $ssnAge1 years old");
  print("ssnAge2: $ssnAge2 years old");
  print("ssnAge3: $ssnAge3 years old");




// auka bónus biðja um SSN laga formatt og segja aldur
  print("What is your SSN?");
  String? inputSSN = stdin.readLineSync()?.trim();

  if (inputSSN == null || inputSSN.isEmpty) {
    print("Invalid input. Please enter a valid SSN.");
    return;
  }

  String formattedSSN = inputSSN.replaceAll(RegExp(r'[- ]'), '');
  int age = calculateAgeFromSSN(formattedSSN);
  if (age == -1) {
    print("Invalid SSN. Please enter a correct one.");
  } else if (age > 33) {
    print("You are $age years old, mother fucker!");
  } else {
    print("You are $age years old.");
  }
}

