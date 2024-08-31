class Relaksasi {
  int userId;
  String catatan1;
  String catatan2;
  String catatan3;
  String catatan4;
  String pertanyaan;

  Relaksasi({
    required this.userId,
    required this.catatan1,
    required this.catatan2,
    required this.catatan3,
    required this.catatan4,
    required this.pertanyaan
  });

  factory Relaksasi.fromJson(Map<String, dynamic> json){
    return Relaksasi(
        userId: (json['user_id'] ?? "") as int,
        catatan1: (json['catatan1'] ?? "") as String,
        catatan2: (json['catatan2'] ?? "") as String,
        catatan3: (json['catatan3'] ?? "") as String,
        catatan4: (json['catatan4'] ?? "") as String,
        pertanyaan: (json['pertanyaan'] ?? "") as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'catatan1': catatan1,
      'catatan2': catatan2,
      'catatan3': catatan3,
      'catatan4': catatan4,
      'pertanyaan': pertanyaan,
    };
  }


}