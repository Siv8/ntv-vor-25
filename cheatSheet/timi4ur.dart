import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  print("Hver er talan, leikur við tölvuna.");
  print("Skrifaðu 'exit' ef þú vilt hætta.");
  numberGuess();
}

void numberGuess() {
  // Hérna er Random number generater
  final random = Random();
  final randomNum = random.nextInt(100) + 1; // Tölur frá 1 uppí 100

  int totalGuesses = 0;

  // Game logic
  while (true) {
    stdout.write("Er talan?: ");
    String userGuess = stdin.readLineSync()?? '0';

    int? guess = int.tryParse(userGuess);
if (guess == null ){


}

  if (userGuess.toLowerCase() == "exit") {
      print("Adios amigo...Bye🖐️.");
      print("Fjöldi svara $totalGuesses sinnum.");
      break;
    } else if (userGuess == '0') {
      print("Ekki gilt, Veldu aftur.");
      continue;
    } else if (int.parse(userGuess) > 100) {
      print("Veldu tölu frá 1 til 100.");
      continue;
    }

    // Main game logic
    if (int.parse(userGuess) == randomNum) {
      totalGuesses += 1;
      print("Vel gert rétt svar...🏆");
      print("Heildarfjöldi $totalGuesses sinnum.");
    } else if (int.parse(userGuess) > randomNum) {
      totalGuesses += 1;
      print("of há...👆");
      continue;
    } else {
      totalGuesses += 1;
      print("of lág..👇");
      continue;
    }

    print("Viltu spila aftur? (J/N):");
    String val=stdin.readLineSync()!.toLowerCase(); // Tekur á 0 gildi og breytir í hástaf
    if(val=="j"){
      totalGuesses = 0;
      print("Lets go");
    }else {
      print("Takk fyrir að spila leikinn minn...");
      break;
    }

  }

}