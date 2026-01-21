import "dart:io";
import "dart:math";

void main() {
  print("Tebak angka antara 1 sampai 100:");
  int angka = Random().nextInt (100) + 1;
  stdout.write("Masukkan tebakan Anda: ");
  String? input = stdin.readLineSync();
  while (true) {
    int tebakan = int.parse(input!);
    if (tebakan < angka) {
      print("Tebakan Anda terlalu rendah. Coba lagi:");
    } else if (tebakan > angka) {
      print("Tebakan Anda terlalu tinggi. Coba lagi:");
    } else {
      print("Selamat! Tebakan Anda benar.");
      break;
    }
    stdout.write("Masukkan tebakan Anda: ");
    input = stdin.readLineSync();
  }
}