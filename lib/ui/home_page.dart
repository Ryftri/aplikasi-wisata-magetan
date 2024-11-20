import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/models/model_list_wisata.dart';
import '../widgets/wisata_card.dart';
import 'detail_wisata_page.dart';

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
    return listWisataFromJson(response);
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
                  return WisataCard(
                    wisata: wisata,
                    onTap: () {
                      // Navigasi ke halaman detail dengan pushNamed dan mengirim data melalui arguments
                      Navigator.pushNamed(
                        context,
                        DetailPage.routeName,
                        arguments: wisata,
                      );
                    },
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
