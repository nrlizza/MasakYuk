import 'package:flutter/material.dart';
import 'package:masakyuk/data/resep_data.dart';
import 'package:masakyuk/models/resep_model.dart';

class ResepPage extends StatefulWidget {
  final String? filterBahanPokok;
  const ResepPage({Key? key, this.filterBahanPokok}) : super(key: key);

  @override
  State<ResepPage> createState() => _ResepPageState();
}

class _ResepPageState extends State<ResepPage> {
  String selectedBahan = "Semua";
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    if (widget.filterBahanPokok != null) {
      selectedBahan = widget.filterBahanPokok!;
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
    // Filter resep berdasarkan bahan pokok dan pencarian
    final filteredList = resepList.where((resep) {
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
                                  resep.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: resep.isFavorite
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    resep.isFavorite = !resep.isFavorite;
                                  });
                                },
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
