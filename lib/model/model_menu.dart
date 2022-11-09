class ModelMenu{
  int? id;
  String? nama;
  String? is_jumlah;
  String? slug;
  String? deskripsi_pekerjaan;
  String? url_gambar;
  String? background;
  String? gambar_site;

  ModelMenu({
    required this.id,
    required this.nama,
    required this.is_jumlah,
    required this.slug,
    required this.deskripsi_pekerjaan,
    required this.url_gambar,
    required this.background,
    required this.gambar_site,
  });

  factory ModelMenu.fromJson(Map<String?, dynamic> json) {
    return ModelMenu(
        id: json['id'],
        nama: json['nama'],
        is_jumlah: json['is_jumlah'],
        slug: json['slug'],
        deskripsi_pekerjaan: json['deskripsi_pekerjaan'],
        url_gambar: json['url_gambar'],
        background: json['background'],
        gambar_site: json['gambar_site']);
  }
}