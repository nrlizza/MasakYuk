import 'package:flutter/material.dart';
import '../data/resep_data.dart';
import '../models/resep_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  void _showDetailPopup(BuildContext context, Resep resep) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        title: Text(
          resep.nama,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        content: SizedBox(
          width:
              double.maxFinite, // INI YANG PENTING! Biar dialog tahu lebarnya
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // GAMBAR — JANGAN PAKAI width: double.infinity di dalam dialog
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      resep.gambar,
                      height: 200,
                      width: double
                          .maxFinite, // GUNAKAN double.maxFinite, BUKAN double.infinity
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                  "Bahan Pokok: ${resep.bahanPokok}",
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  "Bahan-bahan:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  resep.bahan,
                  style: const TextStyle(height: 1.6, fontSize: 15),
                ),
                const SizedBox(height: 16),

                const Text(
                  "Cara Membuat:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 12),
                ...resep.cara
                    .split('\n')
                    .where((l) => l.trim().isNotEmpty)
                    .map((l) => l.trim())
                    .toList()
                    .asMap()
                    .entries
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 13),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 14.8,
                              height: 1.65,
                              color: Colors.black87,
                            ),
                            children: [
                              TextSpan(
                                text: "${e.key + 1}. ",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              TextSpan(text: e.value),
                            ],
                          ),
                        ),
                      ),
                    ),

                if (resep.tipsPenyajian.trim().isNotEmpty) ...[
                  const SizedBox(height: 16),
                  const Text(
                    "💡Tips Penyajian:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  ...resep.tipsPenyajian
                      .split('\n')
                      .where((l) => l.trim().isNotEmpty)
                      .map((l) => l.trim())
                      .toList()
                      .asMap()
                      .entries
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 14.8,
                                height: 1.65,
                                color: Colors.black87,
                              ),
                              children: [
                                TextSpan(
                                  text: "${e.key + 1}. ",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                TextSpan(text: e.value),
                              ],
                            ),
                          ),
                        ),
                      ),
                ],

                if (resep.sumber.trim().isNotEmpty) ...[
                  const SizedBox(height: 16),
                  const Text(
                    "Sumber:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
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
            child: const Text(
              "Tutup",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Ambil daftar resep yang difavoritkan
    final List<Resep> favoriteList = resepList
        .where((resep) => resep.isFavorite)
        .toList();

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
      ),
      body: favoriteList.isEmpty
          ? const Center(
              child: Text(
                'Belum ada resep favorit 😢',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                final resep = favoriteList[index];
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
                      child: Image.asset(
                        resep.gambar,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
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
                      onPressed: () {
                        setState(() {
                          resep.isFavorite = false;
                        });
                      },
                      tooltip: 'Hapus dari Favorit',
                    ),
                    onTap: () => _showDetailPopup(context, resep),
                  ),
                );
              },
            ),
    );
  }
}
