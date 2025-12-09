import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:masakyuk/data/resep_data.dart'; // Data dummy - tidak dipakai
import 'package:masakyuk/models/resep_model.dart';
import '../services/api_services.dart';

class ResepPage extends StatefulWidget {
  final String? filterBahanPokok;
  const ResepPage({Key? key, this.filterBahanPokok}) : super(key: key);

  @override
  State<ResepPage> createState() => _ResepPageState();
}

class _ResepPageState extends State<ResepPage> {
  String selectedBahan = "Semua";
  String searchQuery = "";
  final ApiService _apiService = ApiService();
  String? _token;
  Set<int> _favoritResepIds = {};
  
  // Toggle untuk menggunakan API atau data dummy
  // Ubah ke true untuk pakai data dari backend
  final bool _useApiData = true; // GANTI ke true kalau mau pakai backend
  
  List<Resep> _apiResepList = [];
  bool _isLoadingApi = false;

  @override
  void initState() {
    super.initState();
    if (widget.filterBahanPokok != null) {
      selectedBahan = widget.filterBahanPokok!;
    }
    _loadToken();
    _loadFavorites();
    
    // Load data dari API jika mode API aktif
    if (_useApiData) {
      _loadResepFromApi();
    }
  }
  
  Future<void> _loadResepFromApi() async {
    setState(() => _isLoadingApi = true);
    
    try {
      final response = await _apiService.getResepList(limit: 100, offset: 0);
      
      if (response['success'] == true && response['data'] != null) {
        final resepData = response['data']['data'] as List;
        setState(() {
          _apiResepList = resepData.map((json) => Resep.fromApi(json)).toList();
        });
      }
    } catch (e) {
      print('Error loading resep from API: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat data resep: $e')),
      );
    } finally {
      setState(() => _isLoadingApi = false);
    }
  }

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = prefs.getString('token');
    });
  }

  Future<void> _loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id_user');
      final token = prefs.getString('token');
      
      if (userId != null) {
        final favorites = await _apiService.getFavorites(userId, token);
        setState(() {
          _favoritResepIds = favorites
              .map((fav) => fav['id_resep'] as int)
              .toSet();
        });
      }
    } catch (e) {
      print('Error loading favorites: $e');
    }
  }

  Future<void> _toggleFavorite(Resep resep, int resepId) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('id_user');
    final token = prefs.getString('token');
    final isFavorite = _favoritResepIds.contains(resepId);
    
    if (userId == null) {
      // Jika belum login, tampilkan pesan
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login terlebih dahulu untuk menyimpan favorit'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    try {
      if (isFavorite) {
        // Hapus dari favorit - perlu cari id_simpan dulu
        final favorites = await _apiService.getFavorites(userId, token);
        final simpanan = favorites.firstWhere(
          (fav) => fav['id_resep'] == resepId,
          orElse: () => null,
        );
        
        if (simpanan != null) {
          final idSimpan = simpanan['id_simpan'] as int;
          await _apiService.removeFavorite(idSimpan, token);
          setState(() {
            _favoritResepIds.remove(resepId);
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Dihapus dari favorit')),
          );
        }
      } else {
        // Tambah ke favorit
        await _apiService.addFavorite(userId, resepId, token);
        setState(() {
          _favoritResepIds.add(resepId);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ditambahkan ke favorit')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  final List<String> bahanPokokList = [
    "Semua",
    "Ayam",
    "Daging",
    "Seafood",
    "Tepung",
    "Beras",
    "Kacang",
    "Singkong",
    "Sayur",
  ];

  @override
  Widget build(BuildContext context) {
    // Pakai data dari API
    final List<Resep> dataSource = _apiResepList;
    
    // Show loading saat fetch data dari API
    if (_useApiData && _isLoadingApi) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Resep Masakan 🍲"),
          backgroundColor: Colors.orange,
        ),
        body: const Center(
          child: CircularProgressIndicator(color: Colors.orange),
        ),
      );
    }
    
    // Filter resep berdasarkan bahan pokok dan pencarian
    final filteredList = dataSource.where((resep) {
      final matchBahan =
          selectedBahan == "Semua" || resep.bahanPokok == selectedBahan;
      final matchSearch = resep.nama.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      return matchBahan && matchSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resep Masakan 🍲"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Cari resep berdasarkan nama...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              onChanged: (value) => setState(() => searchQuery = value),
            ),
          ),

          // Dropdown filter bahan pokok
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Pilih resep makanan berdasarkan bahan pokok",
                labelStyle: const TextStyle(fontSize: 13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
              value: selectedBahan,
              isExpanded: true,
              items: bahanPokokList.map((value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (value) => setState(() => selectedBahan = value!),
            ),
          ),

          const SizedBox(height: 8),

          // Grid daftar resep
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: filteredList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final resep = filteredList[index];
                final resepId = resepList.indexOf(resep) + 1;
                final isFavorite = _favoritResepIds.contains(resepId);
                
                return GestureDetector(
                  onTap: () => _showDetail(context, resep),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),
                            child: Image.asset(
                              resep.gambar,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  resep.nama,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                onPressed: () => _toggleFavorite(resep, resepId),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            resep.bahanPokok,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Detail resep popup
  void _showDetail(BuildContext context, Resep resep) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // Membuat dialog lebih lebar (max 90% lebar layar, minimal 280, maksimal 600)
        contentPadding: const EdgeInsets.all(24),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        title: Text(
          resep.nama,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 600, // batas maksimal lebar (bagus untuk tablet/desktop)
            minWidth: 280,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Gambar
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      resep.gambar,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Bahan pokok
                Text(
                  "Bahan Pokok: ${resep.bahanPokok}",
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 16),

                // Bahan-bahan
                const Text(
                  "🧂 Bahan-bahan:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 6),
                Text(resep.bahan),
                const SizedBox(height: 16),

                // Cara membuat
                const Text(
                  "🍳 Cara Membuat:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                // ← INI DIA YANG KAMU MAU! →
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: resep.cara
                      .split('\n')
                      .where((step) => step.trim().isNotEmpty)
                      .map((step) => step.trim())
                      .toList()
                      .asMap()
                      .entries
                      .map((entry) {
                        int idx = entry.key + 1;
                        String text = entry.value;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 14.0),
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 14.8,
                                height: 1.6,
                                color: Colors.black87,
                              ),
                              children: [
                                // Nomor + titik (bold)
                                TextSpan(
                                  text: "$idx. ",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Isi langkah (normal)
                                TextSpan(text: text),
                              ],
                            ),
                          ),
                        );
                      })
                      .toList(),
                ),
                const SizedBox(height: 16),

                // ==== TAMBAHAN: Tips Penyajian (dengan nomor otomatis) ====
                if (resep.tipsPenyajian.trim().isNotEmpty) ...[
                  const Text(
                    "💡Tips Penyajian:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: resep.tipsPenyajian
                        .split('\n')
                        .where((line) => line.trim().isNotEmpty)
                        .map((line) => line.trim())
                        .toList()
                        .asMap()
                        .entries
                        .map((entry) {
                          int no = entry.key + 1;
                          String tip = entry.value;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style
                                    .copyWith(
                                      fontSize: 14.8,
                                      height: 1.6,
                                      color: Colors.black87,
                                    ),
                                children: [
                                  // Nomor + titik (bold)
                                  TextSpan(
                                    text: "$no. ",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  // Isi tips
                                  TextSpan(text: tip),
                                ],
                              ),
                            ),
                          );
                        })
                        .toList(),
                  ),
                  const SizedBox(height: 16),
                ],

                // ==== TAMBAHAN: Sumber ====
                if (resep.sumber.isNotEmpty) ...[
                  const Text(
                    "📚 Sumber:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    resep.sumber,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Tutup"),
          ),
        ],
      ),
    );
  }
}
