import 'package:aplikasi_wisata_magetan/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/app_routes.dart';
import 'common/styles/theme.dart';

void main() {
  runApp(const MyApp());
}

// root aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final MaterialTheme materialTheme = MaterialTheme(
      GoogleFonts.ralewayTextTheme()
    );

    return SafeArea(
      child: MaterialApp(
        title: 'Aplikasi Wisata Kota Magetan',
        theme: materialTheme.light(),
        darkTheme: materialTheme.dark(),
        initialRoute: HomePage.routeName,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}