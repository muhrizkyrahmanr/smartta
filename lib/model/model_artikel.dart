import 'package:smartta/model/model_paket.dart';

class ModelArtikel{
  int? id;
  int? user_id;
  String? title;
  String? slug;
  String? text;
  String? image;
  String? url_gambar;
  String? jenis;

  ModelArtikel({
    required this.id,
    required this.user_id,
    required this.title,
    required this.slug,
    required this.text,
    required this.image,
    required this.url_gambar,
    required this.jenis,
  });

  factory ModelArtikel.fromJson(Map<String?, dynamic> json) {
    return ModelArtikel(
      id: json['id'],
      user_id: json['user_id'],
      title: json['title'],
      slug: json['slug'],
      text: json['text'],
      image: json['image'],
      url_gambar: json['url_gambar'],
      jenis: json['jenis'],
    );
  }
}