import 'package:smartta/model/model_paket.dart';

class ModelBanner{
  int? id;
  String? title;
  String? slug;
  String? text;
  String? image;
  String? url_gambar;
  String? created_at;
  String? update_at;

  ModelBanner({
    required this.id,
    required this.title,
    required this.slug,
    required this.text,
    required this.image,
    required this.url_gambar,
    required this.created_at,
    required this.update_at,
  });

  factory ModelBanner.fromJson(Map<String?, dynamic> json) {
    return ModelBanner(
        id: json['id'],
        title: json['title'],
        slug: json['slug'],
        text: json['text'],
        image: json['image'],
        url_gambar: json['url_gambar'],
        created_at: json['created_at'],
        update_at: json['update_at'],
    );
  }
}