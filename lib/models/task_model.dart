class Task {
  int id;
  int userId;
  int psikoedukasi;
  int relaksasi;
  int restrukturisasi;
  int terapi;

  Task({
    required this.id,
    required this.userId,
    required this.psikoedukasi,
    required this.relaksasi,
    required this.restrukturisasi,
    required this.terapi,
  });

  factory Task.fromJson(Map<String, dynamic> json){
    return Task(
        id: (json['id']??"") as int,
        userId: (json['user_id']??"") as int,
        psikoedukasi: (json['psikoedukasi']??"") as int,
        relaksasi: (json['relaksasi'] ?? "") as int,
        restrukturisasi: (json['restrukturisasi']??"") as int,
        terapi: (json['terapi'] ?? "") as int
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'id': id,
      'user_id': userId,
      'psikoedukasi': psikoedukasi,
      'relaksasi': relaksasi,
      'restrukturisasi': restrukturisasi,
      'terapi': terapi,
    };
  }

}