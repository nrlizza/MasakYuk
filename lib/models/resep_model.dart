class Resep {
  final int id;
  final String nama;
  final String kategori;
  final String gambar;
  final String bahan;
  final String cara;
  final String bahanPokok;
  final String tipsPenyajian;
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

    // Convert array bahan_bahan menjadi string dengan bullet points
    String bahan = '';
    if (json['bahan_bahan'] != null) {
      if (json['bahan_bahan'] is List) {
        final bahanList = json['bahan_bahan'] as List;
        if (bahanList.isNotEmpty) {
          bahan = bahanList.map((item) => '• ${item.toString()}').join('\n');
        }
      } else if (json['bahan_bahan'] is String) {
        // Jika sudah dalam bentuk string
        bahan = json['bahan_bahan'];
      }
    }

    // Convert array cara_membuat menjadi string tanpa numbering
    // (numbering akan ditambahkan di UI)
    String cara = '';
    if (json['cara_membuat'] != null) {
      if (json['cara_membuat'] is List) {
        final caraList = json['cara_membuat'] as List;
        if (caraList.isNotEmpty) {
          cara = caraList.map((step) => step.toString()).join('\n');
        }
      } else if (json['cara_membuat'] is String) {
        // Jika sudah dalam bentuk string
        cara = json['cara_membuat'];
      }
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
      bahanPokok: _getBahanPokok(json['bahan_bahan']),
      tipsPenyajian: '',
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

  // Helper function untuk tentukan bahan pokok dari array bahan
  static String _getBahanPokok(dynamic bahanBahan) {
    if (bahanBahan == null) return 'Lainnya';

    String bahanStr = '';
    if (bahanBahan is List) {
      bahanStr = bahanBahan.join(' ').toLowerCase();
    } else if (bahanBahan is String) {
      bahanStr = bahanBahan.toLowerCase();
    } else {
      return 'Lainnya';
    }

    if (bahanStr.contains('ayam')) return 'Ayam';
    if (bahanStr.contains('daging') || bahanStr.contains('sapi'))
      return 'Daging';
    if (bahanStr.contains('ikan') ||
        bahanStr.contains('udang') ||
        bahanStr.contains('cumi'))
      return 'Seafood';
    if (bahanStr.contains('tepung')) return 'Tepung';
    if (bahanStr.contains('beras') ||
        bahanStr.contains('nasi') ||
        bahanStr.contains('ketan'))
      return 'Beras';
    if (bahanStr.contains('kacang')) return 'Kacang';
    if (bahanStr.contains('singkong')) return 'Singkong';
    if (bahanStr.contains('sayur')) return 'Sayur';

    return 'Lainnya';
  }
}