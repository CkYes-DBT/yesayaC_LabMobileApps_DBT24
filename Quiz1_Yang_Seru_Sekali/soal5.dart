import 'dart:io';

class Ujian {

  int TotalNilai = 0;
  int JumlahMahasiswa = 0;

  void tambahNilai(int nilai) {
    TotalNilai += nilai;
    JumlahMahasiswa++;
  }

  num rataRata() {
    return TotalNilai / JumlahMahasiswa;
  }
}

void main() {
  Ujian ujian = Ujian();
    for (int i = 0; i < 3; i++) {
    stdout.write("Masukkan nilai mahasiswa ke-${i + 1}: ");
    String? input = stdin.readLineSync();
    if (input != null) {
      int nilai = int.parse(input);
      ujian.tambahNilai(nilai);
    }
  }

  print("Total Nilai: ${ujian.TotalNilai}");
  print("Jumlah Mahasiswa: ${ujian.JumlahMahasiswa}");
  print("Rata-rata Nilai: ${ujian.rataRata()}");
}
