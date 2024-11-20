import 'package:flutter/material.dart';
import '../data/models/model_list_wisata.dart';

class WisataCard extends StatelessWidget {
  final ListWisata wisata;
  final VoidCallback onTap;

  const WisataCard({
    super.key,
    required this.wisata,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      elevation: 5, // Add shadow for a card effect
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: onTap, // Fungsi saat kartu diklik
        child: ListTile(
          contentPadding: EdgeInsets.all(8.0),
          leading: Container(
            width: 80,  // Set the fixed width for the image
            height: 80,  // Set the fixed height for the image
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(wisata.gambar),
                fit: BoxFit.cover,  // Ensure the image fills the box without distortion
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          title: Text(wisata.nama),
        ),
      ),
    );
  }
}
