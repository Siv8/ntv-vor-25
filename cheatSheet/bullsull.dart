import 'dart:io';
import 'dart:math';

// Dice class
class Dice {
  final int sides;
  final Random _random = Random();

  Dice({this.sides = 6});

  int roll() {
    return _random.nextInt(sides) + 1;
  }
}

// Player class (now includes total wins and history)
class Player {
  String name;
  int score = 0;
  int totalWins = 0;
  List<int> scoreHistory = [];

  Player(this.name);

  int rollDice(List<Dice> diceList) {
    int total = 0;
    for (var dice in diceList) {
      total += dice.roll();
    }
    score += total;
    return total;
  }

  void resetScore() {
    scoreHistory.add(score); // save score before reset
    score = 0;
  }
}

// Format name helper
String getFormattedName(String label, String defaultName) {
  stdout.write("Enter $label name: ");
  String? input = stdin.readLineSync();
  if (input == null || input.trim().isEmpty) return defaultName;

  input = input.trim();
  return input[0].toUpperCase() + input.substring(1).toLowerCase();
}

// Main Game Function
void DiceGame({
  int rounds = 3,
  String? previousName1,
  String? previousName2,
  Player? player1,
  Player? player2,
  int matchCount = 1,
}) {
  print("\n🎲 Dice Game Setup - Match $matchCount 🎲");

  // Initialize players
  if (player1 == null || player2 == null) {
    // Ask names first time or if new players
    String player1Name = getFormattedName("Player 1", "Player 1");
    String player2Name = getFormattedName("Player 2", "Player 2");
    player1 = Player(player1Name);
    player2 = Player(player2Name);
  } else {
    // Ask if same players want to continue
    stdout.write("Are the same players still playing? (yes/y or no): ");
    String? samePlayers = stdin.readLineSync();
    if (!(samePlayers != null &&
        (samePlayers.toLowerCase() == 'yes' || samePlayers.toLowerCase() == 'y'))) {
      String player1Name = getFormattedName("Player 1", "Player 1");
      String player2Name = getFormattedName("Player 2", "Player 2");
      player1 = Player(player1Name);
      player2 = Player(player2Name);
    } else {
      print("Keeping players: ${player1.name} and ${player2.name}");
    }
  }

  print("\n${player1.name} challenges ${player2.name} in a game of Dice!\n");

  var dicePlayer1 = [Dice(), Dice()];
  var dicePlayer2 = [Dice(), Dice()];

  for (int round = 1; round <= rounds; round++) {
    print('--- Round $round ---');

    int roll1 = player1.rollDice(dicePlayer1);
    print('${player1.name} rolled a total of $roll1 | Total score: ${player1.score}');

    int roll2 = player2.rollDice(dicePlayer2);
    print('${player2.name} rolled a total of $roll2 | Total score: ${player2.score}\n');
  }

  print('🎉 Final Match Results 🎉');
  print('${player1.name}: ${player1.score}');
  print('${player2.name}: ${player2.score}');

  // Decide match winner
  if (player1.score > player2.score) {
    print('🏆 ${player1.name} wins this match!');
    player1.totalWins++;
  } else if (player2.score > player1.score) {
    print('🏆 ${player2.name} wins this match!');
    player2.totalWins++;
  } else {
    print('🤝 It\'s a tie! No win counted.');
  }

  // Store scores
  player1.resetScore();
  player2.resetScore();

  // Show Score History
  print("\n📊 Score History:");
  for (int i = 0; i < player1.scoreHistory.length; i++) {
    print("Match ${i + 1}: ${player1.name}: ${player1.scoreHistory[i]} | ${player2.name}: ${player2.scoreHistory[i]}");
  }

  // Check if best-of-3 is over
  if (player1.scoreHistory.length >= 3) {
    print("\n🏁 Best of 3 Tournament Results:");
    print("${player1.name} Wins: ${player1.totalWins}");
    print("${player2.name} Wins: ${player2.totalWins}");

    if (player1.totalWins > player2.totalWins) {
      print("🏆 ${player1.name} is the Tournament Champion!");
    } else if (player2.totalWins > player1.totalWins) {
      print("🏆 ${player2.name} is the Tournament Champion!");
    } else {
      print("🤝 Tournament ends in a draw!");
    }

    print("\n🎮 Tournament Complete. Thanks for playing!");
    return; // End the game after 3 matches
  }

  // Ask to play next match
  playAgain(
    previousName1: player1.name,
    previousName2: player2.name,
    player1: player1,
    player2: player2,
    matchCount: matchCount + 1,
  );
}

// Ask to play again
void playAgain({
  required String previousName1,
  required String previousName2,
  required Player player1,
  required Player player2,
  required int matchCount,
}) {
  stdout.write('\nWould you like to play the next match? (yes/y or no): ');
  String? response = stdin.readLineSync();

  if (response != null &&
      (response.toLowerCase() == 'yes' || response.toLowerCase() == 'y')) {
    DiceGame(
      previousName1: previousName1,
      previousName2: previousName2,
      player1: player1,
      player2: player2,
      matchCount: matchCount,
    );
  } else {
    print("\n👋 Thanks for playing! See you next time!");
  }
}

// Start the game
void main() {
  DiceGame();
}