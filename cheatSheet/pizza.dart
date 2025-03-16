import 'dart:io';
import 'dart:math';

// Write a loop that prompts the user to enter a series of pizza toppings until they enter a 'quit value'. As they enter each topping, print a message saying you'll add that topping to their pizza.

void main() {
  stdin.encoding = Utf8Encoder;
  while (true) {
    stdout.write("Hvaða álegg má bjóða þér (type 'quit' to stop): ");
    String? topping = stdin.readLineSync(encoding: utf8)?.trim().toLowerCase();

    if (topping == 'quit') {
      print("Finalizing your pizza order. Enjoy your meal!");
      break;
    } else if (topping != null && topping.isNotEmpty) {
      print("Adding $topping to your pizza!");
    }
  }
}






/*
Use a for loop to print out each letter in the word 'NTV'

You are given a list of pizzas: ['pepperoni', 'Hawaiian", "Cheese","Margherita"]

use a for loop to print out each name of the pizza

modify your program to print a statement about each pizza

modify your program to print a statement about each pizza e.g. "i love eating hawaiian pizza"// Add a line at the end of your program statin that "All pzza is great"
*/

