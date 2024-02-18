class WindDirectionData {
  final String deskripsi;

  WindDirectionData({required this.deskripsi});

  factory WindDirectionData.fromJson(Map<String, dynamic> json) {
    return WindDirectionData(
      deskripsi: json['CARD_description'],
    );
  }
}
