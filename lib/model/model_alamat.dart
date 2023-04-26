class ModelAlamat{
  int? id;
  String? nama;
  String? alamat;
  String? provinsi;
  String? kota;
  String? kecamatan;
  String? no_hp;
  String? created_at;
  String? updated_at;

  ModelAlamat({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.provinsi,
    required this.kota,
    required this.kecamatan,
    required this.no_hp,
    required this.created_at,
    required this.updated_at,
  });

  factory ModelAlamat.fromJson(Map<String, dynamic> json) {
    return ModelAlamat(
        id: json['id'],
        nama: json['nama'],
        alamat: json['alamat'],
        provinsi: json['provinsi'],
        kota: json['kota'],
        kecamatan: json['kecamatan'],
        no_hp: json['no_hp'],
        created_at: json['created_at'],
        updated_at: json['updated_at']
    );
  }
}
