import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/resep_model.dart';
import '../services/api_services.dart';
import 'detail_resep_page.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final ApiService _apiService = ApiService();
  List<Map<String, dynamic>> _favoriteList = [];
  bool _isLoading = true;
  String? _token;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() => _isLoading = true);

    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getInt('id_user');
      final token = prefs.getString('token');

      setState(() {
        _token = token;
      });

      if (userId != null && token != null) {
        // Ambil favorit dari backend
        final favorites = await _apiService.getFavorites(userId, token);
        setState(() {
          _favoriteList = favorites.cast<Map<String, dynamic>>();
          _isLoading = false;
        });
      } else {
        // Jika belum login
        setState(() {
          _favoriteList = [];
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading favorites: $e');
      setState(() {
        _favoriteList = [];
        _isLoading = false;
      });
    }
  }

  Future<void> _removeFavorite(int idSimpan) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    try {
      await _apiService.removeFavorite(idSimpan, token);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Dihapus dari favorit')));
        _loadFavorites(); // Reload data
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Resep Favorit',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadFavorites,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _favoriteList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Belum ada resep favorit 😢',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _token == null || _token!.isEmpty
                        ? 'Login untuk menyimpan favorit'
                        : 'Tambahkan resep ke favorit dari halaman Resep',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: _favoriteList.length,
              itemBuilder: (context, index) {
                final favorite = _favoriteList[index];
                // Buat object Resep dari data favorit
                final resep = Resep.fromApi(favorite);
                final idSimpan = favorite['id_simpan'] as int;

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 3,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: resep.gambar.startsWith('http')
                          ? Image.network(
                              resep.gambar,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.restaurant),
                                );
                              },
                            )
                          : Image.asset(
                              resep.gambar,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.restaurant),
                                );
                              },
                            ),
                    ),
                    title: Text(
                      resep.nama,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      resep.kategori,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 26,
                      ),
                      onPressed: () => _removeFavorite(idSimpan),
                      tooltip: 'Hapus dari Favorit',
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailResepPage(resep: resep),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
