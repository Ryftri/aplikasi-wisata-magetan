import 'package:flutter/material.dart';
import '../data/models/model_list_wisata.dart';

class DetailPage extends StatelessWidget {
  static const routeName = 'detail_wisata_page';

  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data wisata yang diteruskan melalui arguments
    final ListWisata wisata = ModalRoute.of(context)!.settings.arguments as ListWisata;

    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.nama),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar wisata
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  wisata.gambar,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              // Nama Wisata
              Text(
                wisata.nama,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              // Deskripsi Wisata
              Text(
                wisata.deskripsi,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 16),
              // Lokasi
              if (wisata.lokasi != null) ...[
                Text("Lokasi: ${wisata.lokasi}", style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
              ],
              // Jam Operasional
              if (wisata.jamOperasional != null) ...[
                Text("Jam Operasional: ${wisata.jamOperasional}", style: TextStyle(fontSize: 16)),
                SizedBox(height: 8),
              ],
              // Tiket Masuk
              Text("Tiket Masuk: ${wisata.tiketMasuk['dewasa']} (Dewasa), ${wisata.tiketMasuk['anak-anak']} (Anak-anak)", style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              // Parkir
              if (wisata.parkir != null) ...[
            
