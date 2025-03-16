import 'dart:io';
import 'dart:math';


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
  String? input = stdin.readLineSync();
  if (input == null || input
      .trim()
      .isEmpty) return defaultName;

  input = input.trim();
  return input[0].toUpperCase() + input.substring(1).toLowerCase();
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
}

void main() {
  DiceGame();
}
