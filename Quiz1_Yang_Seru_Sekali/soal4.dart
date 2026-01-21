import "dart:io";
import "dart:math";

void main() {
  stdout.write("Masukkan angka pilihan: ");
  String? input = stdin.readLineSync();
  int angka = int.parse(input!);

if (angka<=1) {
  print ("Angka bukan bilangan prima");
} else {
  bool isPrime = true;
  for (int i = 2; i <= sqrt(angka); i++) {
    if (angka % i == 0) {
      isPrime = false;
      break;
    }
  }
  if (isPrime) {
    print("Angka adalah bilangan prima");
  } else {
    print("Angka bukan bilangan prima");
  }
}
}