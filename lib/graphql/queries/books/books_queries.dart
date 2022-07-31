class BookQueries {
  BookQueries._();

  static const String getBookById = r'''
  query getBookById($book_id: Int!) {
  books(where: {id: {_eq: $book_id}}) {
    id
    isbn
    title
    author_id
    thumbnail
  }
}
''';

  static const String getBooksPaginated = r'''
  query getBooksPaginated($limit: Int, $offset: Int) {
    books(limit: $limit, offset: $offset) {
      id
      isbn
      title
      author_id
      thumbnail
    }
    }
  ''';

  static const getBooksPaginatedBySearchKeyword = r'''
  query getBookPaginatedBySearchKeyword($keyword: String, $limit: Int, $offset: Int) {
    books(where: {title: {_like: $keyword}}, limit: $limit, offset: $offset) {
      id
      isbn
      title
      author_id
      thumbnail
    }
    }
  ''';

  static const getBooksAll = r'''
  query getBooksAll {
  list: books {
    id
    isbn
    title
    author_id
    thumbnail
  }
}
''';

}
