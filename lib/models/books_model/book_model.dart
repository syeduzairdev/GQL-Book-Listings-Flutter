class Book {
  int? authorId;
  int? id;
  String? isbn;
  String? thumbnail;
  String? title;

  Book({this.authorId, this.id, this.isbn, this.thumbnail, this.title});

  Book.fromJson(Map<String, dynamic> json) {
    authorId = json['author_id'];
    id = json['id'];
    isbn = json['isbn'];
    thumbnail = json['thumbnail'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_id'] = this.authorId;
    data['id'] = this.id;
    data['isbn'] = this.isbn;
    data['thumbnail'] = this.thumbnail;
    data['title'] = this.title;
    return data;
  }
}
