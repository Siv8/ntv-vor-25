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

void DiceGame({int rounds = 3}) {
  print("Type in names for Player 1 and Player 2");
  stdout.write("Enter Player 1 name: ");
  String? player1Name = stdin.readLineSync();

  stdout.write("Enter Player 2 name: ");
  String? player2Name = stdin.readLineSync();

  Player player1 = Player(player1Name ?? "Player 1");
  Player player2 = Player(player2Name ?? "Player 2");

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
