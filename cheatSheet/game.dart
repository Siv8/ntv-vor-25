import 'dart:io';
import 'dart:math';
void main(List<String> args) {
  print("Hver er talan, leikur við tölvuna.");
  print("Skrifaðu 'exit' ef þú vilt hætta.");
  numberGuess();}void numberGuess() {  // Hérna er Random number generater

  final random = Random();
  final randomNum = random.nextInt(100) + 1; // Tölur frá 1 uppí 100
  int totalGuesses = 0;  // Game logic
  while (true) {
    stdout.write("Er talan?: ");
    String userGuess = stdin.readLineSync()?? '0';

    if (userGuess.toLowerCase() == "exit") {
      print("Bless í bili");
      print("Fjöldi svara $totalGuesses sinnum.");
      break;
    }


    int? guess = int.tryParse(userGuess);
    if (guess == null) {
      print("Ekki gilt, Veldu aftur.");
      continue;
    }
    if (guess > 100) {
      print("Veldu tölu frá 1 til 100.");
      continue;
    }

    totalGuesses++;

    // Main game logic
    if (guess == randomNum) {
      print("Vel gert rétt svar...🏆");
      print("Heildarfjöldi $totalGuesses sinnum.");
      stdout.write("Viltu spila aftur? (J/N): ");
      String val = stdin.readLineSync()!.toLowerCase();
      if (val == "j") {
        totalGuesses = 0;
        print("Lets go");
      } else {
        print("Takk samt fyrir að spila leikinn minn");
        break;
      }
    } else if (guess > randomNum) {
      print("of há...👆");
    } else {
      print("of lág..👇");
    }
  }
}
