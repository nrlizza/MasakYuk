import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:masakyuk/models/resep_model.dart';
import '../services/api_services.dart';
import 'detail_resep_page.dart';

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
  Set<int> _favoritResepIds = {};

  List<Resep> _resepList = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.filterBahanPokok != null) {
      selectedBahan = widget.filterBahanPokok!;
    }
    _loadFavorites();
    _loadResepFromApi();
  }

  Future<void> _loadResepFromApi() async {
    setState(() => _isLoading = true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await _apiService.getResepList(
        limit: 100,
        offset: 0,
        token: token,
      );

      if (response['success'] == true && response['data'] != null) {
        final resepData = response['data']['data'] as List;
        setState(() {
          _resepList = resepData.map((json) => Resep.fromApi(json)).toList();
        });
      }
    } catch (e) {
      print('Error loading resep from API: $e');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Gagal memuat data resep: $e')));
      }
    } finally {
      setState(() => _isLoading = false);
    }
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
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Dihapus dari favorit')));
        }
      } else {
        // Tambah ke favorit
        await _apiService.addFavorite(userId, resepId, token);
        setState(() {
          _favoritResepIds.add(resepId);
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Ditambahkan ke favorit')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
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
    // Show loading saat fetch data dari API
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'Resep Masakan',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: const Center(
          child: CircularProgressIndicator(color: Colors.orange),
        ),
      );
    }

    // Filter resep berdasarkan bahan pokok dan pencarian
    final filteredList = _resepList.where((resep) {
      final matchBahan =
          selectedBahan == "Semua" || resep.bahanPokok == selectedBahan;
      final matchSearch = resep.nama.toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      return matchBahan && matchSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Resep Masakan',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
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
                final resepId = resep.id;
                final isFavorite = _favoritResepIds.contains(resepId);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailResepPage(resep: resep),
                      ),
                    );
                  },
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
                            child: resep.gambar.startsWith('http')
                                ? Image.network(
                                    resep.gambar,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/img/lemper.jpg',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      );
                                    },
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value:
                                                  loadingProgress
                                                          .expectedTotalBytes !=
                                                      null
                                                  ? loadingProgress
                                                            .cumulativeBytesLoaded /
                                                        loadingProgress
                                                            .expectedTotalBytes!
                                                  : null,
                                            ),
                                          );
                                        },
                                  )
                                : Image.asset(
                                    resep.gambar,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[300],
                                        child: const Icon(
                                          Icons.restaurant,
                                          size: 50,
                                        ),
                                      );
                                    },
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
                                  color: isFavorite ? Colors.red : Colors.grey,
                                ),
                                onPressed: () =>
                                    _toggleFavorite(resep, resepId),
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
}
