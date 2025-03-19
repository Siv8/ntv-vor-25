//1.vistað conntact ss símanúmer / Nafn / email
//2.eytt contact
//3. séð alla contacts
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:convert';

class contact {
  String name;
  String email;
  String number;
  contact(this.name,this.email,this.number);
}
String getFormattedName(String label, String defaultName) {
  stdout.write("Enter $label name: ");
  String? input = stdin.readLineSync(encoding: utf8);
  if (input == null || input
      .trim()
      .isEmpty) return defaultName;

  input = input.trim();
  String formatted = input[0].toUpperCase() + input.substring(1).toLowerCase();
  return " $formatted";


}

