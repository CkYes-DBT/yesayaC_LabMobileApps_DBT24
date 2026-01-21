import "dart:io";
import "dart:math";

void main() {
  print("=== GUNTING BATU KERTAS ===");
  print("1. Gunting");
  print("2. Batu");
  print("3. Kertas");
  print("===========================");
  
stdout.write("Masukkan pilihan Anda (1-3): ");
  String? input = stdin.readLineSync();
  int playerChoice = int.parse(input!);

  Random random = Random();
  int computerChoice = random.nextInt(3) + 1;

  print("Pilihan komputer: $computerChoice");

  if (playerChoice == computerChoice) {
    print("Hasil: Seri!");
  } else if ((playerChoice == 1 && computerChoice == 2) ||
             (playerChoice == 2 && computerChoice == 3) ||
             (playerChoice == 3 && computerChoice == 1)) {
    print("Hasil: Komputer menang!");
  } else {
    print("Hasil: Anda menang!");
  }

}