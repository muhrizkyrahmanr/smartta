class ModelPaket <T> {
  int? id;
  int? service_id;
  String? paket;
  String? harga;

  ModelPaket({
    required this.id,
    required this.service_id,
    required this.paket,
    required this.harga,
  });

  factory ModelPaket.fromJson(Map<String, dynamic> json) {
    return ModelPaket(
        id: json['id'],
        service_id: json['service_id'],
        paket: json['paket'],
        harga: json['harga']);
  }
}
