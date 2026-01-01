class Resep {
  final int id;
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
    required this.id,
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

  // Factory constructor untuk convert dari API response
  factory Resep.fromApi(Map<String, dynamic> json) {
    // Debug print untuk melihat data yang diterima
    print('DEBUG - Resep data: ${json.keys}');
    print('DEBUG - bahan_bahan: ${json['bahan_bahan']}');
    print('DEBUG - cara_membuat: ${json['cara_membuat']}');

    // Gunakan gambar dari database, tambahkan path assets/img/ jika perlu
    String gambarUrl = '';
    if (json['image'] != null && json['image'].toString().isNotEmpty) {
      String imagePath = json['image'].toString();
      // Jika sudah ada 'assets/', gunakan langsung
      if (imagePath.startsWith('assets/')) {
        gambarUrl = imagePath;
      } else {
        // Jika hanya nama file, tambahkan path assets/img/
        gambarUrl = 'assets/img/$imagePath';
      }
    } else {
      // Fallback ke gambar default jika database tidak ada image
      gambarUrl = _getDefaultImage(json['nama_resep'] ?? '');
    }

    // Ambil bahan_bahan langsung sebagai string dari database
    String bahan = '';
    if (json['bahan_bahan'] != null) {
      bahan = json['bahan_bahan'].toString();
    }

    // Ambil cara_membuat langsung sebagai string dari database
    String cara = '';
    if (json['cara_membuat'] != null) {
      cara = json['cara_membuat'].toString();
    }

    print('DEBUG - bahan parsed: $bahan');
    print('DEBUG - cara parsed: $cara');

    return Resep(
      id: json['id_resep'] ?? 0,
      nama: json['nama_resep'] ?? '',
      kategori: json['nama_kategori'] ?? 'Lainnya',
      gambar: gambarUrl,
      bahan: bahan,
      cara: cara,
      bahanPokok: _getBahanPokok(bahan),
      tipsPenyajian: json['tips_penyajian'] ?? '',
      sumber: json['sumber'] ?? '',
      isFavorite: false,
    );
  }

  // Helper function untuk tentukan gambar default berdasarkan nama resep
  static String _getDefaultImage(String namaResep) {
    final nama = namaResep.toLowerCase();

    if (nama.contains('nasi goreng')) return 'assets/img/nasi_goreng.jpg';
    if (nama.contains('rendang')) return 'assets/img/rendang.jpg';
    if (nama.contains('sate')) return 'assets/img/sate.jpg';
    if (nama.contains('gado')) return 'assets/img/gado_gado.jpg';
    if (nama.contains('soto')) return 'assets/img/soto.jpg';
    if (nama.contains('bakso')) return 'assets/img/bakso.jpg';
    if (nama.contains('mie')) return 'assets/img/mie_aceh.jpg';
    if (nama.contains('ayam')) return 'assets/img/ayam_goreng.jpg';

    return 'assets/img/lemper.jpg'; // Default fallback
  }

  // Helper function untuk tentukan bahan pokok dari string bahan
  static String _getBahanPokok(String bahanStr) {
    if (bahanStr.isEmpty) return 'Lainnya';

    final bahan = bahanStr.toLowerCase();

    if (bahan.contains('ayam')) return 'Ayam';
    if (bahan.contains('daging') || bahan.contains('sapi'))
      return 'Daging';
    if (bahan.contains('ikan') ||
        bahan.contains('udang') ||
        bahan.contains('cumi'))
      return 'Seafood';
    if (bahan.contains('tepung')) return 'Tepung';
    if (bahan.contains('beras') ||
        bahan.contains('nasi') ||
        bahan.contains('ketan'))
      return 'Beras';
    if (bahan.contains('kacang')) return 'Kacang';
    if (bahan.contains('singkong') || bahan.contains('gaplek'))
      return 'Singkong';
    if (bahan.contains('sayur')) return 'Sayur';

    return 'Lainnya';
  }
}