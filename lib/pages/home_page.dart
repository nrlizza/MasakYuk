import 'package:flutter/material.dart';
import '../data/resep_data.dart';
import '../models/resep_model.dart';
import 'resep_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> kategori = [
    {"nama": "Semua", "color": Colors.orange.shade100},
    {"nama": "Ayam", "color": Colors.red.shade100},
    {"nama": "Daging", "color": Colors.blue.shade100},
    {"nama": "Seafood", "color": Colors.green.shade100},
    {"nama": "Tepung", "color": Colors.purple.shade100},
    {"nama": "Beras", "color": Colors.teal.shade100},
    {"nama": "Sayur", "color": Colors.lime.shade100},
    {"nama": "Kacang", "color": Colors.lime.shade100},
    {"nama": "Singkong", "color": Colors.pink.shade100},
  ];

  // 🔸 Ambil 3 resep populer dari data utama (resep_data.dart)
  final List<Resep> resepPopuler = resepList.take(3).toList();

  String searchQuery = "";

  void _showDetailPopup(BuildContext context, Resep resep) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
        title: Text(
          resep.nama,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
        ),
        content: SizedBox(
          width: double.maxFinite, // WAJIB! Biar tidak error hasSize
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // GAMBAR
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      resep.gambar,
                      height: 200,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // BAHAN POKOK
                Text(
                  "Bahan Pokok: ${resep.bahanPokok}",
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 16),

                // BAHAN-BAHAN
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

                // CARA MEMBUAT
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
                              fontSize: 15,
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

                // TIPS
                if (resep.tipsPenyajian.trim().isNotEmpty) ...[
                  const SizedBox(height: 20),
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
                                fontSize: 15,
                                height: 1.65,
                                color: Colors.black87,
                              ),
                              children: [
                                TextSpan(
                                  text: "${e.key + 1}. ",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                TextSpan(text: e.value),
                              ],
                            ),
                          ),
                        ),
                      ),
                ],

                // SUMBER
                if (resep.sumber.trim().isNotEmpty) ...[
                  const SizedBox(height: 20),
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
        // INI YANG BIKIN TOMBOL TUTUP MUNCUL DI POJOK KANAN BAWAH
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              "Tutup",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
        actionsAlignment: MainAxisAlignment.end, // INI KUNCI UTAMANYA!
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔸 Header
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrange, Colors.orange],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/img/logo.png', height: 45),
                      const SizedBox(width: 10),
                      const Text(
                        "MasakYuk",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // GANTI SELURUH Column yang ini (yang berisi TextField lama) JADI INI:
                  Column(
                    children: [
                      // SEARCH BAR + TOMBOL X
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Cari resep berdasarkan nama atau bahan...",
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          suffixIcon: searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      searchQuery = "";
                                    });
                                  },
                                )
                              : null,
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                      ),

                      // HASIL PENCARIAN — MUNCUL KALAU ADA TEKS
                      if (searchQuery.trim().isNotEmpty)
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          constraints: const BoxConstraints(maxHeight: 340),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.12),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: resepList
                                .where(
                                  (r) =>
                                      r.nama.toLowerCase().contains(
                                        searchQuery.toLowerCase(),
                                      ) ||
                                      r.bahanPokok.toLowerCase().contains(
                                        searchQuery.toLowerCase(),
                                      ) ||
                                      r.bahan.toLowerCase().contains(
                                        searchQuery.toLowerCase(),
                                      ),
                                )
                                .take(7)
                                .length,
                            itemBuilder: (context, index) {
                              // Daftar hasil pencarian
                              final List<Resep> hasilCari = resepList
                                  .where(
                                    (r) =>
                                        r.nama.toLowerCase().contains(
                                          searchQuery.toLowerCase(),
                                        ) ||
                                        r.bahanPokok.toLowerCase().contains(
                                          searchQuery.toLowerCase(),
                                        ) ||
                                        r.bahan.toLowerCase().contains(
                                          searchQuery.toLowerCase(),
                                        ),
                                  )
                                  .take(7)
                                  .toList();

                              final resep = hasilCari[index];

                              return ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    resep.gambar,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  resep.nama,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.5,
                                  ),
                                ),
                                subtitle: Text(
                                  resep.bahanPokok,
                                  style: TextStyle(
                                    color: Colors.orange[700],
                                    fontSize: 12,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                                onTap: () {
                                  _showDetailPopup(context, resep);
                                  setState(() {
                                    searchQuery =
                                        ""; // otomatis hilang setelah klik
                                  });
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),

            // 🔸 Selamat Datang
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/img/logo.png"),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Selamat Datang!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Mulai masak, yuk hari ini!",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // KATEGORI BAHAN POKOK — BISA DIKLIK & LANGSUNG FILTER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kategori Bahan Pokok",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: kategori.length,
                itemBuilder: (context, index) {
                  final item = kategori[index];
                  final String namaKategori = item['nama'];
                  final Color warna = item['color'];

                  IconData iconData;
                  switch (namaKategori) {
                    case 'Ayam':
                      iconData = Icons.dinner_dining;
                      break;
                    case 'Daging':
                      iconData = Icons.food_bank;
                      break;
                    case 'Ikan':
                      iconData = Icons.set_meal;
                      break;
                    case 'Tepung':
                      iconData = Icons.bakery_dining;
                      break;
                    case 'Beras':
                      iconData = Icons.rice_bowl;
                      break;
                    case 'Sayur':
                      iconData = Icons.eco;
                      break;
                    case 'Kacang':
                      iconData = Icons.spa;
                      break;
                    case 'Singkong':
                      iconData = Icons.yard;
                      break;
                    default:
                      iconData = Icons.restaurant_menu;
                  }

                  return GestureDetector(
                    onTap: () {
                      // Arahkan ke ResepPage + filter berdasarkan kategori
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ResepPage(filterBahanPokok: namaKategori),
                        ),
                      );
                    },
                    child: Container(
                      width: 84,
                      margin: const EdgeInsets.only(left: 16),
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: warna,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.15),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              iconData,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            namaKategori,
                            style: const TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // 🔸 Resep Populer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Resep Populer",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ResepPage()),
                      );
                    },
                    child: const Text(
                      "Lihat Semua >",
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // CARD RESEP POPULER — VERSI SUPER RAPI & PROFESIONAL
            ...resepPopuler.map((resep) {
              return GestureDetector(
                onTap: () => _showDetailPopup(context, resep),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Gambar
                      ClipRRect(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(20),
                        ),
                        child: Image.asset(
                          resep.gambar,
                          width: 130,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Teks di sebelah kanan
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(14, 12, 10, 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Nama Resep — pakai RichText biar rapi kalau panjang
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  children: [TextSpan(text: resep.nama)],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),

                              const SizedBox(height: 6),

                              // Kategori — juga rapi kalau panjang
                              Text(
                                resep.kategori,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13.5,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),

                              const SizedBox(height: 10),

                              // Rating + Favorite
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    "4.8",
                                    style: TextStyle(
                                      fontSize: 13.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    "• ${resep.bahanPokok}", // optional: tambah bahan utama biar lebih informatif
                                    style: const TextStyle(
                                      fontSize: 12.5,
                                      color: Colors.brown,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    iconSize: 26,
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    icon: Icon(
                                      resep.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: resep.isFavorite
                                          ? Colors.red
                                          : Colors.grey.shade600,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        resep.isFavorite = !resep.isFavorite;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),

            // 🔸 Tips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: const [
                    Icon(Icons.lightbulb, color: Colors.orange),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Tips hari ini: Gunakan bahan segar untuk cita rasa yang lebih nikmat!",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
