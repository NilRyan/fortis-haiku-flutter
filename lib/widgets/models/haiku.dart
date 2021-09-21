class Haiku {
  String id;
  String author;
  String haiku;

  Haiku({required this.id, required this.author, required this.haiku});

  factory Haiku.fromJson(Map<String, dynamic> json) {
    return Haiku(id: json['id'], author: json['author'], haiku: json['haiku']);
  }
}
