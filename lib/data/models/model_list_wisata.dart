// To parse this JSON data, do
//
//     final listWisata = listWisataFromJson(jsonString);

import 'dart:convert';

List<ListWisata> listWisataFromJson(String str) => List<ListWisata>.from(json.decode(str).map((x) => ListWisata.fromJson(x)));

String listWisataToJson(List<ListWisata> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListWisata {
  String nama;
  String deskripsi;
  String? lokasi;
  String? jamBuka;
  dynamic tiketMasuk;
  String gambar;
  String? jamOperasional;
  Parkir? parkir;
  String? becakAir;

  ListWisata({
    required this.nama,
    required this.deskripsi,
    this.lokasi,
    this.jamBuka,
    required this.tiketMasuk,
    required this.gambar,
    this.jamOperasional,
    this.parkir,
    this.becakAir,
  });

  factory ListWisata.fromJson(Map<String, dynamic> json) => ListWisata(
    nama: json["nama"],
    deskripsi: json["deskripsi"],
    lokasi: json["lokasi"],
    jamBuka: json["jam_buka"],
    tiketMasuk: json["tiket_masuk"],
    gambar: json["gambar"],
    jamOperasional: json["jam_operasional"],
    parkir: json["parkir"] == null ? null : Parkir.fromJson(json["parkir"]),
    becakAir: json["becak_air"],
  );

  Map<String, dynamic> toJson() => {
    "nama": nama,
    "deskripsi": deskripsi,
    "lokasi": lokasi,
    "jam_buka": jamBuka,
    "tiket_masuk": tiketMasuk,
    "gambar": gambar,
    "jam_operasional": jamOperasional,
    "parkir": parkir?.toJson(),
    "becak_air": becakAir,
  };
}

class Parkir {
  String? rodaEmpat;
  String rodaDua;
  String? bus;

  Parkir({
    this.rodaEmpat,
    required this.rodaDua,
    this.bus,
  });

  factory Parkir.fromJson(Map<String, dynamic> json) => Parkir(
    rodaEmpat: json["roda_empat"],
    rodaDua: json["roda_dua"],
    bus: json["bus"],
  );

  Map<String, dynamic> toJson() => {
    "roda_empat": rodaEmpat,
    "roda_dua": rodaDua,
    "bus": bus,
  };
}

class TiketMasukClass {
  String dewasa;
  String anakAnak;

  TiketMasukClass({
    required this.dewasa,
    required this.anakAnak,
  });

  factory TiketMasukClass.fromJson(Map<String, dynamic> json) => TiketMasukClass(
    dewasa: json["dewasa"],
    anakAnak: json["anak-anak"],
  );

  Map<String, dynamic> toJson() => {
    "dewasa": dewasa,
    "anak-anak": anakAnak,
  };
}
