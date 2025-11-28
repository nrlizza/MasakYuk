class Resep {
  final String nama;
  final String kategori;
  final String gambar;
  final String bahan;
  final String cara;
  final String bahanPokok;
  final String tipsPenyajian;
  final String sumber;
  bool isFavorite;

  Resep({
    required this.nama,
    required this.kategori,
    required this.gambar,
    required this.bahan,
    required this.cara,
    required this.bahanPokok,
    required this.tipsPenyajian,
    required this.sumber,
    this.isFavorite = false,
  });
}
