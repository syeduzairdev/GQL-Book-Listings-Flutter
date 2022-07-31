class Book {
  int? id;
  String? isbn;
  String? title;
  int? authorId;
  String? thumbnail;

  Book({this.id, this.isbn, this.title, this.authorId, this.thumbnail});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isbn = json['isbn'];
    title = json['title'];
    authorId = json['author_id'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isbn'] = this.isbn;
    data['title'] = this.title;
    data['author_id'] = this.authorId;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
