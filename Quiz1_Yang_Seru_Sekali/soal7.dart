void main() {
  List<int> a = [1, 3, 5, 7];
  List<int> b = [2, 4, 6, 8];
  List<int> c = [...a, ...b];
  
  int terbesar = c[0];
  for (int angka in c) {
    if (angka > terbesar) {
      terbesar = angka;
    }
  }
  
  int keduaTerbesar = c[0];
  for (int angka in c) {
    if (angka > keduaTerbesar && angka < terbesar) {
      keduaTerbesar = angka;
    }
  }
  
  print('List a: $a');
  print('List b: $b');
  print('Gabungan c: $c');
  print('Angka kedua terbesar: $keduaTerbesar');
}




  