class Document {
  int id;
  String name;
  String documentLink;

  Document({
    required this.id,
    required this.name,
    required this.documentLink,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: (json['id'] ?? "") as int,
      name: (json['name'] ?? "") as String,
      documentLink: (json['document_link'] ?? "") as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'document_link': documentLink
    };
  }

}
