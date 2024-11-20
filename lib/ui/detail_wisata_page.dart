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
              // Gambar wisata dalam Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  wisata.gambar,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),

              // Nama Wisata dalam Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    wisata.nama,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),

              // Deskripsi Wisata dalam Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    wisata.deskripsi,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Lokasi (Optional)
              if (wisata.lokasi != null) ...[
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Lokasi: ${wisata.lokasi}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 8),
              ],

              // Jam Operasional (Optional)
              if (wisata.jamOperasional != null) ...[
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Jam Operasional: ${wisata.jamOperasional}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 8),
              ],

              // Tiket Masuk
              if (wisata.tiketMasuk is Map<String, String>) ...[
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Tiket Masuk: ${wisata.tiketMasuk['dewasa']} (Dewasa), ${wisata.tiketMasuk['anak-anak']} (Anak-anak)",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],

              // Parkir (Optional)
              if (wisata.parkir != null) ...[
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Parkir:", style: TextStyle(fontSize: 16)),
                        Text("Roda 2: ${wisata.parkir!.rodaDua}", style: TextStyle(fontSize: 16)),
                        if (wisata.parkir!.rodaEmpat != null) ...[
                          Text("Roda 4: ${wisata.parkir!.rodaEmpat}", style: TextStyle(fontSize: 16)),
                        ],
                        if (wisata.parkir!.bus != null) ...[
                          Text("Bus: ${wisata.parkir!.bus}", style: TextStyle(fontSize: 16)),
                        ],
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],

              // Becak Air (Optional)
              if (wisata.becakAir != null) ...[
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Becak Air: ${wisata.becakAir}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
