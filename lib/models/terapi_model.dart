class Terapi {
  int userId;
  String catatan1;
  String catatan2;
  String catatan3;
  String catatan4;
  String catatan5;
  String catatan6;
  String pertanyaan;

  Terapi({
    required this.userId,
    required this.catatan1,
    required this.catatan2,
    required this.catatan3,
    required this.catatan4,
    required this.catatan5,
    required this.catatan6,
    required this.pertanyaan
  });

  factory Terapi.fromJson(Map<String, dynamic> json){
    return Terapi(
        userId: (json['user_id'] ?? "") as int,
        catatan1: (json['catatan1'] ?? "") as String,
        catatan2: (json['catatan2'] ?? "") as String,
        catatan3: (json['catatan3'] ?? "") as String,
        catatan4: (json['catatan4'] ?? "") as String,
        catatan5: (json['catatan5'] ?? "") as String,
        catatan6: (json['catatan6'] ?? "") as String,
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
      'catatan5': catatan5,
      'catatan6': catatan6,
      'pertanyaan': pertanyaan,
    };
  }

}