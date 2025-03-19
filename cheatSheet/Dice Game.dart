import 'dart:io';
import 'dart:math';
import 'dart:convert';


class Dice {
  final int sides;
  final Random _random = Random();

  Dice({this.sides = 6});

  int roll() {
    return _random.nextInt(sides) + 1;
  }
}

class Player {
  String name;
  int score = 0;

  Player(this.name);

  int rollDice(List<Dice> diceList) {
    int total = 0;
    for (var dice in diceList) {
      total += dice.roll();
    }
    score += total;
    return total;
  }


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

void DiceGame({int rounds = 3}) {
  print("The Dice Game ");

  String player1Name = getFormattedName("Player 1", "Player 1");
  String player2Name = getFormattedName("Player 2", "Player 2");


  Player player1 = Player(player1Name ?? "Player 1");
  Player player2 = Player(player2Name ?? "Player 2");
  print("\n${player1.name} challenges ${player2.name} in a game of Dice!\n");
  var dicePlayer1 = [Dice(), Dice()];
  var dicePlayer2 = [Dice(), Dice()];



  print(' Starting Dice Game \n');

  for (int round = 1; round <= rounds; round++) {
    print('--- Round $round ---');

    var roll1 = player1.rollDice(dicePlayer1);
    print('${player1.name} rolled a total of $roll1 | Total score: ${player1.score}');

    var roll2 = player2.rollDice(dicePlayer2);
    print('${player2.name} rolled a total of $roll2 | Total score: ${player2.score}\n');

    if (round != rounds) {
      stdout.write('\nPress Enter to start the next round...');
      stdin.readLineSync(encoding: utf8);
      print(""); }
  }

  print(' Final Results ');
  print('${player1.name}: ${player1.score}');
  print('${player2.name}: ${player2.score}');

  if (player1.score > player2.score) {
    print(' ${player1.name} wins!');
  } else if (player2.score > player1.score) {
    print(' ${player2.name} wins!');
  } else {
    print(' It\'s a tie!');
  }
  playAgain();
}

void playAgain() {
  stdout.write('\nWould you like to play again? (yes/no): ');
  String? response = stdin.readLineSync(encoding:utf8);

  if (response != null && (response.toLowerCase() == 'yes' || response.toLowerCase() == 'y')) {
    DiceGame();
  } else {
    print("\n Thanks for playing!");
  }
}

void main() {
  DiceGame();
}
