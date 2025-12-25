import 'package:flutter/material.dart';
import '../models/resep_model.dart';

class DetailResepPage extends StatelessWidget {
  final Resep resep;

  const DetailResepPage({Key? key, required this.resep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App Bar dengan gambar
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.orange,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                resep.nama,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  resep.gambar.startsWith('http')
                      ? Image.network(
                          resep.gambar,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.restaurant, size: 100),
                            );
                          },
                        )
                      : Image.asset(
                          resep.gambar,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.restaurant, size: 100),
                            );
                          },
                        ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Info kategori dan bahan pokok
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.restaurant_menu,
                              size: 16,
                              color: Colors.orange.shade800,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              resep.kategori,
                              style: TextStyle(
                                color: Colors.orange.shade800,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_basket,
                              size: 16,
                              color: Colors.green.shade800,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              resep.bahanPokok,
                              style: TextStyle(
                                color: Colors.green.shade800,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Bahan-bahan
                  const Text(
                    "🧂 Bahan-bahan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: resep.bahan.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: resep.bahan
                                .split(
                                  RegExp(r'[,\n]'),
                                ) // Split berdasarkan koma atau newline
                                .map((item) => item.trim())
                                .where((item) => item.isNotEmpty)
                                .map((item) {
                                  // Hapus bullet point jika sudah ada
                                  String cleanItem = item;
                                  if (cleanItem.startsWith('•') ||
                                      cleanItem.startsWith('-')) {
                                    cleanItem = cleanItem.substring(1).trim();
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          '- ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            cleanItem,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              height: 1.5,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                })
                                .toList(),
                          )
                        : const Text('Tidak ada data bahan'),
                  ),

                  const SizedBox(height: 30),

                  // Cara membuat
                  const Text(
                    "🍳 Cara Membuat",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 12),

                  if (resep.cara.isNotEmpty)
                    ...resep.cara
                        .split(
                          RegExp(r'[.\n]'),
                        ) // Split berdasarkan titik atau newline
                        .map((step) => step.trim())
                        .where((step) => step.isNotEmpty)
                        .toList()
                        .asMap()
                        .entries
                        .map((entry) {
                          int idx = entry.key + 1;
                          String text = entry.value;

                          // Hapus numbering jika sudah ada
                          final numberPattern = RegExp(r'^\d+\.\s*');
                          if (numberPattern.hasMatch(text)) {
                            text = text.replaceFirst(numberPattern, '').trim();
                          }

                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.orange.shade200),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Nomor
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$idx',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                // Teks langkah
                                Expanded(
                                  child: Text(
                                    text,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      height: 1.6,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                        .toList()
                  else
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('Tidak ada data cara membuat'),
                    ),

                  const SizedBox(height: 30),

                  // Tips penyajian (jika ada)
                  if (resep.tipsPenyajian.trim().isNotEmpty) ...[
                    const Text(
                      "💡 Tips Penyajian",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Text(
                        resep.tipsPenyajian,
                        style: const TextStyle(fontSize: 15, height: 1.6),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
