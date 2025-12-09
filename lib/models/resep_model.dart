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
    // Mapping gambar default berdasarkan nama resep
    String defaultImage = _getDefaultImage(json['nama_resep'] ?? '');
    
    // Convert array bahan_bahan menjadi string dengan bullet points
    String bahan = '';
    if (json['bahan_bahan'] is List) {
      bahan = (json['bahan_bahan'] as List)
          .map((item) => '• $item')
          .join('\n');
    }
    
    // Convert array cara_membuat menjadi string dengan numbering
    String cara = '';
    if (json['cara_membuat'] is List) {
      final steps = json['cara_membuat'] as List;
      cara = steps.asMap().entries
          .map((entry) => '${entry.key + 1}. ${entry.value}')
          .join('\n');
    }
    
    return Resep(
      id: json['id_resep'] ?? 0,
      nama: json['nama_resep'] ?? '',
      kategori: json['nama_kategori'] ?? 'Lainnya',
      gambar: defaultImage,
      bahan: bahan,
      cara: cara,
      bahanPokok: _getBahanPokok(json['bahan_bahan']),
      tipsPenyajian: '',
      sumber: 'Backend API',
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
    if (bahanBahan is! List) return 'Lainnya';
    
    final bahanStr = bahanBahan.join(' ').toLowerCase();
    
    if (bahanStr.contains('ayam')) return 'Ayam';
    if (bahanStr.contains('daging') || bahanStr.contains('sapi')) return 'Daging';
    if (bahanStr.contains('ikan') || bahanStr.contains('udang') || bahanStr.contains('cumi')) return 'Seafood';
    if (bahanStr.contains('tepung')) return 'Tepung';
    if (bahanStr.contains('beras') || bahanStr.contains('nasi')) return 'Beras';
    if (bahanStr.contains('kacang')) return 'Kacang';
    if (bahanStr.contains('singkong')) return 'Singkong';
    if (bahanStr.contains('sayur')) return 'Sayur';
    
    return 'Lainnya';
  }
}
