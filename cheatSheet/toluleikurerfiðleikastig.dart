import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  print("Hver er talan, leikur við tölvuna.");
  print("Skrifaðu 'exit' ef þú vilt hætta.");
  print("Veldu erfiðleikastig:");
  print("HARD - aðeins 3 Tilraunir");
  print("MED - aðeins 8 Tilraunir");
  print("EASY - Endalausar Tilraunir");
  stdout.write("Veldu: ");

  String? difficulty = stdin.readLineSync()?.toLowerCase();

  if (difficulty == "exit") {
    print("Bless í bili");
    return;
  }

  int maxAttempts;
  if (difficulty == "hard") {
    maxAttempts = 3;
  } else if (difficulty == "med") {
    maxAttempts = 8;
  } else if (difficulty == "easy") {
    maxAttempts = -1;
  } else {
    print("Ógilt val. Sjálfgefið EASY.");
    maxAttempts = -1;
    difficulty = "easy";
  }


  if (maxAttempts == -1) {
    print("Þú valdir ${(difficulty ?? 'easy').toUpperCase()}! Þú hefur aðeins $maxAttempts Tilraunir, gangi þér vel!");
  } else {
    print("Þú valdir ${difficulty.toUpperCase()}! Þú hefur aðeins $maxAttempts Tilraunir, gangi þér vel!");
  }

  numberGuess(maxAttempts);
}

void numberGuess(int maxAttempts) {
  final random = Random();
  final randomNum = random.nextInt(100) + 1;
  int totalGuesses = 0;

  while (true) {
    stdout.write("Er talan?: ");
    String userGuess = stdin.readLineSync() ?? '';

    if (userGuess.toLowerCase() == "exit") {
      print("Bless í bili");
      print("Fjöldi svara: $totalGuesses sinnum.");
      break;
    }

    int? guess = int.tryParse(userGuess);
    if (guess == null) {
      print("Ekki gilt, veldu aftur.");
      continue;
    }
    if (guess < 1 || guess > 100) {
      print("Veldu tölu frá 1 til 100.");
      continue;
    }

    totalGuesses++;

    if (guess == randomNum) {
      print("Vel gert rétt svar...🏆");
      print("Heildarfjöldi svara: $totalGuesses sinnum.");
      stdout.write("Viltu spila aftur? (J/N): ");
      String? val = stdin.readLineSync()?.toLowerCase();
      if (val == "exit") {
        print("Bless í bili");
      } else if (val == "j") {
        numberGuess(maxAttempts);
      } else {
        print("Takk samt fyrir að spila leikinn minn");
      }
      break;
    }

    // Check if maximum attempts reached (for HARD/MED)
    if (maxAttempts != -1 && totalGuesses >= maxAttempts) {
      print("Þú hefur notað $totalGuesses reyndir, ekkert fleira eftir.");
      print("Rétta svarið var: $randomNum");
      stdout.write("Viltu spila aftur? (J/N): ");
      String? val = stdin.readLineSync()?.toLowerCase();
      if (val == "exit") {
        print("Bless í bili");
      } else if (val == "j") {
        numberGuess(maxAttempts);
      } else {
        print("Takk samt fyrir að spila leikinn minn");
      }
      break;
    }

    // Provide hints if the guess was incorrect and attempts remain.
    if (guess > randomNum) {
      print("of há...👆");
    } else {
      print("of lág..👇");
    }
  }
}