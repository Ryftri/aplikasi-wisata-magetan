import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/models/model_list_wisata.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<ListWisata>> futureWisata;

  Future<List<ListWisata>> fetchWisataData() async {
    final String response = await rootBundle.loadString('public/data_wisata.json');
    return listWisataFromJson(response); // Pastikan fungsi `wisataFromJson` sesuai dengan model Wisata
  }

  @override
  void initState() {
    super.initState();
    futureWisata = fetchWisataData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Wisata"),
      ),
      body: Center(
        child: FutureBuilder<List<ListWisata>>(
          future: futureWisata,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text("Tidak ada data ditemukan");
            } else {
              final wisataList = snapshot.data!;
              return ListView.builder(
                itemCount: wisataList.length,
                itemBuilder: (context, index) {
                  final wisata = wisataList[index];
                  return ListTile(
                    leading: Image.asset(wisata.gambar),
                    title: Text(wisata.nama),
                    subtitle: Text(wisata.deskripsi),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}