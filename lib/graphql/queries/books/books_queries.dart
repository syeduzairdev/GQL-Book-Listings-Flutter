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

  static const getBooksPaginatedBySearch = r'''
  query getBookPaginatedBySearchKeyword($search: String, $limit: Int, $offset: Int) {
    books(where: {title: {_like: $search}}, limit: $limit, offset: $offset) {
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

// /create book mutation
  static const createBook = r'''
  mutation createBook(
    $isbn: String!,
    $title: String!,
    $author_id: Int!, 
    $thumbnail: String!
  ){
    book: insert_books_one(object:{
      isbn:$isbn,
      title:$title,
      author_id:$author_id,
      thumbnail: $thumbnail 
    }) {
        id
        isbn
        title
        author_id
        thumbnail
      }
  }
  ''';

  // update books mutation
  static const updateBook = r'''
  mutation updateBook($id: Int!, $isbn: String, $title: String, $author_id: Int, $thumbnail: String) {
    update_books(
      where: {id: {_eq: $id}},
     _set: {isbn: $isbn, title: $title, author_id: $author_id, thumbnail: $thumbnail}) {
      returning {
        id
        isbn
        title
        author_id
        thumbnail
      }
    }
  }
  ''';

  // delete books mutation by id
  static const deleteBook = r'''
  mutation deleteBook($id: Int!) {
    delete_books(where: {id: {_eq: $id}}) {
      returning {
        id
        isbn
        title
        author_id
        thumbnail
      }
    }
  }
  ''';
}
