import 'package:smartta/model/model_paket.dart';

class ModelDetailJasa <T>{
  int? id;
  String? nama;
  String? is_jumlah;
  String? slug;
  String? deskripsi_pekerjaan;
  String? url_gambar;
  String? background;
  String? gambar_site;
  T? paket;

  ModelDetailJasa({
    required this.id,
    required this.nama,
    required this.is_jumlah,
    required this.slug,
    required this.deskripsi_pekerjaan,
    required this.url_gambar,
    required this.background,
    required this.gambar_site,
    required this.paket
  });

  factory ModelDetailJasa.fromJson(Map<String?, dynamic> json, Function(Map<String, dynamic>) build) {
    return ModelDetailJasa<T>(
        id: json['id'],
        nama: json['nama'],
        is_jumlah: json['is_jumlah'],
        slug: json['slug'],
        deskripsi_pekerjaan: json['deskripsi_pekerjaan'],
        url_gambar: json['url_gambar'],
        background: json['background'],
        gambar_site: json['gambar_site'],
        paket: build(json['paket'] ?? {}));
  }
}