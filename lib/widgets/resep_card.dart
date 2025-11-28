import 'package:flutter/material.dart';
import 'package:masakyuk/models/resep_model.dart';

class ResepCard extends StatelessWidget {
  final Resep resep;
  final VoidCallback onFavoriteToggle;

  const ResepCard({
    Key? key,
    required this.resep,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        leading: Image.asset(resep.gambar, width: 60, fit: BoxFit.cover),
        title: Text(resep.nama),
        subtitle: Text(resep.kategori),
        trailing: IconButton(
          icon: Icon(
            resep.isFavorite ? Icons.bookmark : Icons.bookmark_border,
            color: resep.isFavorite ? Colors.orange : Colors.grey,
          ),
          onPressed: onFavoriteToggle,
        ),
      ),
    );
  }
}
